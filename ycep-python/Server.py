import json
import uuid

import redis as redis
from thrift.protocol import TBinaryProtocol
from thrift.server import TServer
from thrift.transport import TSocket, TTransport

from ai.abstract import get_prompt_abstract, send_abstract
from ai.body import get_prompt, send
from ai.keyword import get_prompt_keyword, send_keyword
from rpc import AIService


class RpcHandler:
    def __init__(self):
        # redis连接池
        pool = redis.ConnectionPool(host='localhost', port=6379, db=6, password='123456', decode_responses=True)
        self.redis = redis.Redis(connection_pool=pool)

    def __del__(self):
        self.redis.connection_pool.disconnect()

    def newSession(self, theme, part):
        """
        创建一个新的会话，在redis中添加一条记录用户存储message，以便进行多轮会话
        :param theme:
        :param part:
        :return: 返回sessionKey和AI初始响应
        """
        # 创建缓存，有效期2小时
        sessionKey = str(uuid.uuid4())
        messages = []
        self.redis.set(sessionKey, json.dumps(messages), ex=7200)

        # 获取并发送prompt
        prompt = get_prompt(theme, part)
        msgs, response = send(messages, prompt)

        # 更新缓存
        self.redis.set(sessionKey, json.dumps(msgs), ex=7200)
        resp = {
            "sessionKey": sessionKey,
            "AI": response
        }
        return json.dumps(resp)

    def chat(self, content, sessionKey):
        """
        :param content: 用户消息
        :param sessionKey: redis key，用于提取多轮对话记录
        :return: 返回AI对话的结果
        """
        value = self.redis.get(sessionKey)
        if value is None:
            return "sessionKey无效"
        messages = json.loads(value)
        # 调用API
        msgs, response = send(messages, content)
        # 更新缓存
        self.redis.set(sessionKey, json.dumps(msgs), ex=7200)
        return response

    def resetSession(self, sessionKey):
        """
        重置会话，删除reids对应的记录中除了prompt之外的部分
        :param sessionKey:
        """
        value = self.redis.get(sessionKey)
        if value is None:
            return False
        messages = json.loads(value)
        # 重置（保留prompt和第一次回应）
        del messages[2:]
        # 更新缓存
        self.redis.set(sessionKey, json.dumps(messages), ex=7200)
        return True

    def closeSession(self, sessionKey):
        """
        关闭会话，删除reids对应记录
        :param sessionKey:
        """
        if self.redis.exists(sessionKey) == 0:
            return False
        else:
            self.redis.delete(sessionKey)
            return True

    def getBriefAndKeywords(self, theme, article):
        # 获取摘要
        prompt_abstract = get_prompt_abstract(theme)
        abstract = send_abstract(prompt_abstract, article)
        # 获取关键词
        prompt_keyword = get_prompt_keyword(abstract)
        keyword = send_keyword(prompt_keyword)
        # 返回
        resp = {
            "abstract": abstract,
            "keyword": keyword
        }
        return json.dumps(resp)


# 启动服务
if __name__ == '__main__':
    handler = RpcHandler()
    processor = AIService.Processor(handler)
    transport = TSocket.TServerSocket(host='127.0.0.1', port=12345)
    tfactory = TTransport.TBufferedTransportFactory()
    pfactory = TBinaryProtocol.TBinaryProtocolFactory()

    server = TServer.TSimpleServer(processor, transport, tfactory, pfactory)
    print('Starting the Python server...')
    server.serve()

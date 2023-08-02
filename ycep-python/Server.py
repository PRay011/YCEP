import json
import uuid

import redis as redis
from thrift.protocol import TBinaryProtocol
from thrift.server import TServer
from thrift.transport import TSocket, TTransport

from main import send
from rpc import AIService


class RpcHandler:
    def __init__(self):
        # redis连接池
        pool = redis.ConnectionPool(host='localhost', port=6379, db=6, password='123456', decode_responses=True)
        self.redis = redis.Redis(connection_pool=pool)

    def __del__(self):
        self.redis.connection_pool.disconnect()

    def newSession(self):
        """
        创建一个新的会话，在redis中添加一条记录用户存储message，以便进行多轮会话
        返回sessionKey
        """
        sessionKey = str(uuid.uuid4())
        messages = []
        # 创建缓存，有效期2小时
        self.redis.set(sessionKey, json.dumps(messages), ex=7200)
        return sessionKey

    def chat(self, content, sessionKey, sessionType):
        """
        :param content: 用户消息
        :param sessionKey: redis-key，用于提取多轮对话记录
        :param sessionType: 请求类别，如第几章
        返回AI对话的结果
        """
        messages = json.loads(self.redis.get(sessionKey))
        # 调用API
        msgs, response = send(messages, content)
        # 更新缓存，有效期2小时
        self.redis.set(sessionKey, json.dumps(msgs), ex=7200)
        return response

    def closeSession(self, sessionKey):
        """
        关闭会话，删除reids对应记录,不需要返回
        """
        self.redis.delete(sessionKey)


# 启动服务
if __name__ == '__main__':
    handler = RpcHandler()
    processor = AIService.Processor(handler)
    transport = TSocket.TServerSocket(host='localhost', port=9090)
    tfactory = TTransport.TBufferedTransportFactory()
    pfactory = TBinaryProtocol.TBinaryProtocolFactory()

    server = TServer.TSimpleServer(processor, transport, tfactory, pfactory)
    print('Starting the Python server...')
    server.serve()

# 本地开发测试
# if __name__ == '__main__':
#     handler = RpcHandler()
#     sessionKey = handler.newSession()
#     while True:
#         # 模拟用户输入
#         content = input("user: ")
#         # 分章节
#         sessionType = 0
#         # 调用接口
#         response = handler.chat(content, sessionKey, sessionType)
#         print(f"AI: {response}")

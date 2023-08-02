package cn.edu.csu.ycepspring.rpc;

import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.transport.TSocket;
import org.apache.thrift.transport.TTransport;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * RPC远程调用客户端
 */
@Component
public class ThriftClient {
    @Value("${thrift.server.host}")
    private String serverHost;

    @Value("${thrift.server.port}")
    private int serverPort;

    /**
     * 创建一个新的对话
     */
    public String newSession() {
        try {
            TTransport transport = new TSocket(serverHost, serverPort);
            transport.open();
            TProtocol protocol = new TBinaryProtocol(transport);
            AIService.Client client = new AIService.Client(protocol);
            // 返回结果
            String result = client.newSession();
            transport.close();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 多轮对话
     */
    public String chat(String content, String sessionKey, int sessionType) {
        try {
            TTransport transport = new TSocket(serverHost, serverPort);
            transport.open();
            TProtocol protocol = new TBinaryProtocol(transport);
            AIService.Client client = new AIService.Client(protocol);
            // 返回结果
            String result = client.chat(content, sessionKey, sessionType);
            transport.close();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 关闭会话
     */
    public void closeSession(String sessionKey) {
        try {
            TTransport transport = new TSocket(serverHost, serverPort);
            transport.open();
            TProtocol protocol = new TBinaryProtocol(transport);
            AIService.Client client = new AIService.Client(protocol);
            // 远程调用
            client.closeSession(sessionKey);
            transport.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

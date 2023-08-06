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
    public String newSession(String theme, String part) {
        try {
            TTransport transport = new TSocket(serverHost, serverPort);
            transport.open();
            TProtocol protocol = new TBinaryProtocol(transport);
            AIService.Client client = new AIService.Client(protocol);
            // 返回结果
            String result = client.newSession(theme, part);
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
    public String chat(String content, String sessionKey) {
        try {
            TTransport transport = new TSocket(serverHost, serverPort);
            transport.open();
            TProtocol protocol = new TBinaryProtocol(transport);
            AIService.Client client = new AIService.Client(protocol);
            // 返回结果
            String result = client.chat(content, sessionKey);
            transport.close();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 重置会话
     */
    public boolean resetSession(String sessionKey) {
        try {
            TTransport transport = new TSocket(serverHost, serverPort);
            transport.open();
            TProtocol protocol = new TBinaryProtocol(transport);
            AIService.Client client = new AIService.Client(protocol);
            // 返回结果
            boolean result = client.resetSession(sessionKey);
            transport.close();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 关闭会话
     */
    public boolean closeSession(String sessionKey) {
        try {
            TTransport transport = new TSocket(serverHost, serverPort);
            transport.open();
            TProtocol protocol = new TBinaryProtocol(transport);
            AIService.Client client = new AIService.Client(protocol);
            // 返回结果
            boolean result = client.closeSession(sessionKey);
            transport.close();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}

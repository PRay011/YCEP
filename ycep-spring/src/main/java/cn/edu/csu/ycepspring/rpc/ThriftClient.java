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

    public String chat(String message) {
        try {
            TTransport transport = new TSocket(serverHost, serverPort);
            transport.open();
            TProtocol protocol = new TBinaryProtocol(transport);
            AIService.Client client = new AIService.Client(protocol);
            // 返回结果
            String result = client.chat(message);
            transport.close();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}

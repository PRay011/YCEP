package cn.edu.csu.ycepspring.controller;

import cn.edu.csu.ycepspring.common.response.CommonResponse;
import cn.edu.csu.ycepspring.entity.po.mysql.AiChat;
import cn.edu.csu.ycepspring.rpc.ThriftClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/ai")
public class AIController {
    @Autowired
    private ThriftClient thriftClient;

    @GetMapping("/newSession")
    public CommonResponse newSession() {
        return CommonResponse.success(thriftClient.newSession());
    }

    @GetMapping("/chat")
    public CommonResponse chat(@RequestBody AiChat aiChat) {
        String resp = thriftClient.chat(aiChat.getContent(), aiChat.getSessionKey(), aiChat.getSessionType());
        return CommonResponse.success(resp);
    }

    @GetMapping("/closeSession")
    public CommonResponse closeSession(String sessionKey) {
        thriftClient.closeSession(sessionKey);
        return CommonResponse.success();
    }
}

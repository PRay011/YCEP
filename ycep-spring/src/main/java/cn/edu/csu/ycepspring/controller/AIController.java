package cn.edu.csu.ycepspring.controller;

import cn.edu.csu.ycepspring.common.response.CommonResponse;
import cn.edu.csu.ycepspring.entity.dto.AiChat;
import cn.edu.csu.ycepspring.entity.dto.AiParam;
import cn.edu.csu.ycepspring.rpc.ThriftClient;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/ai")
public class AIController {
    @Autowired
    private ThriftClient thriftClient;

    /**
     * 创建会话
     *
     * @return sessionKey、AI初始语句
     */
    @PostMapping("/newSession")
    public CommonResponse newSession(@RequestBody AiParam aiParam) throws JsonProcessingException {
        String resp = thriftClient.newSession(aiParam.getTheme(), aiParam.getPart());
        ObjectMapper mapper = new ObjectMapper();
        Map<String, String> tmpMap = mapper.readValue(resp, Map.class);
        return CommonResponse.success(tmpMap.get("AI"), tmpMap.get("sessionKey"));
    }

    /**
     * 对话
     *
     * @param aiChat
     * @return
     */
    @PostMapping("/chat")
    public CommonResponse chat(@RequestBody AiChat aiChat) {
        String resp = thriftClient.chat(aiChat.getContent(), aiChat.getSessionKey());
        if (resp.equals("sessionKey无效")) {
            return CommonResponse.error("sessionKey无效");
        }
        return CommonResponse.success(resp);
    }

    /**
     * 重置会话
     *
     * @param sessionKey
     * @return
     */
    @PutMapping("/resetSession")
    public CommonResponse resetSession(String sessionKey) {
        boolean result = thriftClient.resetSession(sessionKey);
        if (result) {
            return CommonResponse.success("重置成功");
        } else {
            return CommonResponse.error("sessionKey无效");
        }
    }

    /**
     * 关闭会话
     *
     * @param sessionKey
     * @return
     */
    @DeleteMapping("/closeSession")
    public CommonResponse closeSession(String sessionKey) {
        boolean result = thriftClient.closeSession(sessionKey);
        if (result) {
            return CommonResponse.success("删除成功");
        } else {
            return CommonResponse.error("sessionKey无效");
        }
    }
}

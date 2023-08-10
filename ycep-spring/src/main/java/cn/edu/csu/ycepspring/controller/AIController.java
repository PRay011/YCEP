package cn.edu.csu.ycepspring.controller;

import cn.dev33.satoken.stp.StpUtil;
import cn.edu.csu.ycepspring.common.response.CommonResponse;
import cn.edu.csu.ycepspring.common.utils.TimeUtils;
import cn.edu.csu.ycepspring.entity.dto.AiChat;
import cn.edu.csu.ycepspring.entity.dto.AiParam;
import cn.edu.csu.ycepspring.entity.dto.ArticleVO;
import cn.edu.csu.ycepspring.entity.po.mongo.PaperDocument;
import cn.edu.csu.ycepspring.rpc.ThriftClient;
import cn.edu.csu.ycepspring.service.PaperService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/ai")
public class AIController {
    @Autowired
    private ThriftClient thriftClient;

    @Autowired
    private PaperService paperService;

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

    /**
     * 获取摘要和关键词
     *
     * @param articleVO
     * @return
     * @throws JsonProcessingException
     */
    @PostMapping("/getBriefAndKeywords")
    public CommonResponse getBriefAndKeywords(@RequestBody ArticleVO articleVO) throws JsonProcessingException {
        String theme = articleVO.getTitle();
        String article = String.format(
                "项目名称：%s   【研究背景和必要性分析】 %s  【创意来源】 %s  【基本设计】 %s 【创新点】 %s",
                articleVO.getTitle(),
                articleVO.getContent().get(0),
                articleVO.getContent().get(1),
                articleVO.getContent().get(2),
                articleVO.getContent().get(3)
        );
        String resp = thriftClient.getBriefAndKeywords(theme, article);
        // 反序列化
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> tmpMap = mapper.readValue(resp, Map.class);
        // 关键词分割
        String[] keyword = ((String) tmpMap.get("keyword")).split("[、+]");
        tmpMap.put("keyword", keyword);
        return CommonResponse.success(tmpMap);
    }

    @PostMapping("/paper")
    public CommonResponse submitPaper(@RequestBody PaperDocument paperDocument) {
        int account = StpUtil.getLoginIdAsInt();
        paperDocument.setAccount(account);
        paperDocument.setTime(TimeUtils.getTimeNow());

        paperService.savePaper(paperDocument);
        return CommonResponse.success("提交成功");
    }

    @GetMapping("/paper")
    public CommonResponse getPapers() {
        int account = StpUtil.getLoginIdAsInt();
        List<PaperDocument> paperDocuments = paperService.getPapers(account);
        return CommonResponse.success(paperDocuments);
    }
}

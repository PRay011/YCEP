package cn.edu.csu.ycepspring.controller;

import cn.dev33.satoken.stp.StpUtil;
import cn.edu.csu.ycepspring.common.response.CommonResponse;
import cn.edu.csu.ycepspring.entity.dto.KnowledgeAndGame;
import cn.edu.csu.ycepspring.entity.po.mysql.Game;
import cn.edu.csu.ycepspring.service.InterestService;
import cn.edu.csu.ycepspring.service.MainPageService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/main")
public class MainPageController {
    @Autowired
    private InterestService interestService;

    @Autowired
    private MainPageService mainPageService;

    @GetMapping("/interest/knowledge")
    public CommonResponse recommendKnowledge() {
        int account = StpUtil.getLoginIdAsInt();
        return CommonResponse.success(interestService.recommendKnowledge(account));
    }

    @GetMapping("/interest/game")
    public CommonResponse recommendGame() {
        int account = StpUtil.getLoginIdAsInt();
        return CommonResponse.success(interestService.recommendGame(account));
    }

    @GetMapping("/knowledge")
    public CommonResponse getKindAndItem() {
        return CommonResponse.success(mainPageService.getKindAndItem());
    }

    @GetMapping("/game/{knowledgeID}")
    public CommonResponse getGameList(@PathVariable("knowledgeID") int knowledgeId, @RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize) {
        PageInfo<Game> pageInfo = PageHelper.startPage(pageNum, pageSize).doSelectPageInfo(() -> {
            mainPageService.getGameList(knowledgeId);
        });
        return CommonResponse.success(pageInfo);
    }

    @GetMapping("/knowledge/{itemID}")
    public CommonResponse getKnowledgeAndGame(@PathVariable("itemID") int itemId, @RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize) {
        PageInfo<KnowledgeAndGame> pageInfo = PageHelper.startPage(pageNum, pageSize).doSelectPageInfo(() -> {
            mainPageService.getKnowledgeAndGame(itemId);
        });
        return CommonResponse.success(pageInfo);
    }

    @GetMapping("/knowledge/info/{id}")
    public CommonResponse getKnowledgeInfo(@PathVariable("id") int id) {
        return CommonResponse.success(mainPageService.getKnowledgeInfo(id));
    }
}

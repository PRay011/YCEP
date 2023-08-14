package cn.edu.csu.ycepspring.controller;

import cn.dev33.satoken.stp.StpUtil;
import cn.edu.csu.ycepspring.common.response.CommonResponse;
import cn.edu.csu.ycepspring.service.InterestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/interest")
public class InterestController {
    @Autowired
    private InterestService interestService;

    /**
     * 先删除老的，再添加新的
     */
    @PostMapping("/knowledge")
    public CommonResponse submitInterest(@RequestBody int[] itemIds) {
        int account = StpUtil.getLoginIdAsInt();
        interestService.insertInterest(account, itemIds);
        return CommonResponse.success();
    }

    @GetMapping("/my")
    public CommonResponse getMyInterest() {
        int account = StpUtil.getLoginIdAsInt();
        return CommonResponse.success(interestService.getMyInterest(account));
    }
}

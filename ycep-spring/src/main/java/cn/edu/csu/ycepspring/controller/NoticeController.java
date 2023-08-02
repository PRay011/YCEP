package cn.edu.csu.ycepspring.controller;

import cn.edu.csu.ycepspring.common.response.CommonResponse;
import cn.edu.csu.ycepspring.entity.Notice;
import cn.edu.csu.ycepspring.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/notice")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    @PostMapping
    public CommonResponse addNotice(@RequestBody String content) {
        Notice notice = new Notice(content);
        noticeService.addNotice(notice);
        return CommonResponse.success();
    }

    /**
     * 软删除
     */
    @DeleteMapping
    public CommonResponse deleteNotice(@RequestParam("id") int id) {
        noticeService.deleteNotice(id);
        return CommonResponse.success();
    }

    @GetMapping
    public CommonResponse getNotice() {
        List<Notice> notices = noticeService.getNotice();
        return CommonResponse.success(notices);
    }
}

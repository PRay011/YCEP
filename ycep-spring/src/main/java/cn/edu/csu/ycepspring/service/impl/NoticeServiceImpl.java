package cn.edu.csu.ycepspring.service.impl;

import cn.edu.csu.ycepspring.entity.po.mysql.Notice;
import cn.edu.csu.ycepspring.mapper.NoticeMapper;
import cn.edu.csu.ycepspring.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public void addNotice(Notice notice) {
        noticeMapper.insertNotice(notice);
    }

    @Override
    public void deleteNotice(int id) {
        noticeMapper.markNoticeDeleted(id);
    }

    @Override
    public List<Notice> getNotice() {
        return noticeMapper.selectNotice();
    }
}

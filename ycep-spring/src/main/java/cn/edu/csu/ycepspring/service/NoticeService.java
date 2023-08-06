package cn.edu.csu.ycepspring.service;

import cn.edu.csu.ycepspring.entity.po.mysql.Notice;

import java.util.List;

public interface NoticeService {
    void addNotice(Notice notice);

    void deleteNotice(int id);

    List<Notice> getNotice();
}

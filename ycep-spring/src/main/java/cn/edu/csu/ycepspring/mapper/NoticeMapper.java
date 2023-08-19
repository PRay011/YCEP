package cn.edu.csu.ycepspring.mapper;

import cn.edu.csu.ycepspring.entity.po.mysql.Notice;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface NoticeMapper {
    void insertNotice(Notice notice);

    void markNoticeDeleted(@Param("id") int id);

    List<Notice> selectNotice();
}

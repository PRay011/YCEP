package cn.edu.csu.ycepspring.entity;

import cn.edu.csu.ycepspring.common.utils.TimeUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice {
    private int id;
    private String content;
    private String releaseTime;
    private boolean isDelete;

    public Notice(String content) {
        this.content = content;
        this.releaseTime = TimeUtils.getTimeNow();
        this.isDelete = false;
    }
}

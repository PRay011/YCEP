package cn.edu.csu.ycepspring.entity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GameVO {
    private int id;
    private String kindName;
    private String imgSrc;
    private String title;
    private String author;
    private String desc;
}

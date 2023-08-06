package cn.edu.csu.ycepspring.entity.po.mysql;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Game {
    private int gameId;
    private String title;
    private String author;
    private String description;
    private String imgSrc;
}

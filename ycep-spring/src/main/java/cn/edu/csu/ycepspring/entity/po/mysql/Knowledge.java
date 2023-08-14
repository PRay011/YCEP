package cn.edu.csu.ycepspring.entity.po.mysql;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Knowledge {
    private int knowledgeId;
    private String title;
    private String author;
    private String description;
    private String imgSrc;
    private List<Game> games;
}

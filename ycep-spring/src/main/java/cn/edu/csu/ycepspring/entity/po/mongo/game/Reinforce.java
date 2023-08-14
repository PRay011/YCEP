package cn.edu.csu.ycepspring.entity.po.mongo.game;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reinforce {
    private String question;
    private List<String> choice;
    private int answer;
    private String explain;
    private double score;
}

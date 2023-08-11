package cn.edu.csu.ycepspring.entity.po.mongo.game;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GameRole {
    @Id
    private int id;
    private String name;
    private String imgSrc;
}

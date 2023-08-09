package cn.edu.csu.ycepspring.entity.po.mongo.game;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.mongodb.core.mapping.Field;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Choice {
    @Field("choice_id")
    private int id;
    private String name;
    private String description;
    private String imgSrc;
}

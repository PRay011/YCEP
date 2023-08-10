package cn.edu.csu.ycepspring.entity.po.mongo.game;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Document(collection = "game")
public class GameDocument {
    @Id
    private int id;
    private List<GameRole> role;
    private List<List<Plot>> plot;
    private List<List<List<Choice>>> choices;
    private List<Reinforce> reinforce;
}

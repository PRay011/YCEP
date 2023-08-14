package cn.edu.csu.ycepspring.entity.po.mongo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Document(collection = "paper")
public class PaperDocument {
    @Id
    private ObjectId id;
    private int account;
    private String time;
    private String kind;
    private String item;
    private String title;
    private String author;
    private String address;
    private String brief;
    private List<String> keywords;
    private List<String> content;
}

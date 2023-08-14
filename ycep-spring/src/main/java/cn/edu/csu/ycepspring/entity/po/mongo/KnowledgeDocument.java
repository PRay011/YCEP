package cn.edu.csu.ycepspring.entity.po.mongo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Document(collection = "knowledge")
public class KnowledgeDocument {
    @Id
    private int id;
    private String title;
    private String author;
    private String desc;
    private String imgSrc;
    private String videoSrc;
    private List<Content> content;
}

package cn.edu.csu.ycepspring.entity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Document(collection = "paper")
public class PaperBrief {
    @Id
    private String id;

    @Field("title")
    private String title;

    @Field("brief")
    private String brief;

    @Field("keywords")
    private List<String> keywords;

    @Field("time")
    private String time;
}

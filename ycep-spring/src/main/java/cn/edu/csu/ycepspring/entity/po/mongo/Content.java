package cn.edu.csu.ycepspring.entity.po.mongo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Content {
    private String text;
    private String imgSrc;
}

package cn.edu.csu.ycepspring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Item {
    private int itemId;
    private String itemName;
    private List<Knowledge> knowledges;
}

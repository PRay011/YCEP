package cn.edu.csu.ycepspring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Kind {
    private int kindId;
    private String kindName;
    private List<Item> items;
}

package cn.edu.csu.ycepspring.entity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AiChat {
    private String content;
    private String sessionKey;
}

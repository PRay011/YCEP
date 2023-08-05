package cn.edu.csu.ycepspring.entity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserInfo {
    private int account;
    private String username;
    private String sex;
    private String phone;
    private String email;
    private String school;
    private String description;
}

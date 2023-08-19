package cn.edu.csu.ycepspring.entity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PasswordBody {
    // account前端不用传
    private int account;
    private String oldPassword;
    private String newPassword;
    // 验证码
    private String code;
    // 验证码id
    private String codeID;
}

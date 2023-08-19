package cn.edu.csu.ycepspring.service;

import cn.edu.csu.ycepspring.entity.dto.LoginResp;
import cn.edu.csu.ycepspring.entity.dto.PasswordBody;
import cn.edu.csu.ycepspring.entity.dto.UserInfo;

public interface UserService {
    LoginResp checkAccount(String username, String password);

    LoginResp register(String username, String password);

    UserInfo getUserInfo(int account);

    void updateUserInfo(UserInfo userInfo);

    void updatePassword(PasswordBody passwordBody);
}

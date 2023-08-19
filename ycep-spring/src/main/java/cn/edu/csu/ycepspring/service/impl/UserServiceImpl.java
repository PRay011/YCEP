package cn.edu.csu.ycepspring.service.impl;


import cn.edu.csu.ycepspring.common.constants.RoleConstants;
import cn.edu.csu.ycepspring.common.exception.ServiceException;
import cn.edu.csu.ycepspring.common.utils.EncryptionUtils;
import cn.edu.csu.ycepspring.entity.dto.LoginResp;
import cn.edu.csu.ycepspring.entity.dto.PasswordBody;
import cn.edu.csu.ycepspring.entity.dto.UserInfo;
import cn.edu.csu.ycepspring.entity.po.mysql.AuthLocal;
import cn.edu.csu.ycepspring.entity.po.mysql.Item;
import cn.edu.csu.ycepspring.entity.po.mysql.User;
import cn.edu.csu.ycepspring.mapper.InterestMapper;
import cn.edu.csu.ycepspring.mapper.UserMapper;
import cn.edu.csu.ycepspring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private InterestMapper interestMapper;

    @Override
    public LoginResp checkAccount(String username, String password) {
        AuthLocal auth = userMapper.selectPasswordByUsername(username);
        if (auth == null) {
            throw new ServiceException("用户名不存在");
        } else if (!EncryptionUtils.matches(password, auth.getPassword())) {
            throw new ServiceException("密码错误");
        }
        int roleId = userMapper.selectRoleIdByAccount(auth.getAccount());
        // 查询是否已选择兴趣点,0否1是
        List<Item> myInterest = interestMapper.selectMyInterest(auth.getAccount());
        return new LoginResp(roleId, auth.getAccount(), username, myInterest.isEmpty() ? 0 : 1);
    }

    @Override
    @Transactional
    public LoginResp register(String username, String password) {
        List<String> usernameList = userMapper.selectAllUsername();
        if (usernameList.contains(username)) {
            throw new ServiceException("用户名已存在!");
        }
        User user = new User();
        user.setRoleId(RoleConstants.USER);
        userMapper.createUser(user);

        AuthLocal auth = new AuthLocal(user.getAccount(), username, password);
        userMapper.insertAuthLocal(auth);
        return new LoginResp(RoleConstants.USER, auth.getAccount(), auth.getUsername(), 0);
    }

    @Override
    public UserInfo getUserInfo(int account) {
        return userMapper.selectUserInfo(account);
    }

    @Override
    public void updateUserInfo(UserInfo userInfo) {
        userMapper.updateUserInfo(userInfo);
    }

    @Override
    public void updatePassword(PasswordBody passwordBody) {
        String oldPwdSecret = userMapper.selectPasswordByAccount(passwordBody.getAccount());
        if (!EncryptionUtils.matches(passwordBody.getOldPassword(), oldPwdSecret)) {
            throw new ServiceException("原密码错误");
        }
        // 改密码
        String newPwdSecret = EncryptionUtils.encode(passwordBody.getNewPassword());
        passwordBody.setNewPassword(newPwdSecret);
        userMapper.updatePassword(passwordBody);
    }
}

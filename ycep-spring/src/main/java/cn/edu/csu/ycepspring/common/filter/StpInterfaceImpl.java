package cn.edu.csu.ycepspring.common.filter;

import cn.dev33.satoken.stp.StpInterface;
import cn.dev33.satoken.stp.StpUtil;
import cn.edu.csu.ycepspring.common.exception.ServiceException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * 自定义权限加载接口实现类
 */
@Component
public class StpInterfaceImpl implements StpInterface {

    /**
     * 返回一个账号所拥有的权限码集合
     */
    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {
        return null;
    }

    /**
     * 返回一个账号所拥有的角色标识集合 (权限与角色可分开校验)
     */
    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
        List<String> list = new ArrayList<>();
        int roleId = StpUtil.getSession().getInt("roleId");
        if (roleId == 0) {
            list.add("admin");
        } else if (roleId == 1) {
            list.add("user");
        } else {
            throw new ServiceException("权限码异常");
        }
        return list;
    }

}


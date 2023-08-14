import { request } from '../../utils/request';

//登录
export function login(data: any) {
    return request({
        url: '/user/login',
        method: 'post',
        data: data
    })
}

// 验证码
export function vertify() {
    return request({
        url: '/user/code',
        method: 'get',
    })  
}

// 推出登录
export function logout() {
    return request({
        url: '/user/logout',
        method: 'delete',
    })  
}
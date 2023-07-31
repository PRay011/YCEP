import { request } from '../../utils/request';

//注册
// p.s. 注册的验证码用登录的
export function register(data: any) {
    return request({
        url: '/user/register',
        method: 'post',
        data: data
    })
}
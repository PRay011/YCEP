import { request } from '../../utils/request';

//获取个人信息
export function getUserInfo() {
    return request({
        url: `/user/info`,
        method: 'get',
    })
}
//修改个人信息
export function putUserInfo(data: any) {
    return request({
        url: '/user/info',
        method: 'put',
        data: data
    })
}
//获取兴趣爱好
export function getInterest() {
    return request({
        url: `/interest/my`,
        method: 'get',
    })
}
//第一次添加爱好
export function putInterest(account: any) {
    return request({
        url: `/interest/knowledge`,
        method: 'put',
    })
}
//修改兴趣爱好
export function postInterest(data: any) {
    return request({
        url: '/interest/knowledge',
        method: 'post',
        data: data
    })
}

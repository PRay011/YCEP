import { request } from '../../utils/request';

//导出login方法，供其它地方使用
export function getUserInfo(id: any) {
    return request({
        url: `user/info/${id}`,
        method: 'get',
    })
}

export function putUserInfo(id: any) {
    return request({
        url: `/user/accout/${id}`,
        method: 'put',
    })
}

export function putInterest(id: any) {
    return request({
        url: `/user/insterest/knowledge/${id}`,
        method: 'put',
    })
}

export function postInterest(id: any) {
    return request({
        url: `/interest/knowledge/${id}`,
        method: 'post',
    })
}
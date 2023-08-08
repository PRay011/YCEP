import { request } from '../../utils/request';

//导出login方法，供其它地方使用
export function getTest(gameId: any) {
    return request({
        url: `/reinforce/test/${gameId}`,
        method: 'get',
    })
}

export function postTest(data: any) {
    return request({
        url: '/reinforce/answers',
        method: 'post',
        data: data
    })
}

export function postQuestion(data: any) {
    return request({
        url: '/reinforce/aiquestion',
        method: 'post',
        data: data
    })
}
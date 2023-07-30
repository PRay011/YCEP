
import { request } from '../../utils/request';

//导出login方法，供其它地方使用
export function postMode(data: any) {
    return request({
        url: '/game/mode',
        method: 'post',
        data: data
    })
}

export function getGamePage(id: any) {
    return request({
        url: `/game/details/${id}`,
        method: 'get',
    })
}

export function postOrder(data: any) {
    return request({
        url: '/game/sort',
        method: 'post',
        data: data
    })
}

export function postFinish(data: any) {
    return request({
        url: '/game/workout',
        method: 'post',
        data: data
    })
}
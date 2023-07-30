
import { request } from '../../utils/request';

//导出login方法，供其它地方使用
export function getDetail(id: any) {
    return request({
        url: `/knowledge/info/${id}`,
        method: 'get',
    })
}

export function getGame(id: any) {
    return request({
        url: `/knowledge/game/${id}`,
        method: 'get',
    })
}
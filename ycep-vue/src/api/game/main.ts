
import { request } from '../../utils/request';

//选择角色
export function postMode(data: any) {
    return request({
        url: '/game/mode',
        method: 'post',
        data: data
    })
}
//翻页
export function getGamePage(id: any) {
    return request({
        url: `/game/details/${id}`,
        method: 'get',
    })
}
//剧情排序
export function postOrder(data: any) {
    return request({
        url: '/game/sort',
        method: 'post',
        data: data
    })
}
//解决问题
export function postFinish(data: any) {
    return request({
        url: '/game/workout',
        method: 'post',
        data: data
    })
}
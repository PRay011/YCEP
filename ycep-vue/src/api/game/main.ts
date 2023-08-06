
import { request } from '../../utils/request';

//选择游戏模式
export function postMode(data: any) {
    return request({
        url: '/game/mode',
        method: 'post',
        data: data
    })
}
//获取下一章节剧情
export function getGamePage(id: any, plot: any) {
    return request({
        url: `/game/details/${id}?plot=${plot}`,
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
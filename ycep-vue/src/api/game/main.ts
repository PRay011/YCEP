
import { request } from '../../utils/request';

//选择游戏模式
export function postMode(data: any) {
    return request({
        url: '/game/mode',
        method: 'post',
        data: data
    })
}
//获取人物
export function getCharacter(gameID: any) {
    return request({
        url: `/game/character/${gameID}`,
        method: 'get',
    })
}

//获取第一章节剧情
export function getStartPlot(gameID: any, characterID: any) {
    return request({
        url: `/game/startPlot/${gameID}?characterID=${characterID}`,
        method: 'get',
    })
}

//获取交互
export function getInteraction(gameID: any, characterID : any, interactionNumber: any) {
    return request({
        url: `/game/getInteraction/${gameID}?interactionNumber=${interactionNumber}&characterID=${characterID}`,
        method: 'get',
    })
}

//交互完成获取下一章节剧情
export function postInteraction(gameID: any, characterID: any, interactionNumber: any, interactionID: any) {
    return request({
        url: `/game/finishInteraction/${gameID}?characterID=${characterID}&interactionNumber=${interactionNumber}&interactionID=${interactionID}`,
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
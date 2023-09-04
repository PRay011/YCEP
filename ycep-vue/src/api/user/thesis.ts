import { request } from '../../utils/request';

//论文导出
export function getPaper() {
    return request({
        url: '/paper',
        method: 'get',
    })
}

//生成历史论文
export function confirmThesis(data) {

}

//创建会话
export function createSession(data: any) {
    return request({
        url: '/ai/newSession', method: 'post',
        data: data
    })
}
//获取论文框架
export function getBasicThesis(gameId: any) {
    return request({
        url: `/thesis/basic/${gameId}`,
        method: 'get',
    })
}

//AI生成关键词和摘要
export function getKeywordsAndBrief(data: any) {
    return request({
        url: `/ai/getBriefAndKeywords`,
        method: 'post',
        data: data
    })
}

//对话
export function chat(data: any) {
    return request({
        url: '/ai/chat',
        method: 'post',
        data: data
    })
}

//重置会话
export function refreshSession(sessionKey: any) {
    return request({
        url: `/ai/resetSession?sessionKey=${sessionKey}`,
        method: 'put',
    })
}

//结束会话
export function deleteSession(sessionKey: any) {
    return request({
        url: `/ai/closeSession?sessionKey=${sessionKey}`,
        method: 'delete',
    })
}

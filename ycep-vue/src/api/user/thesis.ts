import { request } from '../../utils/request';

//论文导出
export function getPaper() {
    return request({
        url: '/paper',
        method: 'get',
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
export function getKeywordsAndBrief(thesisId: any, data: any) {
    return request({
        url: `/thesis/keywordsAndBrief/${thesisId}`,
        method: 'post',
        data: data
    })
}

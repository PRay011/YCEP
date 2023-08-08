
import { request } from '../../utils/request';

//导出login方法，供其它地方使用
export function getNotice() {
    return request({
        url: '/main/notices',
        method: 'get',
    })
}

//获取知识点
export function getKnowledge() {
    return request({
        url: `/main/interest/knowledge`,
        method: 'get',
    })
}

export function getGame() {
    return request({
        url: `/main/interest/game`,
        method: 'get',
    })
}

export function postInterest(data:any) {
    return request({
        url: `/interest/knowledge`,
        method: 'post',
        data:data
    })
}

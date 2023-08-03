
import { request } from '../../utils/request';

//导出login方法，供其它地方使用
export function getNotice() {
    return request({
        url: '/main/notices',
        method: 'get',
    })
}

//获取知识点
export function getKnowledge(pageNum:any,pageSize:any) {
    return request({
        url: `/main/knowledges?currentPage=${pageNum}&pageSize=${pageSize}`,
        method: 'get',
    })
}

export function getGame(pageNum:any,pageSize:any) {
    return request({
        url: `/main/games?currentPage=${pageNum}&pageSize=${pageSize}`,
        method: 'get',
    })
}
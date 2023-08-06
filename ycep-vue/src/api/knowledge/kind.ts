import { request } from '../../utils/request';

export function getList(itemID: any, pageNum: any, pageSize: any) {
    return request({
        url: `/main/knowledge/${itemID}?currentPage=${pageNum}&pageSize=${pageSize}`,
        method: 'get',
    })
}
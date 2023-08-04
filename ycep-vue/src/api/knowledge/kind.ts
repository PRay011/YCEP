import { request } from '../../utils/request';

export function getList(kindID: any, itemID: any, pageNum: any, pageSize: any) {
    return request({
        url: `/main/knowledge/${kindID}/${itemID}?currentPage=${pageNum}&pageSize=${pageSize}`,
        method: 'get',
    })
}
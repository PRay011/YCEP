import { request } from '../../utils/request';

//论文导出
export function getPaper() {
    return request({
        url: '/paper',
        method: 'get',
    })
}
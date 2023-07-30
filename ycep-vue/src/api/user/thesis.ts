import { request } from '../../utils/request';

//导出login方法，供其它地方使用
export function getPaper() {
    return request({
        url: '/paper',
        method: 'get',
    })
}
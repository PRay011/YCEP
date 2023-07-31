import { request } from '../../utils/request';

//
export function getPaper() {
    return request({
        url: '/paper',
        method: 'get',
    })
}
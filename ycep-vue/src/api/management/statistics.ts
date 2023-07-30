import { request } from '../../utils/request';

//导出login方法，供其它地方使用
export function getGameInfo() {
    return request({
        url: '/manager/info/game',
        method: 'get',
    })
}
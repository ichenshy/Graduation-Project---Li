import request from '@/utils/request'

const api_name = '/admin/vod/subject'

export default {
    //课程分类列表
    getChildList(id) {
        return request({
            url: `${api_name}/getChildSubject/${id}`,
            method: 'get'
        })
    },
    //课程删除
    removeSubjectId(id) {
        return request({
            url: `${api_name}/removeById/${id}`,
            method: 'delete'
        })
    },
}
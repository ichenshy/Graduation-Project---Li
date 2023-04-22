package com.li.graduation.vod.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.li.graduation.model.vod.Teacher;
import com.li.graduation.vo.vod.TeacherQueryVo;
import com.li.graduation.vod.mapper.TeacherMapper;
import com.li.graduation.vod.service.TeacherService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 讲师 服务实现类
 * </p>
 *
 * @author lishan
 * @since 2022-08-10
 */
@Service
public class TeacherServiceImpl extends ServiceImpl<TeacherMapper, Teacher> implements TeacherService {

    @Override
    public IPage<Teacher> findQueryPage(Page<Teacher> pageParam, TeacherQueryVo teacherQueryVo) {
        QueryWrapper<Teacher> wrapper = new QueryWrapper<>();
        String name = teacherQueryVo.getName();
        Integer level = teacherQueryVo.getLevel();
        String joinDateBegin = teacherQueryVo.getJoinDateBegin();
        String joinDateEnd = teacherQueryVo.getJoinDateEnd();
        if (StringUtils.isNotEmpty(name)) {
            wrapper.like("name", name);
        }
        if (!org.springframework.util.StringUtils.isEmpty(level)) {
            wrapper.eq("level", level);
        }
        if (StringUtils.isNotEmpty(joinDateBegin)) {
            wrapper.ge("join_date", joinDateBegin);
        }
        if (StringUtils.isNotEmpty(joinDateEnd)) {
            wrapper.ge("join_date", joinDateEnd);
        }
        return this.page(pageParam, wrapper);
    }
}

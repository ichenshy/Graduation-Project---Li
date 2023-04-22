package com.li.graduation.vod.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.li.graduation.model.vod.Course;
import com.li.graduation.vo.vod.CourseFormVo;
import com.li.graduation.vo.vod.CoursePublishVo;
import com.li.graduation.vo.vod.CourseQueryVo;
import com.li.graduation.vo.vod.CourseVo;

import java.util.Map;

/**
 * <p>
 * 课程 服务类
 * </p>
 *
 * @author lishan
 * @since 2022-08-11
 */
public interface CourseService extends IService<Course> {

    Map<String, Object> findPageCourse(Page<Course> pageParam, CourseQueryVo courseQueryVo);

    Long saveCourseInfo(CourseFormVo courseFormVo);

    CourseFormVo getCourseFormVoById(Long id);

    void updateCourseById(CourseFormVo courseFormVo);

    CoursePublishVo getCoursePublishVo(Long id);

    boolean publishCourseById(Long id);

    void removeCourseById(Long id);

    Map<String, Object> getInfoById(Long courseId);

    Map<String, Object> findPage(Page<Course> pageParam, CourseQueryVo queryVo);
}

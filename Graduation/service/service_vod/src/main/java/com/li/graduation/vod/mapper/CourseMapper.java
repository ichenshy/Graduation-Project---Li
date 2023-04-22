package com.li.graduation.vod.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.li.graduation.model.vod.Course;
import com.li.graduation.vo.vod.CoursePublishVo;
import com.li.graduation.vo.vod.CourseVo;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 课程 Mapper 接口
 * </p>
 *
 * @author lishan
 * @since 2022-08-11
 */
public interface CourseMapper extends BaseMapper<Course> {

    CoursePublishVo selectCoursePublishVo(@Param("id") Long id);

    CourseVo selectCourseVoById(@Param("id") Long id);
}

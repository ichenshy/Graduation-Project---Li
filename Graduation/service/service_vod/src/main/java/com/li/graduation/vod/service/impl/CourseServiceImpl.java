package com.li.graduation.vod.service.impl;


import com.alibaba.excel.util.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.li.graduation.exception.CustomizeException;
import com.li.graduation.model.vod.*;
import com.li.graduation.vo.vod.*;
import com.li.graduation.vod.mapper.CourseMapper;
import com.li.graduation.vod.service.*;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * <p>
 * 课程 服务实现类
 * </p>
 *
 * @author lishan
 * @since 2022-08-11
 */
@Service
public class CourseServiceImpl extends ServiceImpl<CourseMapper, Course> implements CourseService {

    @Resource
    private TeacherService teacherService;
    @Resource
    private SubjectService subjectService;
    @Resource
    private CourseDescriptionService descriptionService;
    @Resource
    private VideoService videoService;
    @Resource
    private ChapterService chapterService;

    @Override
    public Map<String, Object> findPageCourse(Page<Course> pageParam, CourseQueryVo courseQueryVo) {
        //获取条件值
        //名称
        String title = courseQueryVo.getTitle();
        //二级分类
        Long subjectId = courseQueryVo.getSubjectId();
        //一级分类
        Long subjectParentId = courseQueryVo.getSubjectParentId();
        //讲师
        Long teacherId = courseQueryVo.getTeacherId();
        //封装条件
        LambdaQueryWrapper<Course> wrapper = new LambdaQueryWrapper<>();
        if (!StringUtils.isEmpty(title)) {
            wrapper.like(Course::getTitle, title);
        }
        if (!StringUtils.isEmpty(subjectId)) {
            wrapper.eq(Course::getSubjectId, subjectId);
        }
        if (!StringUtils.isEmpty(subjectParentId)) {
            wrapper.eq(Course::getSubjectParentId, subjectParentId);
        }
        if (!StringUtils.isEmpty(teacherId)) {
            wrapper.eq(Course::getTeacherId, teacherId);
        }
        Page<Course> page = baseMapper.selectPage(pageParam, wrapper);
        long totalCount = page.getTotal();
        long totalPage = page.getPages();
        List<Course> list = page.getRecords();

        list.stream().forEach(this::getNameById);
        HashMap<String, Object> map = new HashMap<>();
        map.put("totalCount", totalCount);
        map.put("totalPage", totalPage);
        map.put("records", list);
        return map;
    }

    private Course getNameById(Course course) {
        Teacher teacher = teacherService.getById(course.getTeacherId());
        if (teacher != null) {
            String name = teacher.getName();
            course.getParam().put("teacherName", name);
        }

        //查询分类名称
        return getCourse(course);
    }

    @Override
    public Long saveCourseInfo(CourseFormVo courseFormVo) {
        Course course = new Course();
        BeanUtils.copyProperties(courseFormVo, course);
        baseMapper.insert(course);
        CourseDescription description = new CourseDescription();
        description.setDescription(courseFormVo.getDescription());
        description.setId(course.getId());
        description.setCourseId(course.getId());
        descriptionService.save(description);
        return course.getId();
    }

    @Override
    public CourseFormVo getCourseFormVoById(Long id) {
        Course course = baseMapper.selectById(id);
        if (course == null) {
            throw new CustomizeException(20001, "课程信息为空");
        }
        CourseDescription description = descriptionService.getById(id);
        CourseFormVo courseFormVo = new CourseFormVo();
        BeanUtils.copyProperties(course, courseFormVo);
        if (description != null) {
            courseFormVo.setDescription(description.getDescription());
        }
        return courseFormVo;
    }

    @Override
    public void updateCourseById(CourseFormVo courseFormVo) {
        if (courseFormVo == null) {
            throw new CustomizeException(20001, "参数为空");
        }
        Course course = new Course();
        BeanUtils.copyProperties(courseFormVo, course);
        baseMapper.updateById(course);

        CourseDescription description = new CourseDescription();
        if (description == null) {
            throw new CustomizeException(20001, "description 为空");
        }
        description.setDescription(courseFormVo.getDescription());
        descriptionService.updateById(description);
    }

    @Override
    public CoursePublishVo getCoursePublishVo(Long id) {
        return baseMapper.selectCoursePublishVo(id);
    }

    @Override
    public boolean publishCourseById(Long id) {
        Course course = new Course();
        course.setId(id);
        course.setStatus(1);
        course.setPublishTime(new Date());
        return this.updateById(course);
    }

    @Override
    public void removeCourseById(Long id) {
        //根据课程id删除小节
        videoService.removeVideoByCourseId(id);
        //根据课程id删除章节
        chapterService.removeChapterByCourseId(id);
        //根据课程id删除描述
        descriptionService.removeById(id);
        //根据课程id删除课程
        baseMapper.deleteById(id);
    }

    @Override
    public Map<String, Object> getInfoById(Long id) {
        Course course = baseMapper.selectById(id);
        course.setViewCount(course.getViewCount() + 1);
        baseMapper.updateById(course);

        Map<String, Object> map = new HashMap<>();
        CourseVo courseVo = baseMapper.selectCourseVoById(id);
        List<ChapterVo> chapterVoList = chapterService.getNestedTreeList(id);
        CourseDescription courseDescription = descriptionService.getById(id);
        Teacher teacher = teacherService.getById(course.getTeacherId());


        //TODO后续完善
        Boolean isBuy = false;

        map.put("courseVo", courseVo);
        map.put("chapterVoList", chapterVoList);
        map.put("description", null != courseDescription ? courseDescription.getDescription() : "");
        map.put("teacher", teacher);
        map.put("isBuy", isBuy);//是否购买
        return map;
    }

    //课程列表
    @Override
    public Map<String, Object> findPage(Page<Course> pageParam, CourseQueryVo courseQueryVo) {
        //获取条件值
        String title = courseQueryVo.getTitle();//名称
        Long subjectId = courseQueryVo.getSubjectId();//二级分类
        Long subjectParentId = courseQueryVo.getSubjectParentId();//一级分类
        Long teacherId = courseQueryVo.getTeacherId();//讲师
        //封装条件
        QueryWrapper<Course> wrapper = new QueryWrapper<>();
        if (!StringUtils.isEmpty(title)) {
            wrapper.like("title", title);
        }
        if (!StringUtils.isEmpty(subjectId)) {
            wrapper.eq("subject_id", subjectId);
        }
        if (!StringUtils.isEmpty(subjectParentId)) {
            wrapper.eq("subject_parent_id", subjectParentId);
        }
        if (!StringUtils.isEmpty(teacherId)) {
            wrapper.eq("teacher_id", teacherId);
        }
        //调用方法查询
        Page<Course> pages = baseMapper.selectPage(pageParam, wrapper);

        long totalCount = pages.getTotal();//总记录数
        long totalPage = pages.getPages();//总页数
        long currentPage = pages.getCurrent();//当前页
        long size = pages.getSize();//每页记录数
        //每页数据集合
        List<Course> records = pages.getRecords();
        records.stream().forEach(this::getTeacherOrSubjectName);
        Map<String, Object> map = new HashMap<>();
        map.put("totalCount", totalCount);
        map.put("totalPage", totalPage);
        map.put("records", records);
        return map;
    }

    //获取讲师和分类名称
    private Course getTeacherOrSubjectName(Course course) {
        Teacher teacher = teacherService.getById(course.getTeacherId());
        if (teacher != null) {
            course.getParam().put("teacherName", teacher.getName());
        }
        return getCourse(course);
    }

    private Course getCourse(Course course) {
        Subject subjectOne = subjectService.getById(course.getSubjectParentId());
        if (subjectOne != null) {
            course.getParam().put("subjectParentTitle", subjectOne.getTitle());
        }
        Subject subjectTwo = subjectService.getById(course.getSubjectId());
        if (subjectTwo != null) {
            course.getParam().put("subjectTitle", subjectTwo.getTitle());
        }
        return course;
    }
}

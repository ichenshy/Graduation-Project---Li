package com.li.graduation.vod.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.li.graduation.exception.CustomizeException;
import com.li.graduation.model.vod.Course;
import com.li.graduation.result.ResultUtils;
import com.li.graduation.vo.vod.CourseFormVo;
import com.li.graduation.vo.vod.CoursePublishVo;
import com.li.graduation.vo.vod.CourseQueryVo;
import com.li.graduation.vod.service.CourseService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;

/**
 * <p>
 * 课程 前端控制器
 * </p>
 *
 * @author lishan
 * @since 2022-08-11
 */
@Api(tags = "课程管理接口")
@RestController
@RequestMapping(value = "/admin/vod/course")
public class CourseController {

    @Resource
    private CourseService courseService;

    @ApiOperation(value = "点播课程分页列表")
    @GetMapping("{page}/{limit}")
    public ResultUtils courseList(@PathVariable long limit, @PathVariable long page, CourseQueryVo courseQueryVo) {
        Page<Course> pageParam = new Page<>(page, limit);
        Map<String, Object> map = courseService.findPageCourse(pageParam, courseQueryVo);
        return ResultUtils.ok(map);
    }

    //添加课程基本信息
    @ApiOperation(value = "新增")
    @PostMapping("save")
    public ResultUtils save(@RequestBody CourseFormVo courseFormVo) {
        if (courseFormVo == null) {
            throw new CustomizeException(20001, "传入参数错误");
        }
        Long courseId = courseService.saveCourseInfo(courseFormVo);
        return ResultUtils.ok(courseId);
    }

    @ApiOperation(value = "获取课程信息")
    @GetMapping("/get/{id}")
    public ResultUtils get(@PathVariable Long id) {
        CourseFormVo courseFormVo = courseService.getCourseFormVoById(id);
        return ResultUtils.ok(courseFormVo);
    }

    @ApiOperation(value = "修改课程信息")
    @PostMapping("/update")
    public ResultUtils updateById(@RequestBody CourseFormVo courseFormVo) {
        courseService.updateCourseById(courseFormVo);
        return ResultUtils.ok(courseFormVo.getId());
    }

    @ApiOperation("根据id获取课程发布信息")
    @GetMapping("getCoursePublishVo/{id}")
    public ResultUtils getCoursePublishVoById(@PathVariable Long id) {
        CoursePublishVo coursePublishVo = courseService.getCoursePublishVo(id);
        return ResultUtils.ok(coursePublishVo);
    }

    @ApiOperation("根据id发布课程")
    @PutMapping("/publishCourseById/{id}")
    public ResultUtils publishCourseById(
            @ApiParam(value = "课程ID", required = true)
            @PathVariable Long id) {
        courseService.publishCourseById(id);
        return ResultUtils.ok();
    }
    @ApiOperation(value = "删除课程")
    @DeleteMapping("remove/{id}")
    public ResultUtils remove(@PathVariable Long id) {
        courseService.removeCourseById(id);
        return ResultUtils.ok();
    }
}


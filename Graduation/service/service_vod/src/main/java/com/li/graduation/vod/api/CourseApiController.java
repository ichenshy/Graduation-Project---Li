package com.li.graduation.vod.api;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.li.graduation.model.vod.Course;
import com.li.graduation.result.ResultUtils;
import com.li.graduation.vo.vod.CourseQueryVo;
import com.li.graduation.vod.service.ChapterService;
import com.li.graduation.vod.service.CourseService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * @author lishan
 * @version v1.0
 * @date 2022/8/12
 */
@RestController
@RequestMapping("/api/vod/course")
public class CourseApiController {

    @Resource
    private ChapterService chapterService;
    @Resource
    private CourseService courseService;

    //课程id查询课程信息
    @ApiOperation("根据ID查询课程")
    @GetMapping("inner/getById/{courseId}")
    public Course getById(
            @ApiParam(value = "课程ID", required = true)
            @PathVariable Long courseId){
        Course course = courseService.getById(courseId);
        return course;
    }

    //根据课程分类查询课程列表（分页）
    @ApiOperation("根据课程分类查询课程列表")
    @GetMapping("{subjectParentId}/{page}/{limit}")
    public ResultUtils findPageCourse(@ApiParam(value = "课程一级分类ID", required = true)
                                 @PathVariable Long subjectParentId,
                                 @ApiParam(name = "page", value = "当前页码", required = true)
                                 @PathVariable Long page,
                                 @ApiParam(name = "limit", value = "每页记录数", required = true)
                                 @PathVariable Long limit) {
        //封装条件
        CourseQueryVo courseQueryVo = new CourseQueryVo();
        courseQueryVo.setSubjectParentId(subjectParentId);
        //创建page对象
        Page<Course> pageParam = new Page<>(page,limit);
        Map<String,Object> map = courseService.findPage(pageParam,courseQueryVo);
        return ResultUtils.ok(map);
    }

    //根据课程id查询课程详情
    @ApiOperation("根据课程id查询课程详情")
    @GetMapping("getInfo/{courseId}")
    public ResultUtils getInfo(@PathVariable Long courseId) {
        Map<String,Object> map = courseService.getInfoById(courseId);
        return ResultUtils.ok(map);
    }

    @ApiOperation("根据关键字查询课程")
    @GetMapping("inner/findByKeyword/{keyword}")
    public List<Course> findByKeyword(
            @ApiParam(value = "关键字", required = true)
            @PathVariable String keyword){
        QueryWrapper<Course> wrapper = new QueryWrapper<>();
        wrapper.like("title",keyword);
        List<Course> list = courseService.list(wrapper);
        return list;
    }

    //模拟支付成功
    @GetMapping("/paySuccess/{courseId}")
    private ResultUtils paySuccess(@PathVariable String courseId){
        //将课程改成免费 price：0
        Course course = courseService.getById(courseId);
        course.setPrice(BigDecimal.ZERO);
        courseService.updateById(course);
        return ResultUtils.ok(null).message("支付成功");
    }

    //@ApiOperation("根据关键字查询课程")
    //@GetMapping("inner/findByKeyword/{keyword}")
    //public List<Course> findByKeyword(
    //        @ApiParam(value = "关键字", required = true)
    //        @PathVariable String keyword) {
    //    LambdaQueryWrapper<Course> wrapper = new LambdaQueryWrapper();
    //    wrapper.like(Course::getTitle, keyword);
    //    List<Course> list = courseService.list(wrapper);
    //    return list;
    //}
    //
    ////根据课程分类查询课程列表（分页）
    //@ApiOperation("根据课程分类查询课程列表")
    //@GetMapping("{subjectParentId}/{page}/{limit}")
    //public ResultUtils findPageCourse(@ApiParam(value = "课程一级分类ID", required = true) @PathVariable Long subjectParentId,
    //                                  @ApiParam(name = "page", value = "当前页码", required = true) @PathVariable Long page,
    //                                  @ApiParam(name = "limit", value = "每页记录数", required = true) @PathVariable Long limit) {
    //    CourseQueryVo queryVo = new CourseQueryVo();
    //    queryVo.setSubjectParentId(subjectParentId);
    //    Page<Course> pageParam = new Page<>(page,limit);
    //    Map<String, Object> pageMode = courseService.findPageCourse(pageParam,queryVo);
    //    return ResultUtils.ok(pageMode);
    //}
    ////根据ID查询课程
    //@ApiOperation("根据ID查询课程")
    //@GetMapping("getInfo/{courseId}")
    //public ResultUtils getInfo(
    //        @ApiParam(value = "课程ID", required = true)
    //        @PathVariable Long courseId){
    //    Map<String, Object> map = courseService.getInfoById(courseId);
    //    return ResultUtils.ok(map);
    //}
}

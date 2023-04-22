package com.li.graduation.vod.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.li.graduation.model.vod.Teacher;
import com.li.graduation.result.ResultUtils;
import com.li.graduation.vo.vod.TeacherQueryVo;
import com.li.graduation.vod.service.TeacherService;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.nio.channels.Pipe;
import java.util.List;

/**
 * <p>
 * 讲师 前端控制器
 * </p>
 *
 * @author lishan
 * @since 2022-08-10
 */
@ApiOperation("讲师接口")
@RestController
@RequestMapping("/admin/vod/teacher")
public class TeacherController {
    @Resource
    private TeacherService teacherService;

    @GetMapping("/findAll")
    public ResultUtils<List<Teacher>> findAllTeacher() {
        List<Teacher> list = teacherService.list();
        return ResultUtils.ok(list);
    }

    @DeleteMapping("/remove/{id}")
    public ResultUtils<Boolean> removeById(@PathVariable String id) {
        boolean result = teacherService.removeById(id);
        if (result) {
            return ResultUtils.ok();
        } else {
            return ResultUtils.fail();
        }
    }

    //current 当前页 limit 总记录数
    @ApiOperation("条件分页查询")
    @PostMapping("/findQueryPage/{current}/{limit}")
    public ResultUtils findQueryPage(@PathVariable long current, @PathVariable long limit, @RequestBody(required = false) TeacherQueryVo teacherQueryVo) {
        Page<Teacher> pageParam = new Page<>(current, limit);
        if (teacherQueryVo == null) {
            //查询全部
            IPage<Teacher> pageModel = teacherService.page(pageParam, null);
            return ResultUtils.ok(pageModel);
        } else {
            //条件查询
            IPage<Teacher> pageModel = teacherService.findQueryPage(pageParam, teacherQueryVo);
            return ResultUtils.ok(pageModel);
        }
    }

    @ApiOperation("添加讲师")
    @PostMapping("/saveTeacher")
    public ResultUtils<Boolean> saveTeacher(@RequestBody Teacher teacher) {
        if (teacher == null) {
            return ResultUtils.fail();
        }
        boolean result = teacherService.save(teacher);
        if (result) {
            return ResultUtils.ok();
        } else {
            return ResultUtils.fail();
        }
    }

    @ApiOperation("根据id查询")
    @GetMapping("/getTeacher/{id}")
    public ResultUtils<Teacher> getTeacher(@PathVariable Long id) {
        if (id < 0) {
            return ResultUtils.fail();
        }
        Teacher teacher = teacherService.getById(id);
        return ResultUtils.ok(teacher);
    }

    @ApiOperation("修改讲师")
    @PostMapping("/updateTeacher")
    public ResultUtils<Boolean> updateTeacher(@RequestBody Teacher teacher) {
        if (teacher == null) {
            return ResultUtils.fail();
        }
        boolean result = teacherService.updateById(teacher);
        if (result) {
            return ResultUtils.ok();
        } else {
            return ResultUtils.fail();
        }
    }

    @ApiOperation("批量删除")
    @DeleteMapping("/removeBatch")
    public ResultUtils<Boolean> removeBatch(@RequestBody List<Long> idList) {
        boolean result = teacherService.removeByIds(idList);
        if (result) {
            return ResultUtils.ok();
        } else {
            return ResultUtils.fail();
        }
    }
}


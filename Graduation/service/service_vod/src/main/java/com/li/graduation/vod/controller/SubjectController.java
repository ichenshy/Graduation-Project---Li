package com.li.graduation.vod.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.li.graduation.exception.CustomizeException;
import com.li.graduation.model.vod.Subject;
import com.li.graduation.result.ResultUtils;
import com.li.graduation.vod.service.SubjectService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.http.HttpResponse;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * <p>
 * 课程科目 前端控制器
 * </p>
 *
 * @author lishan
 * @since 2022-08-11
 */
@Api(tags = "课程分类管理")
@RestController
@RequestMapping(value = "/admin/vod/subject")
public class SubjectController {

    @Resource
    private SubjectService subjectService;

    //查询下一层课程分类
    //根据parent_id
    @ApiOperation("查询下一层的课程分类")
    @GetMapping("getChildSubject/{id}")
    public ResultUtils getChildSubject(@PathVariable Long id) {
        List<Subject> list = subjectService.selectSubjectList(id);
        return ResultUtils.ok(list);
    }

    @ApiOperation(value = "删除")
    @DeleteMapping("removeById/{id}")
    public ResultUtils removeById(@PathVariable Long id) {
        if (id < 0) {
            throw new CustomizeException(20001, "请求参数错误");
        }
        boolean result = subjectService.deleteById(id);
        if (result) {
            return ResultUtils.ok();
        } else {
            return ResultUtils.fail();
        }
    }

    @ApiOperation(value = "导出")
    @GetMapping("/exportData")
    public ResultUtils exportData(HttpServletResponse response) {
        Boolean result = subjectService.exportData(response);
        return ResultUtils.ok(result);
    }

    @ApiOperation(value = "导入")
    @PostMapping("/importData")
    public ResultUtils importData(MultipartFile file) {
        Boolean result = subjectService.importData(file);
        return ResultUtils.ok(result);
    }
}


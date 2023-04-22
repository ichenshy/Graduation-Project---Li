package com.li.graduation.vod.controller;


import com.li.graduation.exception.CustomizeException;
import com.li.graduation.model.vod.Chapter;
import com.li.graduation.result.ResultUtils;
import com.li.graduation.vo.vod.ChapterVo;
import com.li.graduation.vod.service.ChapterService;
import com.li.graduation.vod.service.impl.ChapterServiceImpl;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 课程 前端控制器
 * </p>
 *
 * @author lishan
 * @since 2022-08-11
 */
@RestController
@RequestMapping(value = "/admin/vod/chapter")
@Api(tags = "课程章节")
public class ChapterController {

    @Resource
    private ChapterService chapterService;

    //获取章节小结列表
    @ApiOperation("大纲列表")
    @GetMapping("/getNestedTreeList/{courseId}")
    public ResultUtils getNestedTreeList(@PathVariable long courseId) {
        List<ChapterVo> list = chapterService.getNestedTreeList(courseId);
        return ResultUtils.ok(list);
    }

    //2 添加章节
    @ApiOperation("添加章节")
    @PostMapping("save")
    public ResultUtils save(@RequestBody Chapter chapter) {
        if (chapter == null) {
            throw new CustomizeException(20001, "传入信息有误");
        }
        boolean save = chapterService.save(chapter);
        if (save) {
            return ResultUtils.ok();
        } else {
            return ResultUtils.fail();
        }
    }

    //3 修改-根据id查询
    @GetMapping("get/{id}")
    public ResultUtils get(@PathVariable Long id) {
        Chapter chapter = chapterService.getById(id);
        return ResultUtils.ok(chapter);
    }

    //4 修改-最终实现
    @PostMapping("update")
    public ResultUtils update(@RequestBody Chapter chapter) {
        chapterService.updateById(chapter);
        return ResultUtils.ok();
    }

    //5 删除章节
    @DeleteMapping("remove/{id}")
    public ResultUtils remove(@PathVariable Long id) {
        chapterService.removeById(id);
        return ResultUtils.ok();
    }
}


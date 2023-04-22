package com.li.graduation.vod.controller;

import com.li.graduation.result.ResultUtils;
import com.li.graduation.vod.service.FileService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

/**
 * @author lishan
 * @version v1.0
 * @date 2022/8/11
 */
@Api(tags = "文件上传接口")
@RestController
@RequestMapping("/admin/vod/file")
@CrossOrigin
public class FileUploadController {
    @Resource
    private FileService fileService;

    @ApiOperation("上传文件")
    @PostMapping("/upload")
    public ResultUtils upload(MultipartFile file) {
        String upload = fileService.upload(file);
        if (upload == null && "".equals(upload)) {
            return ResultUtils.fail().message("路径为空");
        }
        return ResultUtils.ok(upload).message("文件上传成功");
    }
}

package com.li.graduation.vod.api;

import com.li.graduation.result.ResultUtils;
import com.li.graduation.vod.service.VodService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @author lishan
 * @version v1.0
 * @date 2022/8/13
 */
@Api(tags = "腾讯视频点播")
@RestController
@RequestMapping("/api/vod")
public class VodApiController {

    @Resource
    private VodService vodService;

    @GetMapping("getPlayAuth/{courseId}/{videoId}")
    public ResultUtils getPlayAuth(
            @ApiParam(value = "课程id", required = true)
            @PathVariable Long courseId,
            @ApiParam(value = "视频id", required = true)
            @PathVariable Long videoId) {
        Map<String,Object> map = vodService.getPlayAuth(courseId, videoId);
        return ResultUtils.ok(map);
    }
}

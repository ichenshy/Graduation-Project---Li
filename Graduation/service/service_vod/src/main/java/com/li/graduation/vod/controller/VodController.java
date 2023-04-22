package com.li.graduation.vod.controller;

import com.li.graduation.exception.CustomizeException;
import com.li.graduation.model.vod.Video;
import com.li.graduation.result.ResultUtils;
import com.li.graduation.vod.service.VideoService;
import com.li.graduation.vod.service.VodService;
import com.li.graduation.vod.utils.ConstantPropertiesUtil;
import com.li.graduation.vod.utils.Signature;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Random;

@Api(tags = "腾讯云点播")
@RestController
@RequestMapping("/admin/vod")
public class VodController {
    @Resource
    private VodService vodService;
    @Resource
    private VideoService videoService;

    //返回客户端上传视频签名
    @GetMapping("sign")
    public ResultUtils sign() {
        Signature sign = new Signature();
        // 设置 App 的云 API 密钥
        sign.setSecretId(ConstantPropertiesUtil.ACCESS_KEY_ID);
        sign.setSecretKey(ConstantPropertiesUtil.ACCESS_KEY_SECRET);
        sign.setCurrentTime(System.currentTimeMillis() / 1000);
        sign.setRandom(new Random().nextInt(java.lang.Integer.MAX_VALUE));
        sign.setSignValidDuration(3600 * 24 * 2); // 签名有效期：2天
        try {
            String signature = sign.getUploadSignature();
            System.out.println("signature : " + signature);
            return ResultUtils.ok(signature);
        } catch (Exception e) {
            System.out.print("获取签名失败");
            e.printStackTrace();
            throw new CustomizeException(20001, "获取签名失败");
        }
    }

    //上传视频接口
    @PostMapping("upload")
    public ResultUtils upload() {
        String fileId = vodService.updateVideo();
        return ResultUtils.ok(fileId);
    }

    //删除腾讯云视频
    @DeleteMapping("remove/{fileId}")
    public ResultUtils remove(@PathVariable String fileId) {
        vodService.removeVideo(fileId);
        return ResultUtils.ok();
    }
}

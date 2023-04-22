package com.li.graduation.vod.controller;

import com.li.graduation.result.ResultUtils;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * @author lishan
 * @version v1.0
 * @date 2022/8/11
 */
@ApiOperation("登录接口")
@RestController
@RequestMapping("/admin/vod/user")
public class UserLoginController {
    @PostMapping("/login")
    public ResultUtils login() {
        Map<String, Object> map = new HashMap<>();
        map.put("token", "admin-token");
        return ResultUtils.ok(map);
    }

    @GetMapping("/info")
    public ResultUtils info() {
        Map<String, Object> map = new HashMap<>();
        map.put("roles", "admin");
        map.put("introduction", "I am a super admin");
        map.put("avatar", "https://cdn.jsdelivr.net/gh/CCsiro/image/img/202208091940337.jpg");
        map.put("name", "admin");
        return ResultUtils.ok(map);
    }
}

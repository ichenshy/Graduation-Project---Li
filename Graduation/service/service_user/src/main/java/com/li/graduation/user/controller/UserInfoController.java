package com.li.graduation.user.controller;


import com.baomidou.mybatisplus.extension.api.R;
import com.li.graduation.model.user.UserInfo;
import com.li.graduation.result.ResultUtils;
import com.li.graduation.user.service.UserInfoService;
import com.li.graduation.utils.AuthContextHolder;
import io.jsonwebtoken.ExpiredJwtException;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author lishan
 * 
 */
@Api("用户表 前端控制器")
@RestController
@RequestMapping("/admin/user/userInfo")
public class UserInfoController {
    @Resource
    private UserInfoService userService;

    @ApiOperation(value = "获取")
    @GetMapping("inner/getById/{id}")
    public UserInfo getById(@PathVariable Long id) {
        return userService.getById(id);
    }
}





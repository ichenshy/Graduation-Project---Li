package com.li.graduation.user.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.li.graduation.model.user.UserInfo;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author lishan
 * 
 */
public interface UserInfoService extends IService<UserInfo> {

    UserInfo getByOpenid(String openId);
}

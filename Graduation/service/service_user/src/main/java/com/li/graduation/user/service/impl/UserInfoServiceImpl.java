package com.li.graduation.user.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.li.graduation.model.user.UserInfo;
import com.li.graduation.user.mapper.UserInfoMapper;
import com.li.graduation.user.service.UserInfoService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author lishan
 * 
 */
@Service
public class UserInfoServiceImpl extends ServiceImpl<UserInfoMapper, UserInfo> implements UserInfoService {

    @Override
    public UserInfo getByOpenid(String openId) {
        LambdaQueryWrapper<UserInfo> wrapper = new LambdaQueryWrapper();
        wrapper.eq(UserInfo::getOpenId,openId);
        UserInfo userInfo = baseMapper.selectOne(wrapper);
        return userInfo;
    }
}

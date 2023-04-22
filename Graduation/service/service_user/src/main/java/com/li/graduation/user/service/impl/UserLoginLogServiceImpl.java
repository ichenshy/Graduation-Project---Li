package com.li.graduation.user.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.li.graduation.model.user.UserLoginLog;
import com.li.graduation.user.mapper.UserLoginLogMapper;
import com.li.graduation.user.service.UserLoginLogService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户登陆记录表 服务实现类
 * </p>
 *
 * @author lishan
 * 
 */
@Service
public class UserLoginLogServiceImpl extends ServiceImpl<UserLoginLogMapper, UserLoginLog> implements UserLoginLogService {

}

package com.li.graduation.client;

import com.li.graduation.model.user.UserInfo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * @author lishan
 * @version v1.0
 * @date 2022/8/12
 * 被调用端接口
 */
//打开连接到user模块
@FeignClient(value = "service-user")
public interface UserInfoFeignClient {
    @GetMapping("/admin/user/userInfo/inner/getById/{id}")
    UserInfo getById(@PathVariable Long id);
}

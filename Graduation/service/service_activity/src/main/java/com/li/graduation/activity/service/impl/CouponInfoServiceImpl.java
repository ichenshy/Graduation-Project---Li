package com.li.graduation.activity.service.impl;

import java.util.Date;

import com.google.common.collect.Maps;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.li.graduation.activity.mapper.CouponInfoMapper;
import com.li.graduation.activity.service.CouponInfoService;
import com.li.graduation.activity.service.CouponUseService;
import com.li.graduation.client.UserInfoFeignClient;
import com.li.graduation.model.activity.CouponInfo;
import com.li.graduation.model.activity.CouponUse;
import com.li.graduation.model.user.UserInfo;
import com.li.graduation.vo.activity.CouponUseQueryVo;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 优惠券信息 服务实现类
 * </p>
 *
 * @author lishan
 * 
 */
@Service
public class CouponInfoServiceImpl extends ServiceImpl<CouponInfoMapper, CouponInfo> implements CouponInfoService {

    @Resource
    private CouponUseService couponUseService;

    @Resource
    private UserInfoFeignClient userInfoFeignClient;

    @Override
    public Page<CouponUse> selectCouponUsePage(Page<CouponUse> pageParam, CouponUseQueryVo couponUseQueryVo) {
        //获取条件
        Long couponId = couponUseQueryVo.getCouponId();
        String couponStatus = couponUseQueryVo.getCouponStatus();
        String getTimeBegin = couponUseQueryVo.getGetTimeBegin();
        String getTimeEnd = couponUseQueryVo.getGetTimeEnd();

        //封装条件
        LambdaQueryWrapper<CouponUse> wrapper = new LambdaQueryWrapper<>();
        if (!StringUtils.isEmpty(couponId)) {
            wrapper.eq(CouponUse::getCouponId, couponId);
        }
        if (!StringUtils.isEmpty(couponStatus)) {
            wrapper.eq(CouponUse::getCouponStatus, couponStatus);
        }
        if (!StringUtils.isEmpty(getTimeBegin)) {
            wrapper.ge(CouponUse::getCreateTime, getTimeBegin);
        }
        if (!StringUtils.isEmpty(getTimeEnd)) {
            wrapper.le(CouponUse::getCreateTime, getTimeEnd);
        }
        Page<CouponUse> pageModel = couponUseService.page(pageParam, wrapper);
        List<CouponUse> records = pageModel.getRecords();
        records.stream().forEach(item -> {
            this.getUserInfoBycouponUse(item);
        });
        return pageModel;
    }

    @Override
    public Boolean updateCouponInfoUseStatus(Long couponUseId, Long orderId) {
        CouponUse couponUse = new CouponUse();
        couponUse.setId(couponUseId);
        couponUse.setCouponId(couponUseId);
        couponUse.setOrderId(orderId);
        couponUse.setCouponStatus("1");
        couponUse.setUsingTime(new Date());
        boolean result = couponUseService.updateById(couponUse);
        return result;
    }

    //封装用户昵称和手机号
    private CouponUse getUserInfoBycouponUse(CouponUse couponUse) {
        Long userId = couponUse.getUserId();
        if (!StringUtils.isEmpty(userId)) {
            UserInfo userInfo = userInfoFeignClient.getById(userId);
            if (userInfo != null) {
                couponUse.getParam().put("nickName", userInfo.getNickName());
                couponUse.getParam().put("phone", userInfo.getPhone());
            }
        }
        return couponUse;
    }
}

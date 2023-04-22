package com.li.graduation.activity.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.li.graduation.model.activity.CouponInfo;
import com.li.graduation.model.activity.CouponUse;
import com.li.graduation.vo.activity.CouponUseQueryVo;

/**
 * <p>
 * 优惠券信息 服务类
 * </p>
 *
 * @author lishan
 * 
 */
public interface CouponInfoService extends IService<CouponInfo> {

    Page<CouponUse> selectCouponUsePage(Page<CouponUse> pageParam, CouponUseQueryVo couponUseQueryVo);

    Boolean updateCouponInfoUseStatus(Long couponUseId, Long orderId);
}

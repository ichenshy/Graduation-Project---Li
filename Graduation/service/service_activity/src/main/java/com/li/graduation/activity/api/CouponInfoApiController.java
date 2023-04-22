package com.li.graduation.activity.api;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.li.graduation.activity.service.CouponInfoService;
import com.li.graduation.activity.service.CouponUseService;
import com.li.graduation.model.activity.CouponInfo;
import com.li.graduation.model.activity.CouponUse;
import com.li.graduation.result.ResultUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Api(tags = "优惠券接口")
@RestController
@RequestMapping("/api/activity/couponInfo")
public class CouponInfoApiController {
    @Resource
    private CouponInfoService couponInfoService;
    @ApiOperation(value = "获取分页列表")
    @GetMapping("{page}/{limit}")
    public ResultUtils findListPage(
            @ApiParam(name = "page", value = "当前页码", required = true)
            @PathVariable Long page,
            @ApiParam(name = "limit", value = "每页记录数", required = true)
            @PathVariable Long limit) {
        Page<CouponInfo> pageParam = new Page<>(page, limit);
        Page<CouponInfo> pageModel = couponInfoService.page(pageParam);
        return ResultUtils.ok(pageModel);
    }
    @ApiOperation(value = "查询所有优惠券")
    @GetMapping("/findCouponInfo")
    public ResultUtils findCouponInfo() {
        List<CouponInfo> list = couponInfoService.list();
        return ResultUtils.ok(list);
    }

    @ApiOperation(value = "获取优惠券")
    @GetMapping(value = "inner/getById/{couponId}")
    public CouponInfo getById(@PathVariable("couponId") Long couponId) {
        return couponInfoService.getById(couponId);
    }

    @ApiOperation(value = "更新优惠券状态")
    @GetMapping(value = "inner/updateCouponInfoUseStatus/{couponUseId}/{orderId}")
    public Boolean updateCouponInfoUseStatus(@PathVariable Long couponUseId, @PathVariable Long orderId) {
        Boolean result = couponInfoService.updateCouponInfoUseStatus(couponUseId, orderId);
        return result;
    }
}

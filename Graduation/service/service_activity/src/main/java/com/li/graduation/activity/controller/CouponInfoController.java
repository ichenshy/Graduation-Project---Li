package com.li.graduation.activity.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.li.graduation.activity.service.CouponInfoService;
import com.li.graduation.model.activity.CouponInfo;
import com.li.graduation.model.activity.CouponUse;
import com.li.graduation.result.ResultUtils;
import com.li.graduation.vo.activity.CouponUseQueryVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 优惠券信息 前端控制器
 * </p>
 *
 * @author lishan
 * 
 */
@RestController
@RequestMapping("/admin/activity/couponInfo")
@Api(tags = "优惠券相关接口")
public class CouponInfoController {
    @Resource
    private CouponInfoService couponInfoService;

    @ApiOperation(value = "获取优惠券")
    @GetMapping("get/{id}")
    public ResultUtils get(@PathVariable String id) {
        CouponInfo couponInfo = couponInfoService.getById(id);
        return ResultUtils.ok(couponInfo);
    }

    @ApiOperation(value = "新增优惠券")
    @PostMapping("save")
    public ResultUtils save(@RequestBody CouponInfo couponInfo) {
        couponInfoService.save(couponInfo);
        return ResultUtils.ok();
    }

    @ApiOperation(value = "修改优惠券")
    @PutMapping("update")
    public ResultUtils updateById(@RequestBody CouponInfo couponInfo) {
        couponInfoService.updateById(couponInfo);
        return ResultUtils.ok();
    }

    @ApiOperation(value = "删除优惠券")
    @DeleteMapping("remove/{id}")
    public ResultUtils remove(@PathVariable String id) {
        couponInfoService.removeById(id);
        return ResultUtils.ok();
    }

    @ApiOperation(value = "根据id列表删除优惠券")
    @DeleteMapping("batchRemove")
    public ResultUtils batchRemove(@RequestBody List<String> idList) {
        couponInfoService.removeByIds(idList);
        return ResultUtils.ok();
    }

    @ApiOperation(value = "获取分页列表")
    @GetMapping("{page}/{limit}")
    public ResultUtils index(
            @ApiParam(name = "page", value = "当前页码", required = true)
            @PathVariable Long page,
            @ApiParam(name = "limit", value = "每页记录数", required = true)
            @PathVariable Long limit) {
        Page<CouponInfo> pageParam = new Page<>(page, limit);
        Page<CouponInfo> pageModel = couponInfoService.page(pageParam);
        return ResultUtils.ok(pageModel);
    }

    @ApiOperation(value = "获取分页列表")
    @GetMapping("couponUse/{page}/{limit}")
    public ResultUtils index(
            @ApiParam(name = "page", value = "当前页码", required = true)
            @PathVariable Long page,
            @ApiParam(name = "limit", value = "每页记录数", required = true)
            @PathVariable Long limit,
            @ApiParam(name = "couponUseVo", value = "查询对象", required = false)
                    CouponUseQueryVo couponUseQueryVo) {
        Page<CouponUse> pageParam = new Page<>(page, limit);
        Page<CouponUse> pageModel =  couponInfoService.selectCouponUsePage(pageParam,couponUseQueryVo);
        return ResultUtils.ok(pageModel);
    }
}


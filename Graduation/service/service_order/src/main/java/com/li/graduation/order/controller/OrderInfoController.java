package com.li.graduation.order.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.li.graduation.model.order.OrderInfo;
import com.li.graduation.order.service.OrderInfoService;
import com.li.graduation.result.ResultUtils;
import com.li.graduation.vo.order.OrderInfoQueryVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Map;

/**
 * <p>
 * 订单表 订单表 前端控制器
 * </p>
 *
 * @author lishan
 * 
 */
@Api(tags = "订单管理")
@RestController
@RequestMapping(value = "/admin/order/orderInfo")
public class OrderInfoController {
    @Resource
    private OrderInfoService orderInfoService;

    @ApiOperation(value = "获取分页列表")
    @GetMapping("{page}/{limit}")
    public ResultUtils listOrder(@PathVariable Long page, @PathVariable Long limit, OrderInfoQueryVo orderInfoQueryVo) {
        Page<OrderInfo> pageParam = new Page<>(page, limit);
        Map<String, Object> map = orderInfoService.selectOrderInfoPage(pageParam, orderInfoQueryVo);
        return ResultUtils.ok(map);
    }
}


package com.li.graduation.order.api;

import com.li.graduation.order.service.OrderInfoService;
import com.li.graduation.result.ResultUtils;
import com.li.graduation.vo.order.OrderFormVo;
import com.li.graduation.vo.order.OrderInfoVo;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("api/order/orderInfo")
public class OrderInfoApiController {
    @Resource
    private OrderInfoService orderInfoService;

    @ApiOperation("新增点播课程订单")
    @PostMapping("submitOrder")
    public ResultUtils submitOrder(@RequestBody OrderFormVo orderFormVo, HttpServletRequest request) {
        //返回订单id
        Long orderId = orderInfoService.submitOrder(orderFormVo);
        return ResultUtils.ok(orderId);
    }
    @ApiOperation(value = "获取")
    @GetMapping("getInfo/{id}")
    public ResultUtils getInfo(@PathVariable Long id) {
        OrderInfoVo orderInfoVo = orderInfoService.getOrderInfoById(id);
        return ResultUtils.ok(orderInfoVo);
    }
}

package com.li.graduation.order.service;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.li.graduation.model.order.OrderInfo;
import com.li.graduation.vo.order.OrderFormVo;
import com.li.graduation.vo.order.OrderInfoQueryVo;
import com.li.graduation.vo.order.OrderInfoVo;

import java.util.Map;

/**
 * <p>
 * 订单表 订单表 服务类
 * </p>
 *
 * @author lishan
 * 
 */
public interface OrderInfoService extends IService<OrderInfo> {

    //订单列表
    Map<String, Object> selectOrderInfoPage(Page<OrderInfo> pageParam, OrderInfoQueryVo orderInfoQueryVo);

    //生成订单方法
    Long submitOrder(OrderFormVo orderFormVo);

    //订单id获取订单信息
    OrderInfoVo getOrderInfoById(Long id);

    //更新订单状态 ：已经支付
    void updateOrderStatus(String out_trade_no);

}

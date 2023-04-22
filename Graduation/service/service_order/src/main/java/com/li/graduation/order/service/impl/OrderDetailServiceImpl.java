package com.li.graduation.order.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.li.graduation.model.order.OrderDetail;
import com.li.graduation.order.mapper.OrderDetailMapper;
import com.li.graduation.order.service.OrderDetailService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 订单明细 订单明细 服务实现类
 * </p>
 *
 * @author lishan
 * 
 */
@Service
public class OrderDetailServiceImpl extends ServiceImpl<OrderDetailMapper, OrderDetail> implements OrderDetailService {

}

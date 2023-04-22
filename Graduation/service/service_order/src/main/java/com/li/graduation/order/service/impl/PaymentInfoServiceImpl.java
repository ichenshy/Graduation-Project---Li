package com.li.graduation.order.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.li.graduation.model.order.PaymentInfo;
import com.li.graduation.order.mapper.PaymentInfoMapper;
import com.li.graduation.order.service.PaymentInfoService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 支付信息表 服务实现类
 * </p>
 *
 * @author lishan
 * 
 */
@Service
public class PaymentInfoServiceImpl extends ServiceImpl<PaymentInfoMapper, PaymentInfo> implements PaymentInfoService {

}

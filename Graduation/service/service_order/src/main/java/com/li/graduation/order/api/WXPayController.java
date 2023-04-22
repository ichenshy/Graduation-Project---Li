package com.li.graduation.order.api;

import com.li.graduation.order.service.OrderInfoService;
import com.li.graduation.order.service.WXPayService;
import com.li.graduation.result.ResultUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Map;

@Api(tags = "微信支付接口")
@RestController
@RequestMapping("/api/order/wxPay")
public class WXPayController {


    private WXPayService wxPayService;
    @Resource
    private OrderInfoService orderInfoService;

    @ApiOperation(value = "下单 小程序支付")
    @GetMapping("/createJsapi/{orderNo}")
    public ResultUtils createJsapi(
            @ApiParam(name = "orderNo", value = "订单No", required = true)
            @PathVariable("orderNo") String orderNo) {
        return ResultUtils.ok(wxPayService.createJsapi(orderNo));
    }

    @ApiOperation(value = "查询支付状态")
    @GetMapping("/queryPayStatus/{orderNo}")
    public ResultUtils queryPayStatus(
            @ApiParam(name = "orderNo", value = "订单No", required = true)
            @PathVariable("orderNo") String orderNo) {
        System.out.println("orderNo:" + orderNo);
        //调用查询接口
        Map<String, String> resultMap = wxPayService.queryPayStatus(orderNo);
        if (resultMap == null) {//出错
            return ResultUtils.fail(null).message("支付出错");
        }
        if ("SUCCESS".equals(resultMap.get("trade_state"))) {//如果成功
            //更改订单状态，处理支付结果
            String out_trade_no = resultMap.get("out_trade_no");
            System.out.println("out_trade_no:" + out_trade_no);
            orderInfoService.updateOrderStatus(out_trade_no);
            return ResultUtils.ok(null).message("支付成功");
        }
        return ResultUtils.ok(null).message("支付中");
    }
    // //模拟支付成功
    //@GetMapping("/paySuccess")
    //private ResultUtils paySuccess(String courseId){
    //        //将课程改成免费 price：0
    //        //String out_trade_no = resultMap.get("out_trade_no");
    //        //System.out.println("out_trade_no:" + out_trade_no);
    //        //orderInfoService.updateOrderStatus(out_trade_no);
    //        return ResultUtils.ok(null).message("支付成功");
    //}
}

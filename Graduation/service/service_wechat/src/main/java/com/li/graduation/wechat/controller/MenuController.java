package com.li.graduation.wechat.controller;


import com.alibaba.fastjson.JSONObject;
import com.li.graduation.model.wechat.Menu;
import com.li.graduation.result.ResultUtils;
import com.li.graduation.vo.wechat.MenuVo;
import com.li.graduation.wechat.service.MenuService;
import com.li.graduation.wechat.utils.ConstantPropertiesUtil;
import com.li.graduation.wechat.utils.HttpClientUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import me.chanjar.weixin.common.error.WxErrorException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 订单明细 订单明细 前端控制器
 * </p>
 *
 * @author lishan
 * 
 */
@Api(tags = "公众号")
@RestController
@RequestMapping("/admin/wechat/menu")
public class MenuController {

    @Resource
    private MenuService menuService;

    //获取所有菜单，按照一级和二级菜单封装
    @ApiOperation(value = "获取所有菜单")
    @GetMapping("findMenuInfo")
    public ResultUtils findMenuInfo() {
        List<MenuVo> list = menuService.findMenuInfo();
        return ResultUtils.ok(list);
    }

    //获取所有一级菜单
    @ApiOperation(value = "获取所有一级菜单")
    @GetMapping("findOneMenuInfo")
    public ResultUtils findOneMenuInfo() {
        List<Menu> list = menuService.findMenuOneInfo();
        return ResultUtils.ok(list);
    }

    @ApiOperation(value = "获取")
    @GetMapping("get/{id}")
    public ResultUtils get(@PathVariable Long id) {
        Menu menu = menuService.getById(id);
        return ResultUtils.ok(menu);
    }

    @ApiOperation(value = "新增")
    @PostMapping("save")
    public ResultUtils save(@RequestBody Menu menu) {
        menuService.save(menu);
        return ResultUtils.ok(null);
    }

    @ApiOperation(value = "修改")
    @PutMapping("update")
    public ResultUtils updateById(@RequestBody Menu menu) {
        menuService.updateById(menu);
        return ResultUtils.ok(null);
    }

    @ApiOperation(value = "删除")
    @DeleteMapping("remove/{id}")
    public ResultUtils remove(@PathVariable Long id) {
        menuService.removeById(id);
        return ResultUtils.ok(null);
    }

    @ApiOperation(value = "根据id列表删除")
    @DeleteMapping("batchRemove")
    public ResultUtils batchRemove(@RequestBody List<Long> idList) {
        menuService.removeByIds(idList);
        return ResultUtils.ok(null);
    }
    //获取access_token
    @ApiOperation(value = "获取access_token")
    @GetMapping("getAccessToken")
    public ResultUtils getAccessToken() {
        try {
            //拼接请求地址
            StringBuffer buffer = new StringBuffer();
            buffer.append("https://api.weixin.qq.com/cgi-bin/token");
            buffer.append("?grant_type=client_credential");
            buffer.append("&appid=%s");
            buffer.append("&secret=%s");
            //请求地址设置参数
            String url = String.format(buffer.toString(),
                    ConstantPropertiesUtil.ACCESS_KEY_ID,
                    ConstantPropertiesUtil.ACCESS_KEY_SECRET);
            //发送http请求
            String tokenString = HttpClientUtils.get(url);
            //获取access_token
            JSONObject jsonObject = JSONObject.parseObject(tokenString);
            String access_token = jsonObject.getString("access_token");
            //返回
            return ResultUtils.ok(access_token);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtils.fail(null);
        }
    }
    @ApiOperation(value = "同步菜单")
    @GetMapping("syncMenu")
    public ResultUtils createMenu() throws WxErrorException {
        menuService.syncMenu();
        return ResultUtils.ok(null);
    }
    @ApiOperation(value = "删除菜单")
    @DeleteMapping("removeMenu")
    public ResultUtils removeMenu() {
        menuService.removeMenu();
        return ResultUtils.ok(null);
    }
}


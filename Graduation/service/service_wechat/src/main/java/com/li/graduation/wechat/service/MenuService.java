package com.li.graduation.wechat.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.li.graduation.model.wechat.Menu;
import com.li.graduation.vo.wechat.MenuVo;

import java.util.List;

/**
 * <p>
 * 订单明细 订单明细 服务类
 * </p>
 *
 * @author lishan
 * 
 */
public interface MenuService extends IService<Menu> {

    List<MenuVo> findMenuInfo();

    List<Menu> findMenuOneInfo();

    void syncMenu();

    void removeMenu();
}

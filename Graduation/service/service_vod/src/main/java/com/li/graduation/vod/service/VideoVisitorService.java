package com.li.graduation.vod.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.li.graduation.model.vod.VideoVisitor;

import java.util.Map;

/**
 * <p>
 * 视频来访者记录表 服务类
 * </p>
 *
 * @author lishan
 * @since 2022-08-11
 */
public interface VideoVisitorService extends IService<VideoVisitor> {

    Map<String, Object> findCount(Long courseId, String startDate, String endDate);
}

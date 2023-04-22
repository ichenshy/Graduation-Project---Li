package com.li.graduation.vod.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.li.graduation.model.vod.Video;

/**
 * <p>
 * 课程视频 服务类
 * </p>
 *
 * @author lishan
 * @since 2022-08-11
 */
public interface VideoService extends IService<Video> {

    void removeVideoByCourseId(Long id);
}

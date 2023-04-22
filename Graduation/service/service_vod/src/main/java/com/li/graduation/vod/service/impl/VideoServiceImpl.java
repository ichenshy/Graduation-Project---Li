package com.li.graduation.vod.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.li.graduation.model.vod.Video;
import com.li.graduation.vod.mapper.VideoMapper;
import com.li.graduation.vod.service.VideoService;
import com.li.graduation.vod.service.VodService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 课程视频 服务实现类
 * </p>
 *
 * @author lishan
 * @since 2022-08-11
 */
@Service
public class VideoServiceImpl extends ServiceImpl<VideoMapper, Video> implements VideoService {

    //@Override
    //public void removeVideoByCourseId(Long id) {
    //    LambdaQueryWrapper<Video> wrapper = new LambdaQueryWrapper<>();
    //    wrapper.eq(video -> video.getCourseId(), id);
    //    baseMapper.delete(wrapper);
    //}
    //根据课程id删除小节   删除所有小节视频
    @Resource
    private VodService vodService;
    @Override
    public void removeVideoByCourseId(Long id) {
        //根据课程id查询课程所有小节
        QueryWrapper<Video> wrapper = new QueryWrapper<>();
        wrapper.eq("course_id",id);
        List<Video> videoList = baseMapper.selectList(wrapper);
        //遍历所有小节集合得到每个小节，获取每个小节视频id
        for (Video video:videoList) {
            //获取每个小节视频id
            String videoSourceId = video.getVideoSourceId();
            //判断视频id是否为空，不为空，删除腾讯云视频
            if(!StringUtils.isEmpty(videoSourceId)) {
                //删除腾讯云视频
                vodService.removeVideo(videoSourceId);
            }
        }
        //根据课程id删除课程所有小节
        baseMapper.delete(wrapper);
    }
}

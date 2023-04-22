package com.li.graduation.vod.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.li.graduation.model.vod.VideoVisitor;
import com.li.graduation.vo.vod.VideoVisitorCountVo;
import com.li.graduation.vo.vod.VideoVisitorVo;
import com.li.graduation.vod.mapper.VideoVisitorMapper;
import com.li.graduation.vod.service.VideoVisitorService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 * 视频来访者记录表 服务实现类
 * </p>
 *
 * @author lishan
 * @since 2022-08-11
 */
@Service
public class VideoVisitorServiceImpl extends ServiceImpl<VideoVisitorMapper, VideoVisitor> implements VideoVisitorService {

    @Override
    public Map<String, Object> findCount(Long courseId, String startDate, String endDate) {
        List<VideoVisitorCountVo> videoVisitVoList = baseMapper.findCount(courseId, startDate, endDate);
        Map<String, Object> map = new HashMap<>();
        //创建两个list集合，一个代表所有日期，一个代表日期对应数量
        List<String> dateList = videoVisitVoList.stream().map(videoVisitorCountVo -> videoVisitorCountVo.getJoinTime()).collect(Collectors.toList());
        List<Integer> countList = videoVisitVoList.stream().map(videoVisitorCountVo -> videoVisitorCountVo.getUserCount()).collect(Collectors.toList());
        //放到map集合
        map.put("xData", dateList);
        map.put("yData", countList);
        return map;
    }
}

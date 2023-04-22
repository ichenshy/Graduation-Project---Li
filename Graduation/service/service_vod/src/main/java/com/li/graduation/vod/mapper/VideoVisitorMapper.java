package com.li.graduation.vod.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.li.graduation.model.vod.VideoVisitor;
import com.li.graduation.vo.vod.VideoVisitorCountVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 视频来访者记录表 Mapper 接口
 * </p>
 *
 * @author lishan
 * @since 2022-08-11
 */
public interface VideoVisitorMapper extends BaseMapper<VideoVisitor> {

    List<VideoVisitorCountVo> findCount(@Param("courseId") Long courseId, @Param("startDate") String startDate, @Param("endDate") String endDate);
}

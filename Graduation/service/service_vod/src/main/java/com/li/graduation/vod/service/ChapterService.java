package com.li.graduation.vod.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.li.graduation.model.vod.Chapter;
import com.li.graduation.vo.vod.ChapterVo;
import com.li.graduation.vo.vod.CourseQueryVo;
import com.li.graduation.vo.vod.CourseVo;

import java.util.List;

/**
 * <p>
 * 课程 服务类
 * </p>
 *
 * @author lishan
 * @since 2022-08-11
 */
public interface ChapterService extends IService<Chapter> {

    List<ChapterVo> getNestedTreeList(long courseId);

    void removeChapterByCourseId(Long id);

}

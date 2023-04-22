package com.li.graduation.vod.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.li.graduation.model.vod.Chapter;
import com.li.graduation.model.vod.Video;
import com.li.graduation.vo.vod.ChapterVo;
import com.li.graduation.vo.vod.CourseQueryVo;
import com.li.graduation.vo.vod.CourseVo;
import com.li.graduation.vo.vod.VideoVo;
import com.li.graduation.vod.mapper.ChapterMapper;
import com.li.graduation.vod.service.ChapterService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.li.graduation.vod.service.VideoService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 课程 服务实现类
 * </p>
 *
 * @author lishan
 * @since 2022-08-11
 */
@Service
public class ChapterServiceImpl extends ServiceImpl<ChapterMapper, Chapter> implements ChapterService {

    @Resource
    private VideoService videoService;

    @Override
    public List<ChapterVo> getNestedTreeList(long courseId) {
        ArrayList<ChapterVo> finalChapterList = new ArrayList<>();
        QueryWrapper<Chapter> wrapperChapter = new QueryWrapper<>();
        wrapperChapter.eq("course_id", courseId);
        //根据course_id查询章节
        List<Chapter> chapterList = baseMapper.selectList(wrapperChapter);
        for (Chapter chapter : chapterList) {
            QueryWrapper<Video> wrapperVideo = new QueryWrapper<>();
            ChapterVo chapterVo = new ChapterVo();
            BeanUtils.copyProperties(chapter, chapterVo);
            finalChapterList.add(chapterVo);
            //根据chapter_id来查询章节中的小节
            Long chapterVoId = chapterVo.getId();
            wrapperVideo.eq("chapter_id", chapterVoId);
            List<Video> list = videoService.list(wrapperVideo);
            List<VideoVo> videoVoList = new ArrayList<>();
            list.forEach(video -> {
                VideoVo videoVo = new VideoVo();
                BeanUtils.copyProperties(video, videoVo);
                videoVoList.add(videoVo);
            });
            chapterVo.setChildren(videoVoList);
        }
        return finalChapterList;
    }

    @Override
    public void removeChapterByCourseId(Long id) {
        QueryWrapper<Chapter> wrapper = new QueryWrapper<>();
        wrapper.eq("course_id",id);
        baseMapper.delete(wrapper);
    }

}

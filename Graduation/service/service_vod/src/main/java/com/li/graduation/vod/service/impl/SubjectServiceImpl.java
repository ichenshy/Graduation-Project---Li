package com.li.graduation.vod.service.impl;


import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.li.graduation.exception.CustomizeException;
import com.li.graduation.model.vod.Subject;
import com.li.graduation.vo.vod.SubjectEeVo;
import com.li.graduation.vod.listener.SubjectListener;
import com.li.graduation.vod.mapper.SubjectMapper;
import com.li.graduation.vod.service.SubjectService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 课程科目 服务实现类
 * </p>
 *
 * @author lishan
 * @since 2022-08-11
 */
@Service
@Slf4j
public class SubjectServiceImpl extends ServiceImpl<SubjectMapper, Subject> implements SubjectService {

    @Resource
    private SubjectListener subjectListener;

    @Override
    public List<Subject> selectSubjectList(Long id) {
        QueryWrapper<Subject> wrapper = new QueryWrapper<>();
        wrapper.eq("parent_id", id);
        List<Subject> subjectList = baseMapper.selectList(wrapper);
        subjectList.stream().filter(subject -> {
            Long subjectId = subject.getId();
            boolean children = isChildren(subjectId);
            subject.setHasChildren(children);
            return true;
        }).count();
        return subjectList;
    }

    @Override
    public Boolean exportData(HttpServletResponse response) {
        try {
            response.setContentType("application/vnd.ms-excel");
            response.setCharacterEncoding("utf-8");
            // 这里URLEncoder.encode可以防止中文乱码 当然和easyexcel没有关系
            String fileName = URLEncoder.encode("课程分类", "UTF-8");
            response.setHeader("Content-disposition", "attachment;filename=" + fileName + ".xlsx");
            List<Subject> subjectList = baseMapper.selectList(null);
            List<SubjectEeVo> dictVoList = subjectList.stream().map((subject) -> {
                SubjectEeVo subjectEeVo = new SubjectEeVo();
                BeanUtils.copyProperties(subject, subjectEeVo);
                return subjectEeVo;
            }).collect(Collectors.toList());
            EasyExcel.write(response.getOutputStream(), SubjectEeVo.class)
                    .sheet("课程分类").doWrite(dictVoList);
        } catch (Exception e) {
            throw new CustomizeException(20001, "导出失败");
        }
        return true;
    }

    @Override
    public Boolean importData(MultipartFile file) {
        try {
            EasyExcel.read(file.getInputStream(), SubjectEeVo.class, subjectListener).sheet().doRead();
        } catch (IOException e) {
            throw new CustomizeException(20001, "导入失败");
        }
        return true;
    }

    @Override
    public boolean deleteById(Long id) {
        boolean children = isChildren(id);
        if (!children) {
            return baseMapper.deleteById(id) == 1;
        } else {
            throw new CustomizeException(20001, "请先删除子数据");
        }
    }

    //判断是否有下一层数据
    private boolean isChildren(Long subjectId) {
        QueryWrapper<Subject> wrapper = new QueryWrapper<>();
        wrapper.eq("parent_id", subjectId);
        Integer count = baseMapper.selectCount(wrapper);
        return count > 0;
    }
}

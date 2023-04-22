package com.li.graduation.vod.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.li.graduation.model.vod.Subject;
import org.apache.http.HttpResponse;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * <p>
 * 课程科目 服务类
 * </p>
 *
 * @author lishan
 * @since 2022-08-11
 */
public interface SubjectService extends IService<Subject> {

    List<Subject> selectSubjectList(Long id);

    Boolean exportData(HttpServletResponse response);

    Boolean importData(MultipartFile file);

    boolean deleteById(Long id);
}

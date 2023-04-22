package  com.li.graduation.vod.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.li.graduation.model.vod.Teacher;
import com.baomidou.mybatisplus.extension.service.IService;
import com.li.graduation.vo.vod.TeacherQueryVo;

/**
 * <p>
 * 讲师 服务类
 * </p>
 *
 * @author lishan
 * @since 2022-08-10
 */
public interface TeacherService extends IService<Teacher> {

    IPage<Teacher> findQueryPage(Page<Teacher> pageParam, TeacherQueryVo teacherQueryVo);
}

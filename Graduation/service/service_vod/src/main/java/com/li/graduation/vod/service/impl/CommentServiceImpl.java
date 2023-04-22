package com.li.graduation.vod.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.li.graduation.model.vod.Comment;
import com.li.graduation.vod.mapper.CommentMapper;
import com.li.graduation.vod.service.CommentService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 评论 服务实现类
 * </p>
 *
 * @author lishan
 * @since 2022-08-11
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {

}

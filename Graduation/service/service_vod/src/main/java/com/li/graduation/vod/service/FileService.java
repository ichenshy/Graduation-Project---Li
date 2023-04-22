package com.li.graduation.vod.service;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author lishan
 * @version v1.0
 * @date 2022/8/11
 */
public interface FileService {
    String upload(MultipartFile file);
}

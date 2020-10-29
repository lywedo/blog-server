package com.dream.common.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


import io.minio.MinioClient;
import lombok.extern.slf4j.Slf4j;

/**
 * minio客户端配置
 */
@Slf4j
@Configuration
public class MinioConfig {
    @Autowired
    private MinioParam minioParam;

    /**
     * 初始化minio客户端,不用每次都初始化
     */
    @Bean
    public MinioClient minioClient() {
        try {
            return new MinioClient(minioParam.getUrl(), minioParam.getAccessKey(), minioParam.getSecretKey());
        }
        catch (final Exception e) {
            log.error("初始化minio出现异常:{}", e.fillInStackTrace());
        }
        return null;
    }
}

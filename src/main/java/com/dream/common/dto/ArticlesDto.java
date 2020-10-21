package com.dream.common.dto;

import lombok.Data;

@Data
public class ArticlesDto {
    /**
     * 发表用户ID
     */
    private Long userId;

    /**
     * 博文标题
     */
    private String articleTitle;

    /**
     * 博文内容
     */
    private String articleContent;

    private String articleDescription;
}

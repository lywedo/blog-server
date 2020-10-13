package com.dream.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author lam
 * @since 2020-10-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_set_article_sort")
public class SetArticleSort implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 文章ID
     */
    private Long articleId;

    /**
     * 分类ID
     */
    private Long sortId;


}

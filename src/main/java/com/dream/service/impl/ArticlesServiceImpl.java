package com.dream.service.impl;

import com.dream.entity.Articles;
import com.dream.mapper.ArticlesMapper;
import com.dream.service.ArticlesService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author lam
 * @since 2020-10-15
 */
@Service
public class ArticlesServiceImpl extends ServiceImpl<ArticlesMapper, Articles> implements ArticlesService {

}

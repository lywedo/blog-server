package com.dream.controller;


import cn.hutool.core.bean.BeanUtil;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dream.common.dto.ArticlesDto;
import com.dream.common.lang.Result;
import com.dream.common.vo.ArticleVo;
import com.dream.entity.Articles;
import com.dream.service.ArticlesService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author lam
 * @since 2020-10-12
 */
@Slf4j
@RestController
@RequestMapping("/articles")
public class ArticlesController {
    @Autowired
    ArticlesService articlesService;

    @GetMapping("/query")
    public Result list(@RequestParam(defaultValue = "1", name = "page") Integer currentPage, @RequestParam(name = "pageSize")Integer pageSize) {

        Page page = new Page(currentPage, pageSize);
        IPage pageData = articlesService.page(page, new QueryWrapper<Articles>().orderByDesc("article_date"));
        ArrayList<ArticleVo> records = new ArrayList<>();
        for (Object obj :
                pageData.getRecords()) {
            ArticleVo articleVo = new ArticleVo();
            BeanUtil.copyProperties(obj, articleVo);
            records.add(articleVo);
        }
        pageData.setRecords(records);
        return Result.succ(pageData);
    }

    @GetMapping("/{id}")
    public Result detail(@PathVariable(name = "id") Long id) {
        return Result.succ(articlesService.getById(id));
    }

    @PostMapping("publish")
    public Result publishBlog(@RequestBody ArticlesDto article){
        log.info(JSON.toJSONString(article));
        return Result.succ(article);
    }


}

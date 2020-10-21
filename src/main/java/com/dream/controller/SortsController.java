package com.dream.controller;


import com.dream.common.lang.Result;
import com.dream.entity.Sorts;
import com.dream.service.SortsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author lam
 * @since 2020-10-13
 */
@RestController
@RequestMapping("/sorts")
public class SortsController {

    @Autowired
    private SortsService sortsService;

    @RequestMapping("/all")
    public Result getAllSorts(){
        List<Sorts> objects = sortsService.list();

        return Result.succ(objects);
    }
}

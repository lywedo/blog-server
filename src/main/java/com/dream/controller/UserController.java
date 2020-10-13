package com.dream.controller;


import com.dream.common.lang.Result;
import com.dream.entity.User;
import com.dream.service.UserService;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author lam
 * @since 2020-09-25
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;

    @GetMapping("/{id}")
    public Object getById(@PathVariable("id") Long id){
        return userService.getById(id);
    }

    @RequiresAuthentication
    @GetMapping("/index")
    public Result index() {
        User user = userService.getById(1L);
        return Result.succ(user);
    }

    @PostMapping("/save")
    public Result save(@Validated @RequestBody User user) {
        return Result.succ(user);
    }
}

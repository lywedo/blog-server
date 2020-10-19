package com.dream.service;

import com.dream.entity.Users;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author lam
 * @since 2020-10-16
 */
public interface UsersService extends IService<Users> {
    Users getUsersByUsername(String username);

}

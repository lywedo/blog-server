package com.dream.mapper;

import com.dream.entity.Users;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author lam
 * @since 2020-10-16
 */
public interface UsersMapper extends BaseMapper<Users> {
    Users getUsersByUsername(String username);
}

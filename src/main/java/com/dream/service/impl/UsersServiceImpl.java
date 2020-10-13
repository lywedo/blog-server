package com.dream.service.impl;

import com.dream.entity.Users;
import com.dream.mapper.UsersMapper;
import com.dream.service.UsersService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author lam
 * @since 2020-10-13
 */
@Service
public class UsersServiceImpl extends ServiceImpl<UsersMapper, Users> implements UsersService {

}

package com.nci.mediccare.manager;

import com.nci.mediccare.domain.User;
import com.nci.mediccare.mapper.UserMapper;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class RegisterManagerImpl implements RegisterManager {

    @Resource
    private UserMapper userMapper;

    @Override
    public User register(User user) {
        user.setCreateTime(new Date());
        userMapper.insert(user);
        return user;
    }
}

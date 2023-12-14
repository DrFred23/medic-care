package com.nci.mediccare.manager;

import com.nci.mediccare.domain.User;
import com.nci.mediccare.mapper.UserMapper;
import com.nci.mediccare.pojo.UserPojo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class UserManagerImpl implements UserManager {

    @Resource
    private UserMapper userMapper;

    @Override
    public User register(User user) {
        user.setCreateTime(new Date());
        userMapper.insert(user);
        return user;
    }

    @Override
    public User selectById(long id) {
        return userMapper.selectById(id);
    }

    @Override
    public List<User> selectAllPatients() {
        return userMapper.selectAllPatients();
    }

    @Override
    public User loginProcess(UserPojo userPojo) {
        return userMapper.login(userPojo);
    }

    @Override
    public User selectByNameAndType(UserPojo userPojo) {
        return userMapper.selectByNameAndType(userPojo);
    }
}

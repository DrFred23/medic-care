package com.nci.mediccare;

import com.nci.mediccare.domain.User;
import com.nci.mediccare.mapper.UserMapper;
import jakarta.annotation.Resource;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;

/**
 * MapperTest
 *
 * @Author: Alfred
 * @CreateTime: 2023-10-15
 */
@SpringBootTest
public class MapperTest {
    @Resource
    private UserMapper userMapper;

    @Test
    public void testUserInsert() {
        User user = new User();
        user.setUsername("Alfred");
        user.setPassword("321");
        user.setCreateTime(new Date());
        userMapper.insert(user);
    }
}

package com.nci.mediccare.mapper;

import com.nci.mediccare.domain.User;
import com.nci.mediccare.pojo.UserPojo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {

    void insert(User user);

    User selectById(long id);

    User login(UserPojo userPojo);

    List<User> selectAllPatients();

    User selectByNameAndType(UserPojo userPojo);
}

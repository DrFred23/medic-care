package com.nci.mediccare.mapper;

import com.nci.mediccare.domain.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    void insert(User user);
}

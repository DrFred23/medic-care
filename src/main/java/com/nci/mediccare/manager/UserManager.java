package com.nci.mediccare.manager;

import com.nci.mediccare.domain.User;
import com.nci.mediccare.pojo.UserPojo;

import java.util.List;

public interface UserManager {
    User register(User user);

    User selectById(long id);

    List<User> selectAllPatients();

    User loginProcess(UserPojo userPojo);

    User selectByNameAndType(UserPojo userPojo);


}

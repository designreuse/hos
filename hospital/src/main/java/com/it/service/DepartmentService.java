package com.it.service;



import com.google.common.collect.Lists;
import com.it.dao.DepartmentDao;
import com.it.dao.UserDao;
import com.it.pojo.Department;
import com.it.pojo.User;
import com.it.util.ShiroUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.ArrayList;
import java.util.List;

@Named
@Transactional
public class DepartmentService {
    Logger logger = LoggerFactory.getLogger(DepartmentService.class);

    @Inject
    private DepartmentDao departmentDao;

    @Inject
    private UserDao userDao;

    public  List<Department> findAllDepts() {

        // Integer id = ShiroUtil.getCurrentUserId();
        User user = userDao.findById(2);
        Department department = user.getDepartment();
        if("doctor".equals(user.getRole())){
            return Lists.newArrayList(department);
        }
        return departmentDao.queryAll();
    }
}

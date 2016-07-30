package com.it.service;



import com.it.dao.DepartmentDao;
import com.it.pojo.Department;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
public class DepartmentService {
    Logger logger = LoggerFactory.getLogger(DepartmentService.class);

    @Inject
    private DepartmentDao departmentDao;


    public List<Department> findAllDepts() {
        return departmentDao.queryAll();
    }
}

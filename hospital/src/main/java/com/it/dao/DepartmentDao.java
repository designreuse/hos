package com.it.dao;



import com.it.pojo.Department;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.inject.Named;

@Named
public class DepartmentDao extends PrimaryDao<Department,Integer> {
    Logger logger = LoggerFactory.getLogger(DepartmentDao.class);
}

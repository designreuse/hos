package com.it.dao;



import com.it.pojo.Information;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.inject.Named;

@Named
public class InformationDao extends PrimaryDao<Information,Integer> {
    Logger logger = LoggerFactory.getLogger(InformationDao.class);
}

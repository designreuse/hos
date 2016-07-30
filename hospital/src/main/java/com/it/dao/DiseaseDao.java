package com.it.dao;



import com.it.pojo.Disease;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.inject.Named;

@Named
public class DiseaseDao extends PrimaryDao<Disease,Integer> {
    Logger logger = LoggerFactory.getLogger(DiseaseDao.class);
}

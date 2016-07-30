package com.it.dao;


import com.it.pojo.Record;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.inject.Named;

@Named
public class RecordDao extends PrimaryDao<Record,Integer> {
    Logger logger = LoggerFactory.getLogger(RecordDao.class);
}

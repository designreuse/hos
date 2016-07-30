package com.it.dao;


import com.it.pojo.Patient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.inject.Named;

@Named
public class PatientDao extends PrimaryDao<Patient,Integer> {
    Logger logger = LoggerFactory.getLogger(PatientDao.class);
}

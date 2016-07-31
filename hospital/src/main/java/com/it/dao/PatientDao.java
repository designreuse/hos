package com.it.dao;


import com.it.pojo.Patient;
import com.it.pojo.User;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.inject.Named;
import java.util.List;

@Named
public class PatientDao extends PrimaryDao<Patient, Integer> {
    Logger logger = LoggerFactory.getLogger(PatientDao.class);

    public List<Patient> findByName(String name) {

        Criteria criteria = getSession().createCriteria(Patient.class);
        criteria.add(Restrictions.like("patientname",name, MatchMode.ANYWHERE));
        return (List<Patient>)criteria.list();

    }
}

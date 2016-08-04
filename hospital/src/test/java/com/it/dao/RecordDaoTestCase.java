package com.it.dao;


import com.google.common.collect.Maps;
import com.it.pojo.Department;
import com.it.pojo.Information;
import com.it.pojo.Patient;
import com.it.pojo.Record;
import com.it.service.DepartmentService;
import com.it.service.PatientService;
import com.it.service.RecordService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;
import java.util.Set;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class RecordDaoTestCase {
    Logger logger = LoggerFactory.getLogger(RecordDaoTestCase.class);


    @Inject
    private RecordService recordService;

    @Inject
    private DepartmentService departmentService;

    @Inject
    private PatientService patientService;

    @Test
    public void testQueryList() {

        Map<String, String> param = Maps.newHashMap();
        param.put("ps_start", "0");
        param.put("pl_length", "10");
        param.put("like_patientname", "李");
        // param.put("like_patient.phone", "123");
        // param.put("eq_station", "在诊");

        List<Record> records = recordService.findRecordList(param);

        Assert.assertNotNull(records);
        for (Record record : records) {
           // Set<Information> informationSet = record.getInformationSet();
          //  logger.debug("informationSet{}", informationSet.size());
            logger.debug("record is {}", record);
        }

    }


    @Test
    public void testFindById(){
        List<Department> departments = departmentService.findAllDepts();
        logger.debug("department is {}",departments.get(0).getDeptname());

    }

    @Test
    public void testFindPatient(){

        Patient patient = patientService.findPatientById(1);

        logger.debug("patient is {}",patient);

    }


}

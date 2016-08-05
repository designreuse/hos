package com.it.service;


import com.it.dao.InsuranceDao;
import com.it.dao.PatientDao;
import com.it.pojo.Insurance;
import com.it.pojo.Patient;
import com.it.util.SmallUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;
import java.util.Map;

@Named
@Transactional
public class PatientService {
    Logger logger = LoggerFactory.getLogger(PatientService.class);

    @Inject
    private InsuranceDao insuranceDao;

    @Inject
    private PatientDao patientDao;

    public List<Insurance> getInsuranceList(){
        return insuranceDao.queryAll();
    }

    /**
     * 输入身份证 411025199212263567
     * birthday :1992-12-26
     * sex : 女
     * age : 23
     */
    public Map<String,String> autoIdentifyCard(String card) {
        return SmallUtils.getPersonInfByIdentifyCard(card);
    }

    /**
     * 保存病人档案
     */
    public void addNewPatient(Patient patient) {
        patient.setCreatetime(SmallUtils.getTime());
        patient.setStation("新建");
        patientDao.save(patient);
    }

    /**
     * 根据姓名查找病人，病人可能重名
     */
    public List<Patient> findByName(String name) {
        return patientDao.findByName(name);
    }


    /**
     * 获取所有的病人
     */
    public List<Patient> findAllPatients() {
        return patientDao.queryAll();
    }


    /**
     * 根据id查找patient
     */
    public Patient findPatientById(Integer id){
        return patientDao.findById(id);
    }





}

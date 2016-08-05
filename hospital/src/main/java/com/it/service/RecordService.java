package com.it.service;


import com.it.dao.DiseaseDao;
import com.it.dao.PatientDao;
import com.it.dao.RecordDao;
import com.it.pojo.Disease;
import com.it.pojo.Patient;
import com.it.pojo.Record;
import com.it.util.ShiroUtil;
import com.it.util.SmallUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Named;
import java.util.List;
import java.util.Map;

@Named
@Transactional
public class RecordService {
    Logger logger = LoggerFactory.getLogger(RecordService.class);

    @Autowired
    private RecordDao recordDao;

    @Autowired
    private PatientDao patientDao;

    @Autowired
    private DiseaseDao diseaseDao;


    public List<Record> findRecordList(Map<String, String> param) {
        return recordDao.queryList(param);
    }

    public Long queryRecordTotal() {
        return recordDao.count();
    }

    public Long queryRecordNumByParams(Map<String, String> param) {
        return recordDao.filter(param);
    }


    public void addnewRecord(Record record) {

        // 更新病人表的状态
        Integer patientid = record.getPatient().getId();
        Patient patient = patientDao.findById(patientid);
        patient.setStation("在诊");
        patientDao.save(patient);

        // 在就诊记录表里插入数据
        record.setCreatetime(SmallUtils.getTime());
        record.setStation("在诊");
        record.setUser(ShiroUtil.getCurrentUser());
        // 时间+医生id + 病人id + 病症id
        String id = SmallUtils.getTimeCondense() + record.getUser().getId() + record.getPatient().getId() + record.getDisease().getId();
        record.setId(id);
        logger.debug("record is {}",record);
        Disease disease = diseaseDao.findById(record.getDisease().getId());
        record.setDiseasename(disease.getSick());
        recordDao.save(record);
    }

    public List<Record> findRecordList() {
        return recordDao.temple();
    }


}

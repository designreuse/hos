package com.it.service;



import com.it.dao.RecordDao;
import com.it.pojo.Record;
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


    }
}

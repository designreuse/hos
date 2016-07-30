package com.it.service;



import com.it.dao.RecordDao;
import com.it.pojo.Record;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.inject.Named;
import java.util.List;
import java.util.Map;

@Named
public class RecordService {
    Logger logger = LoggerFactory.getLogger(RecordService.class);

    @Autowired
    private RecordDao recordDao;


    public static List<Record> findRecordList(Map<String, Object> param) {


        return null;
    }

    public static Long queryRecordTotal() {


        return null;
    }

    public static Long queryRecordByParams(Map<String, Object> param) {


        return null;
    }
}

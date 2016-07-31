package com.it.service;




import com.it.dao.DiseaseDao;
import com.it.pojo.Disease;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
@Transactional
public class DiseaseService {
    Logger logger = LoggerFactory.getLogger(DiseaseService.class);

    @Inject
    private DiseaseDao diseaseDao;

    public List<Disease> findAllDisease() {
        return diseaseDao.queryAll();
    }
}

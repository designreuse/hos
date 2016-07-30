package com.it.service;




import com.it.dao.DiseaseDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.inject.Inject;
import javax.inject.Named;

@Named
public class DiseaseService {
    Logger logger = LoggerFactory.getLogger(DiseaseService.class);

    @Inject
    private DiseaseDao diseaseDao;

}

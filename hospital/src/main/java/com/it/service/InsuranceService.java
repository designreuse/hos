package com.it.service;




import com.it.dao.InsuranceDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.inject.Inject;
import javax.inject.Named;

@Named
public class InsuranceService {
    Logger logger = LoggerFactory.getLogger(InsuranceService.class);
    @Inject
    private InsuranceDao insuranceDao;
}

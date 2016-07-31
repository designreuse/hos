package com.it.service;




import com.it.dao.InsuranceDao;
import com.it.pojo.Insurance;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
@Transactional
public class InsuranceService {
    Logger logger = LoggerFactory.getLogger(InsuranceService.class);
    @Inject
    private InsuranceDao insuranceDao;

    public List<Insurance> findAllInsurance() {
        return insuranceDao.queryAll();
    }
}

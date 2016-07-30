package service;

/**
 * Created by xieyue on 2016/7/29.
 */


import com.google.common.collect.Maps;
import com.it.dao.UserDao;
import com.it.pojo.User;
import org.joda.time.DateTime;
import org.joda.time.Period;
import org.joda.time.PeriodType;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.Map;


public class UserServiceTestCase {
    Logger logger = LoggerFactory.getLogger(UserServiceTestCase.class);


    @Test
    public void testTemple() {
        String card = "410185198910083567";
        Map<String, String> map = Maps.newHashMap();
        String year = card.substring(6, 10);
        String month = card.substring(10, 12);
        String day = card.substring(12, 14);
        String sex = card.substring(16, 17);
        logger.debug("year is {}", year);
        logger.debug("month is {}", month);
        logger.debug("day is {}", day);
        logger.debug("sex is {}", sex);
        map.put("sex", Integer.valueOf(sex) % 2 == 0 ? "女" : "男");
        map.put("brthday",year + "-" +month +"-"+day);
        DateTime dateTime = new DateTime(
                Integer.parseInt(year),
                Integer.parseInt(month),
                Integer.parseInt(day), 0, 0);
        DateTime dateTime1 = DateTime.now();
        Integer years = new Period(dateTime,dateTime1, PeriodType.years()).getYears();
        logger.debug("age is {}",years);
    }


}

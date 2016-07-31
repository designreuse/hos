package service;

/**
 * Created by xieyue on 2016/7/29.
 */


import com.google.common.collect.Maps;
import com.it.dao.UserDao;
import com.it.pojo.User;
import com.it.util.SmallUtils;
import org.joda.time.DateTime;
import org.joda.time.Period;
import org.joda.time.PeriodType;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
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
        map.put("brthday", year + "-" + month + "-" + day);
        DateTime dateTime = new DateTime(
                Integer.parseInt(year),
                Integer.parseInt(month),
                Integer.parseInt(day), 0, 0);
        DateTime dateTime1 = DateTime.now();
        Integer years = new Period(dateTime, dateTime1, PeriodType.years()).getYears();
        logger.debug("age is {}", years);
    }

    @Test
    public void testUpdate() throws InvocationTargetException, IllegalAccessException {
        User user1 = new User();
        user1.setEnable(true);
        user1.setCreatetime(SmallUtils.getTime());
        user1.setPassword("123456");
        user1.setId(1);
        user1.setUsername("jim");
        user1.setRealname("tom");

        User user2 = new User();
        user2.setPassword("789456");
        user2.setId(1);
        user2.setUsername("queen");
        user2.setRealname("tom");
         // BeanUtils.copyProperties(user2,user1);

        SmallUtils.copyProperties(user2,user1);

        logger.debug("user1 is {}",user1);
    }


}

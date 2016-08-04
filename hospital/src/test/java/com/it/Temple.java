package com.it;


import com.google.common.collect.Lists;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Temple {
    Logger logger = LoggerFactory.getLogger(Temple.class);

    @Test
    public void testTemple(){

        List<String> lists = Lists.newArrayList();
        lists.add("iop");
        lists.add("asdf");
        lists.add("wer");
        lists.add("qwe");
        lists.add("345");

        for(String str : lists){
            logger.debug("str is {}",str);
        }

        logger.debug("====================================");
        Collections.sort(lists, new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                return o2.compareTo(o1);
            }
        });

        for(String str : lists){
            logger.debug("str is {}",str);
        }

    }







}

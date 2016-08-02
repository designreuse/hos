package com.it.dao;


import com.it.pojo.Record;
import com.it.pojo.Search;
import org.hibernate.Query;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.inject.Named;
import java.util.List;
import java.util.Map;

@Named
public class RecordDao extends PrimaryDao<Record,Integer> {
    Logger logger = LoggerFactory.getLogger(RecordDao.class);

    /**
     * 根据参数查找结果
     */
    public List<Record> queryList(Map<String, String> param) {
        List<Search> searches = Search.getParametersList(param);

        return queryByParameters(searches);
    }

    /**
     * 查询符合条件的数据总条数
     */
    public Long filter(Map<String, String> param) {
        List<Search> searches = Search.getParametersList(param,"ps","pl");
        return queryCount(searches);
    }


    /**
     * test
     */
    public List<Record> temple(){
        String hql = "from Record as r left join Patient as p on r.patient.id = p.id ";
        Session session  = getSession();
        Query query = session.createQuery(hql);
        return (List<Record>)query.list();
    }



}

package com.it.controller;


import com.google.common.collect.Maps;
import com.it.dao.RecordDao;
import com.it.dto.DataTablesResult;
import com.it.pojo.Record;
import com.it.service.RecordService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/record")
public class RecordController {
    Logger logger = LoggerFactory.getLogger(RecordController.class);

    @Inject
    private RecordDao recordDao;
    /**
     * 获取就诊记录界面
     */
    @RequestMapping(method = RequestMethod.GET)
    public String getRecordPage(){
        return "record/recordlist";
    }

    /**
     * dataTable获取数据列
     */
    @RequestMapping(value = "/load", method = RequestMethod.GET)
    @ResponseBody
    public DataTablesResult<Record> showSaleDataTable(HttpServletRequest request) {

        String draw = request.getParameter("draw");
        String start = request.getParameter("start");
        String length = request.getParameter("length");
        String keyword = request.getParameter("search[value]");

        String patientname = request.getParameter("patientname");
        String phone = request.getParameter("phone");
        String station = request.getParameter("station");
        String starts = request.getParameter("starts");
        String ends = request.getParameter("ends");

//        keyword = SmallUtils.transtoUTF8(keyword);
//        salename = SmallUtils.transtoUTF8(salename);
//        proce = SmallUtils.transtoUTF8(proce);
//        starts = SmallUtils.transtoUTF8(starts);
//        if(ends != null){
//            ends = SmallUtils.transtoUTF8(ends + " 23:59:59");
//        } else{
//            ends = SmallUtils.transtoUTF8(ends);
//        }
        Map<String, Object> param = Maps.newHashMap();
        param.put("start", start);
        param.put("length", length);
        param.put("keyword", keyword);
        param.put("patientname", patientname);
        param.put("phone",phone);
        param.put("station", station);
        param.put("starts", starts);
        param.put("ends", ends);

        List<Record> RecordList = RecordService.findRecordList(param);
        Long total = RecordService.queryRecordTotal();
        Long filter = RecordService.queryRecordByParams(param);

         // return new DataTablesResult<>(draw, RecordList, total, filter);
        return null;
    }


}

package com.it.controller;


import com.google.common.collect.Maps;
import com.it.dto.DataTablesResult;
import com.it.pojo.Department;
import com.it.pojo.Disease;
import com.it.pojo.Record;
import com.it.service.DepartmentService;
import com.it.service.DiseaseService;
import com.it.service.RecordService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    private RecordService recordService;

    @Inject
    private DiseaseService diseaseService;

    @Inject
    private DepartmentService departmentService;

    /**
     * 获取就诊记录界面
     */
    @RequestMapping(method = RequestMethod.GET)
    public String getRecordPage() {
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

        start = start == null ? "0" : start;
        length = length == null ? "10" : length;
        if(StringUtils.isNotEmpty(ends)){
            ends = ends + " 23:59:59";
        }
        Map<String, String> param = Maps.newHashMap();
        param.put("ps_start", start);
        param.put("pl_length", length);
        // param.put("keyword", keyword);
        param.put("like_patientname", patientname);
        param.put("like_patient.phone", phone);
        param.put("eq_station", station);
        param.put("ge_createtime", starts);
        param.put("le_createtime", ends);

        List<Record> records = recordService.findRecordList(param);
        Long total = recordService.queryRecordTotal();
        Long filter = recordService.queryRecordNumByParams(param);

        return new DataTablesResult<>(draw, records, total, filter);
    }

    /**
     * 添加新的就诊
     */
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String addNewRecord(Model model){
        List<Disease> diseases = diseaseService.findAllDisease();
        List<Department> departments = departmentService.findAllDepts();
        model.addAttribute("diseases",diseases);
        model.addAttribute("departments",departments);
        return "record/addrecord";
    }
    /**
     * 提交就诊记录
     */
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public String addNewRecord(Record record){
        recordService.addnewRecord(record);
        return "success";
    }

}

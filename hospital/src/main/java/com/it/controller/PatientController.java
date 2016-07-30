package com.it.controller;




import com.it.dto.JSONResult;
import com.it.pojo.Insurance;
import com.it.pojo.Patient;
import com.it.service.PatientService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/patient")
public class PatientController {
    Logger logger = LoggerFactory.getLogger(PatientController.class);

    @Inject
    private PatientService patientService;

    /**
     * 获病人列表
     */
    @RequestMapping(method = RequestMethod.GET)
    public String addNewPatient(Model model){




        return "/patient/patientlist";
    }

    /**
     * 根据身份证自动完成 年龄 出生年月 性别 填写
     */

    @RequestMapping(value = "/autocomplete",method = RequestMethod.GET)
    @ResponseBody
    public JSONResult autoCompleteIdentify(String card){
        Map<String,String> map = patientService.autoIdentifyCard(card);
        return new JSONResult(map);
    }

    /**
     * 提交病人档案
     */
    @RequestMapping(value = "/new",method = RequestMethod.POST)
    @ResponseBody
    public String addNewPatient(Patient patient){
        patientService.addNewPatient(patient);
        return "success";
    }

    /**
     * 获取医疗卡类型
     */
    @RequestMapping(value = "/surelist",method = RequestMethod.GET)
    @ResponseBody
     public JSONResult getInsuranceCard(){
        List<Insurance> insurances = patientService.getInsuranceList();
        return new JSONResult(insurances);
     }
}

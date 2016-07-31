package com.it.pojo;


import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.collect.Multiset;
import com.it.util.SmallUtils;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

public class Search {

    private String type;
    private String property;
    private Object object;


    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }

    public static List<Search> getQueryParamList(HttpServletRequest request) {
        List<Search> searchList = Lists.newArrayList();
        Map<String, Object> map = getParams(request);
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            String str = entry.getKey();
            Object value = entry.getValue();
            // q_i_like_title
            if (str.startsWith("q_")) {
                String[] array = str.split("_", 4);
                if (StringUtils.isNotEmpty(value.toString())) {
                    System.out.println(value);
                    Search search = new Search();
                    search.setType(array[2]);
                    search.setProperty(array[3]);
                    value = transValue(value.toString(), array[1]);
                    search.setObject(value);
                    searchList.add(search);
                    request.setAttribute(str, value);
                }
            }
        }
        return searchList;
    }

    private static Object transValue(String value, String valueType) {

        if ("s".equalsIgnoreCase(valueType)) {
            return value;
        }
        if ("i".equalsIgnoreCase(valueType)) {
            return Integer.parseInt(value);
        }
        if ("f".equalsIgnoreCase(valueType)) {
            return Float.valueOf(value);
        }
        if ("d".equalsIgnoreCase(valueType)) {
            return Double.valueOf(value);
        }
        if ("b".equalsIgnoreCase(valueType)) {
            return Boolean.valueOf(value);
        }
        return null;
    }

    public static Map<String, Object> getParams(HttpServletRequest request) {
        Enumeration<String> enumeration = request.getParameterNames();
        Map<String, Object> map = Maps.newHashMap();
        while (enumeration.hasMoreElements()) {
            String str = enumeration.nextElement();
            String value = request.getParameter(str);
            System.out.println(value);
            map.put(str, value);
        }
        return map;
    }

    /**
     * @param param 参数
     * @param exclude 需要排除的参数
     * @return List<Search>
     */
    public static List<Search> getParametersList(Map<String, String> param, String... exclude) {
        List<Search> searches = Lists.newArrayList();

        for (Map.Entry<String, String> entry : param.entrySet()) {
            boolean flag = true;
            String name = entry.getKey();
            for (String str : exclude) {
                if(name.startsWith(str)){
                    flag = false;
                }
            }
            if(!flag){
                continue;
            }
            String value = entry.getValue();
            if(StringUtils.isEmpty(value)){
                continue;
            }
            Search search = new Search();
            String[] arrays = name.split("_");
            if (arrays.length != 2) {
                throw new RuntimeException("查询条件出错" + name);
            }
            search.setType(arrays[0]);
            search.setProperty(arrays[1]);
            search.setObject(value);
            searches.add(search);
        }

        return searches;
    }
}

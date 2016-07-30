<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>浙江医药</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
<jsp:include page="../include/header.jsp">
    <jsp:param name="menu" value="record"/>
</jsp:include>
<div class="container">

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12">

                <div class="box">
                    <div class="box-header">
            <span class="title">
              <i class="fa fa-info"></i>
              患者基本信息
            </span>
                    </div>
                    <div class="box-body">
                        <table class="table">
                            <tbody>
                            <tr>
                                <td width="100"><strong>姓名</strong></td>
                                <td width="300">
                                    <input type="text" id="name" style="margin:0px">
                                </td>
                                <td width="100"><strong>性别</strong></td>
                                <td width="300"></td>
                                <td width="100"><strong>年龄</strong></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td><strong>身份证号</strong></td>
                                <td></td>
                                <td><strong>联系电话</strong></td>
                                <td></td>
                                <td><strong>医保类型</strong></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td><strong>地址</strong></td>
                                <td colspan="5"></td>
                            </tr>
                            <tr>
                                <td colspan="6"><strong>过敏史</strong></td>
                            </tr>
                            <tr>
                                <td colspan="6">

                                </td>
                            </tr>
                            <tr>
                                <td colspan="6"><strong>备注</strong></td>
                            </tr>
                            <tr>
                                <td colspan="6"></td>
                            </tr>
                            </tbody>

                        </table>
                    </div>
                </div>
                <!-- box end -->

                <div class="box">
                    <div class="box-header">
            <span class="title">
              <i class="fa fa-plus"></i> 病历信息
            </span>
                    </div>
                    <div class="box-body form">
                        <form action="">
                            <label>科室</label>
                            <select name="" id=""></select>
                            <label>病种</label>
                            <select name="" id=""></select>
                            <label>初步诊断</label>
                            <input type="text" class="span12">
                            <label>主要症状</label>
                            <textarea  class="editor1 "></textarea>
                            <label>相关病史</label>
                            <textarea  class="editor2"></textarea>
                            <label>阳性体征</label>
                            <textarea  class="editor3"></textarea>
                            <label>检查结果</label>
                            <textarea  class="editor4"></textarea>
                            <label>治疗方案</label>
                            <textarea  class="editor5"></textarea>
                            <label>管床医生</label>
                            <input type="text">
                            <label>下次复诊时间</label>
                            <input type="text" id="nextTime">
                            <label>影像资料</label>
                            <div id="picker">选择资料</div>
                            <ul id="fileList" class="thumbnails">
                                <li id="WU_FILE_0" class="span2 upload-state-done uploadfile" >
                                    <div class="msg">正在上传...</div>
                                </li>
                            </ul>
                            <div class="form-actions">
                                <button class="button button-flat-action button-pill">保存</button>
                            </div>
                        </form>
                    </div>
                </div>


            </div>
        </div>
    </div>



</div>
<script src="/static/js/jquery-2.2.3.min.js"></script>
<script src="/static/js/bootstrap.js"></script>


</body>
</html>

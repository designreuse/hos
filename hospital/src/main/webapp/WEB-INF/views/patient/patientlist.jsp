<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>浙江医药</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/daterangepicker/daterangepicker-bs3.css">
    <link rel="stylesheet" href="/static/adminlte/plugins/pace/pace.min.css">
    <link rel="stylesheet" href="/static/adminlte/plugins/pace/pace.min.css">
    <link rel="stylesheet" href="/static/adminlte/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/static/adminlte/dist/css/skins/_all-skins.min.css">
</head>
<body>
<jsp:include page="../include/header.jsp">
    <jsp:param name="menu" value="patient"/>
</jsp:include>
<div class="container">
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12">
                <div class="box">
                    <div class="box-header">
                        <span class="title">搜索</span>
                    </div>
                    <div class="box-body search-box">
                        <form action="" class="form-search">
                            <input type="text" placeholder="姓名">
                            <input type="text" placeholder="身份证号">
                            <input type="text" placeholder="电话">
                            <button class="button button-flat-primary button-pill"><i class="fa fa-search"></i>搜索</button>
                            <a href="/patient/add"  class=" btn btn-success pull-right" ><i class="fa fa-plus"></i>新建</a>
                        </form>
                    </div>
                    <div class="box-header">
                        <span class="title"><i class="fa fa-building"></i>患者列表</span>
                    </div>
                    <div class="box-body">
                        <table class="table">
                            <thead>
                            <tr>
                                <th width="100">姓名</th>
                                <th width="50">性别</th>
                                <th width="150">电话</th>
                                <th width="200">医保类型</th>
                                <th>地址</th>
                                <th width="50">状态</th>
                                <th width="100">创建日期</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="patient" items="${patients}">
                                <tr>
                                    <td><a href="#">${patient.patientname}</a></td>
                                    <td>${patient.sex}</td>
                                    <td>${patient.phone}</td>
                                    <td>${patient.insurance.card}</td>
                                    <td>${patient.address}</td>
                                    <td>${patient.station}</td>
                                    <td>${patient.createtime}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</div>
<script src="/static/js/jquery-2.2.3.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/moment/moment.min.js"></script>
<script src="/static/daterangepicker/daterangepicker.js"></script>
<script src="/static/adminlte/plugins/pace/pace.min.js"></script>
<script src="/static/datatable/js/jquery.dataTables.min.js"></script>
<script src="/static/datatable/js/dataTables.bootstrap.min.js"></script>
<script src="/static/adminlte/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="/static/adminlte/plugins/fastclick/fastclick.js"></script>
<script src="/static/adminlte/dist/js/app.min.js"></script>
<script src="/static/adminlte/dist/js/demo.js"></script>
<script src="/static/simditor/scripts/js/simditor-all.min.js"></script>
<script src="/static/js/jquery.validate.min.js"></script>
<script>

    $(function () {



    });

</script>


</body>
</html>

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
    <jsp:param name="menu" value="record"/>
</jsp:include>
<div class="container">

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12">

                <div class="box">
                    <div class="box-header">
                        <span class="title"><i class="fa fa-search"></i> 搜索</span>
                    </div>
                    <div class="box-body search-box">
                        <form action="" class="form-inline">
                            <input type="text" placeholder="请输入姓名" id="patientname" class="form-control" >
                            <input type="text" placeholder="请输入电话" id="phone" class="form-control" >
                            <input type="text" id="rangepicker" class="form-control" placeholder="就诊时间">
                            <select  id="station" class="form-control">
                                <option value="">请选择状态</option>
                                <option value="就诊">就诊</option>
                                <option value="出院">出院</option>
                            </select>
                            <button type="button" class="button button-primary" id="search"><i class="fa fa-search"></i> 搜索</button>
                        </form>
                    </div>
                </div>
                <div class="box">
                    <div class="box-header">
                        <span class="title"><i class="fa fa-stethoscope"></i> 就诊列表</span>
                        <ul class="unstyled inline pull-right">
                            <li><a href="/record/add"><i class="fa fa-plus"></i> 新建</a></li>
                        </ul>
                    </div>
                    <div class="box-body">
                        <table class="table" id="showTable">
                            <thead>
                            <tr>
                                <th >#</th>
                                <th >姓名</th>
                                <th >性别</th>
                                <th >科室</th>
                                <th >病种</th>
                                <th >初步诊断</th>
                                <th >状态</th>
                                <th >创建日期</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
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
<script>
    $(function(){
        var begin = '';
        var end = '';
        // daterangepicker
        $("#rangepicker").daterangepicker({
            format: "YYYY-MM-DD",
            separator: " ",
            locale: {
                "applyLabel": "选择",
                "cancelLabel": "取消",
                "fromLabel": "从",
                "toLabel": "到",
                "customRangeLabel": "自定义",
                "weekLabel": "周",
                "dayOfWeek": [
                    "星期一",
                    "星期二",
                    "星期三",
                    "星期四",
                    "星期五",
                    "星期六",
                    "星期日"
                ],
                "monthNames": [
                    "一月",
                    "二月",
                    "三月",
                    "四月",
                    "五月",
                    "六月",
                    "七月",
                    "八月",
                    "九月",
                    "十月",
                    "葭月",
                    "腊月"
                ],
                "firstDay": 1
            },
            ranges: {
                '今天': [moment(), moment()],
                '昨天': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                '最近7天': [moment().subtract(6, 'days'), moment()],
                '最近30天': [moment().subtract(29, 'days'), moment()],
                '本月': [moment().startOf('month'), moment().endOf('month')],
                '上个月': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            }
        });

        $("#rangepicker").on('apply.daterangepicker', function (ev, picker) {
            console.log("start is " + picker.startDate.format('YYYY-MM-DD'));
            console.log("end is " + picker.endDate.format('YYYY-MM-DD'));
            begin = picker.startDate.format('YYYY-MM-DD');
            end = picker.endDate.format('YYYY-MM-DD');
        });

        // 展示销售信息
        var dataTable = $("#showTable").DataTable({
            searching: false,
            autoWidth: false,
            serverSide: true,
            ordering: true,
            ajax: {
                url: "/record/load",
                data: function (dataSource) {
                    dataSource.patientname = $("#patientname").val();
                    dataSource.phone = $("#phone").val();
                    dataSource.station=$("#station").val();
                    dataSource.starts = begin;
                    dataSource.ends = end;
                }
            },
            columns: [
                {"data": "id"},
                {"data": "patientname"},
                {"data":function(row){
                    return row.patient.sex;
                }},
                {"data":function(row){
                    return row.user.department.deptname;
                }},
                {"data": function(row){
                    return row.disease.sick;
                }},
                {"data":"content"},
                {"data":"station"},
                {"data":"createtime"}
            ],
            "language": { //定义中文
                "search": "输入关键词(客户):",
                "zeroRecords": "没有匹配的数据",
                "lengthMenu": "显示 _MENU_ 条数据",
                "info": "显示从 _START_ 到 _END_ 条数据 共 _TOTAL_ 条数据",
                "infoFiltered": "(过滤了 _MAX_ 条数据)",
                "loadingRecords": "加载中...",
                "processing": "处理中...",
                "paginate": {
                    "first": "首页",
                    "last": "末页",
                    "next": "下一页",
                    "previous": "上一页"
                }
            },
            "columnDefs": [ //定义列的特征
                {targets: [0], visible: false}
//                {targets: [2, 3], orderable: false}
            ]
        });

        // 搜索记录
        $("#search").click(function(){
            dataTable.ajax.reload();
        });
    });

</script>


</body>
</html>

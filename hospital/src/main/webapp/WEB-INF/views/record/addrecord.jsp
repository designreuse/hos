<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>浙江医药</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/simditor/styles/simditor.css">
    <link rel="stylesheet" href="/static/daterangepicker/daterangepicker-bs3.css">
    <link rel="stylesheet" href="/static/adminlte/plugins/pace/pace.min.css">
    <link rel="stylesheet" href="/static/adminlte/plugins/pace/pace.min.css">
    <link rel="stylesheet" href="/static/adminlte/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/static/adminlte/dist/css/skins/_all-skins.min.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<jsp:include page="../include/header.jsp">
    <jsp:param name="menu" value="record"/>
</jsp:include>
<div class="wrapper col-sm-10 col-sm-push-1" style="background-color: transparent; visibility: visible">

    <section class="content" id="content">
        <div class="box box-default">
            <div class="box-header with-border " style="color: #cccccc">
                <h1 class="box-title">用户列表</h1>
                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                            title="Collapse">
                        <i class="fa fa-minus"></i></button>
                </div>
            </div>
            <div class="box-body">
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
                                            <input type="text" id="name" style="margin:0px" autofocus
                                                   class="form-control">
                                            <select id="select" style="z-index: 1000" class="form-control hidden">
                                                <option value="">请选择</option>
                                            </select>
                                        </td>
                                        <td width="100"><strong>性别</strong></td>
                                        <td width="300" id="sex"></td>
                                        <td width="100"><strong>年龄</strong></td>
                                        <td id="age"></td>
                                    </tr>
                                    <tr>
                                        <td><strong>身份证号</strong></td>
                                        <td id="identify"></td>
                                        <td><strong>联系电话</strong></td>
                                        <td id="phone"></td>
                                        <td><strong>医保类型</strong></td>
                                        <td id="card"></td>
                                    </tr>
                                    <tr>
                                        <td><strong>地址</strong></td>
                                        <td colspan="5" id="address"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="6"><strong>过敏史</strong></td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" id="history"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="6"><strong>备注</strong></td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" id="remark"></td>
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
                                <form action="/record/add">
                                    <label>科室</label>
                                    <select name="" ></select>
                                    <label>病种</label>
                                    <select name="" ></select>
                                    <label>初步诊断</label>
                                    <input type="text" class="span12">
                                    <label>主要症状</label>
                                    <textarea class="editor1 "></textarea>
                                    <label>相关病史</label>
                                    <textarea class="editor2"></textarea>
                                    <label>阳性体征</label>
                                    <textarea class="editor3"></textarea>
                                    <label>检查结果</label>
                                    <textarea class="editor4"></textarea>
                                    <label>治疗方案</label>
                                    <textarea class="editor5"></textarea>
                                    <label>管床医生</label>
                                    <input type="text">
                                    <label>下次复诊时间</label>
                                    <input type="text" id="nextTime">
                                    <label>影像资料</label>
                                    <div id="picker">选择资料</div>
                                    <ul id="fileList" class="thumbnails">
                                        <li id="WU_FILE_0" class="span2 upload-state-done uploadfile">
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
            <div class="box-footer">

            </div>
        </div>

    </section>


</div>
<div class="container">

    <div class="container-fluid">

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
<script src="/static/simditor/scripts/simditor-all.min.js"></script>
<script>
    $(function () {
        var editor = new Simditor({
            toolbar: ['title', 'bold', 'italic', 'underline', 'strikethrough', 'ol', 'ul', 'blockquote', 'table', 'link', 'hr', 'indent', 'outdent'],
            textarea: $('.editor1')
        });
        var editor2 = new Simditor({
            toolbar: ['title', 'bold', 'italic', 'underline', 'strikethrough', 'ol', 'ul', 'blockquote', 'table', 'link', 'hr', 'indent', 'outdent'],
            textarea: $('.editor2')
        });
        var editor3 = new Simditor({
            toolbar: ['title', 'bold', 'italic', 'underline', 'strikethrough', 'ol', 'ul', 'blockquote', 'table', 'link', 'hr', 'indent', 'outdent'],
            textarea: $('.editor3')
        });
        var editor4 = new Simditor({
            toolbar: ['title', 'bold', 'italic', 'underline', 'strikethrough', 'ol', 'ul', 'blockquote', 'table', 'link', 'hr', 'indent', 'outdent'],
            textarea: $('.editor4')
        });
        var editor5 = new Simditor({
            toolbar: ['title', 'bold', 'italic', 'underline', 'strikethrough', 'ol', 'ul', 'blockquote', 'table', 'link', 'hr', 'indent', 'outdent'],
            textarea: $('.editor5')
        });
        $("#name").on("blur", function () {
            var $name = $(this).val();
            if ($name) {
                var $select = $("#select");
                $select.html("");
                $.get("/patient/info", {"name": $name})
                        .done(function (result) {
                            if (result.state == 'success') {
                                var data = result.data;
                                if (!data) {
                                    alert("没有符合的条件！");
                                }
                                var length = data.length;
                                if (length >= 2) {
                                    $select.append("<option value=''>请选择</option>");
                                    for (var i = 0; i < length - 1; i++) {
                                        var item = data[i];
                                        var option = "<option value='" + item.id + "'>" + item.patientname + ":" + item.phone + "</option>";
                                        $select.append(option);
                                    }
                                    $select.css("visibility", visible);
                                }
                                var patient = data[0];
                                console.log(patient);
                                $("#name").html(patient.patientname);
                                $("#remark").html(patient.remark);
                                $("#age").html(patient.age);
                                $("#sex").html(patient.sex);
                                $("#identify").html(patient.identify);
                                $("#phone").html(patient.phone);
                                $("#address").html(patient.address);
                                $("#history").html(patient.history);
                                $("#card").html(patient.insurance.card);

                            }
                        })
                        .fail(function () {
                            alert("服务器异常");
                        });
            }
        });


    });
</script>

</body>
</html>

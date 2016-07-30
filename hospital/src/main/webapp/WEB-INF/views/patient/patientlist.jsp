<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>浙江医药</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="/static/simditor/styles/simditor.css">
    <link rel="stylesheet" href="/static/css/style.css">
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
                            <button class="button button-flat-primary button-pill"><i class="fa fa-search"></i> 搜索</button>
                        </form>
                    </div>
                </div>
                <div class="box">
                    <div class="box-header">
                        <span class="title"><i class="fa fa-building"></i> 患者列表</span>
                        <ul class="unstyled inline pull-right">
                            <li><a href="new-patient.html"><i class="fa fa-plus"></i> 新建</a></li>
                        </ul>
                    </div>
                    <div class="box-body">
                        <table class="table">
                            <thead>
                            <tr>
                                <%--<th width="20">--%>
                                    <%--<input type="checkbox" name="" id="">--%>
                                <%--</th>--%>
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
                            <c:forEach var="record" items="records">
                            <tr>
                                <%--<td>--%>
                                    <%--<input type="checkbox" name="" id="">--%>
                                <%--</td>--%>
                                <td><a href="patient.html">${record.patient.patientname}</a></td>
                                <td>${record.patient.sex}</td>
                                <td>${record.patient.phone}</td>
                                <td>${record.insurance.card}</td>
                                <td>${record.patient.address}</td>
                                <td>${record.state}</td>
                                <td>${record.createtime}</td>
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
<script src="/static/js/bootstrap.js"></script>
<script src="/static/simditor/scripts/js/simditor-all.min.js"></script>
<script src="http://cdn.staticfile.org/select2/3.4.8/select2.min.js"></script>
<script src="/static/js/jquery.validate.min.js"></script>
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

        $("#identify").on("keyup", function () {
            var $value = $(this).val();
            if($value.length !=18 ){
                return;
            }
            $.get("/patient/autocomplete", {"card": $value}, function (result) {
                if (result.state == 'success') {
                    var data = result.data;
                    console.log(data.age);
                    $("#age").val(data.age);
                    $("#sex").val(data.sex);
                    $("#birthday").val(data.birthday);
                }
            });
        });
        $("#add").validate({
            errorClass: "text-danger",
            errorElement: "span",
            rules: {
                patientname: {
                    required: true
                },
                identify: {
                    required: true,
                    digits: true,
                   // rangelength: 18
                },
                sex: {
                    required: true,
                },
                age: {
                    required: true,
                    digits: true
                },
                phone: {
                    required: true,
                    digits: true
                },
                insuranceid: {
                    required: true,
                    digits: true
                },
                address: {
                    required: true
                }
            },
            messages: {
                patientname: {
                    required: "请输入姓名"
                },
                identify: {
                    required: "请输入身份证号",
                   // rangelength: "请输入身份证号共{0}位",
                    digits: "请输入数字"

                },
                sex: {
                    required: "请选择性别"
                },
                age: {
                    required: "请输入年龄"

                },
                phone: {
                    required: "请输入电话号码"
                },
                insuranceid: {
                    required: "请选择医保卡类型"

                },
                address: {
                    required: "请输入地址"
                }
            },
            submitHandler: function (form) {
                $.post("/patient/new", $(form).serialize())
                        .done(function(data){
                            $("#content").prepend("<div class='alert alert-success alert-dismissible'>" +
                                    "<button type='button' class='close' data-dismiss='alert' >" +
                                    "<span aria-hidden='true'>&times;</span>" +
                                    "</button><strong>Tips:</strong>state:" + data + "</div>");
                        })
                        .fail(function(){
                            alert("服务器异常");
                        });
            }
        });

        $("#btn").click(function () {
            $("#add").submit();
        });


    });

</script>


</body>
</html>

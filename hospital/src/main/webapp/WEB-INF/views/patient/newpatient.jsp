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
    <div class="row-fluid">
        <div class="span12" id="content">
            <div class="box">
                <div class="box-header">
            <span class="title">
              <i class="fa fa-plus"></i>
              <a href="#"> 患者列表</a>/新增患者
            </span>
                </div>
                <div class="box-body form">
                    <form id="add">
                        <div class="form-group form-inline">
                            <label>姓名</label>
                            <input type="text" class="form-control" name="patientname" autofocus>
                        </div>
                        <div class="form-group form-inline">
                            <label>身份证号</label>
                            <input type="text" class="form-control" name="identify" id="identify">
                        </div>
                        <div class="form-group form-inline">
                            <label>性别</label>
                            <select name="sex" id="sex" class="form-control">
                                <option value="">请选择性别</option>
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                        <div class="form-group form-inline">
                            <label>年龄</label>
                            <input type="text" name="age" class="form-control" id="age">
                        </div>
                        <div class="form-group form-inline">
                            <label>出生日期</label>
                            <input type="text" name="birthday" class="form-control" id="birthday">
                        </div>
                        <div class="form-group form-inline">
                            <label>电话</label>
                            <input type="text" name="phone" class="form-control">
                        </div>
                        <div class="form-group form-inline">
                            <label>医保类型</label>
                            <select name="insurance.id" class="form-control">
                                <option value="">请选择医保类型</option>
                                <c:forEach var="insurance" items="${insurances}">
                                    <option value="${insurance.id}">${insurance.card}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group form-inline">
                            <label>住址</label>
                            <input type="text" class="form-control" name="address">
                        </div>
                        <div class="form-group form-inline">
                            <label>过敏史</label>
                            <textarea class="editor1" style="height:50px" name="history"></textarea>
                        </div>
                        <div class="form-group form-inline">
                            <label>备注</label>
                            <textarea class="editor2" name="remark" rows="2"></textarea>
                        </div>
                        <div class="form-group">
                            <div class="form-actions">
                                <button type="button" id="btn" class="button button-flat-action button-pill">保存</button>
                            </div>
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

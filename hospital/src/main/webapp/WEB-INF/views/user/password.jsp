<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/fonts/font-awesome.min.css">
</head>
<body>
<jsp:include page="../include/header.jsp">
    <jsp:param name="menu" value="user"/>
</jsp:include>
<div class="container">

    <div id="content" class="content-wrapper">

        <section class="content col-sm-8 col-sm-push-2">
            <div class="box box-primary">
                <div class="box-header with-border">
                </div>
            </div>
            <div class="box-body" style="margin-top: 60px" >
                <form id="pwdForm" class="form" style="line-height: 20px">
                    <div class="form-group">
                        <label for="orignalpwd">原始密码</label>
                        <div>
                            <input id="orignalpwd" type="password" class="form-control" name="password" placeholder="请输入旧密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="newpwd">新密码</label>
                        <div>
                            <input id="newpwd" type="password" class="form-control" name="newpwd" placeholder="请输入新密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="confirmpwd">确认新密码</label>
                        <div>
                            <input id="confirmpwd" type="password" class="form-control" name="confirmpwd"
                                   placeholder="请再次确认新密码">
                        </div>
                    </div>
                    <div class="form-group pull-right">
                        <button id="confirmBtn" class="btn btn-success" type="button">确认修改</button>
                        <button class="btn btn-danger" type="reset">重新设置</button>
                    </div>
                </form>
            </div>
        </section>
    </div>




</div>
<script src="/static/js/jquery-2.2.3.min.js"></script>
<script src="/static/js/bootstrap.js"></script>
<script src="/static/js/jquery.validate.min.js"></script>
<script>

    $(function(){

        $("#pwdForm").validate({
            errorElement: "span",
            errorClass: "text-danger",
            rules: {
                password: {
                    required: true,
                    remote: "/user/identify"
                },
                newpwd: {
                    required: true,
                    rangelength: [6, 18]
                },
                confirmpwd: {
                    required: true,
                    equalTo: "#newpwd"

                }
            },
            messages: {
                password: {
                    required: "请输入旧密码",
                    remote: "密码错误"
                },
                newpwd: {
                    required: "请输入新密码",
                    rangelength: "密码长度范围{0}到{1}"

                },
                confirmpwd: {
                    required: "请确认新密码",
                    equalTo: "两次输入不一致"
                }
            },
            submitHandler: function (form) {
                $.post("/user/password", {"password": $("#newpwd").val()})
                        .done(function(data){
                            console.log("修改成功！");
                            $("#content").prepend("<div class='alert alert-success alert-dismissible'>" +
                                    "<button type='button' class='close' data-dismiss='alert' >" +
                                    "<span aria-hidden='true'>&times;</span>" +
                                    "</button><strong>Tips:</strong>state:" + data + "</div>");
                        })
                        .fail(function(){

                        });
            }


        });
        $("#confirmBtn").click(function () {
            $("#pwdForm").submit();
        });




    });


</script>
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>浙江医药</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body style="background-image: url(/static/image/psb1.jpg)">

<div class="container" style="position: absolute ;top: 30px;">

    <div class="form-group col-sm-5 col-sm-push-4" style="letter-spacing: 2px;line-height: 30px;background-color: #1d75b3; ">

        <form action="/login" method="post">
            <h3>浙江医药登陆系统</h3>
            <c:if test="${not empty message}">
                <div class="alert ${style} alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong>${message}</strong>
                </div>
            </c:if>
            <div class="group">
                <label>账号</label>
                <input type="text" class="form-control " name="username" autofocus >
            </div>
            <div class="group">
                <label>密码</label>
                <input type="password" class="form-control" name="password" >
            </div>
            <div class="group" style="margin-top: 5px">
                <button class="btn btn-info">进入系统</button>
            </div>
        </form>
    </div>
</div>
<script src="/static/js/jquery-2.2.3.min.js"></script>
<script src="/static/js/bootstrap.js"></script>
</body>
</html>

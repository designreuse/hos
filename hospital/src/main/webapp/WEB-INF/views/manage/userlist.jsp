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
    <link rel="stylesheet" href="/static/adminlte/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/static/adminlte/dist/css/skins/_all-skins.min.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<jsp:include page="../include/header.jsp">
    <jsp:param name="menu" value="manage"/>
</jsp:include>
<div class="wrapper col-sm-10 col-sm-push-1" style="background-color: transparent;">

    <section class="content">
        <div class="box box-default">
            <div class="box-header with-border " style="color: #ffffff">
                <h1 class="box-title">搜索</h1>
                <%--<div class="box-tools pull-right">--%>
                <%--<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"--%>
                <%--title="Collapse">--%>
                <%--<i class="fa fa-minus"></i></button>--%>
                <%--</div>--%>
            </div>
            <div class="box-body">

            </div>
        </div>
        <div class="box ">
            <div class="box-header with-border " style="color: #ffffff">
                <h1 class="box-title">用户列表</h1>
                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                            title="Collapse">
                        <i class="fa fa-minus"></i></button>
                </div>
            </div>
            <div class="box-body">
                <button class="btn btn-primary pull-right" type="button" id="addnew">新增用户</button>
                <table class="table table-responsive table-striped table-bordered">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>用户名</th>
                        <th>真实姓名</th>
                        <th>角色</th>
                        <th>电话</th>
                        <th>性别</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${users}" var="user" varStatus="SS">
                        <tr>
                            <th>${SS.count}</th>
                            <th>${user.username}</th>
                            <th>${user.realname}</th>
                            <th>${user.role}</th>
                            <th>${user.tel}</th>
                            <th>${user.sex}</th>
                            <th>
                                <c:choose>
                                    <c:when test="${user.enable}">
                                        可用
                                    </c:when>
                                    <c:otherwise>
                                        冻结
                                    </c:otherwise>
                                </c:choose>
                            </th>
                            <th>
                                <c:choose>
                                    <c:when test="${user.enable}">
                                        <a href="javascript:;" rel="${user.id}" class="btn btn-danger">冻结</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="javascript:;" rel="${user.id}" class="btn btn-info">解冻</a>
                                    </c:otherwise>
                                </c:choose>
                                <a href="javascript:;" rel="${user.id}" class="btn btn-primary">修改</a>
                            </th>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="box-footer">

            </div>
        </div>

    </section>

</div>

<div id="add" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">新增用户</h4>
            </div>
            <div class="modal-body">
                <form id="addForm">
                    <label>登录账号</label>
                    <input type="text" name="username" class="form-control">
                    <label>真实姓名 <span class="muted">(用于登录系统)</span></label>
                    <input type="text" name="realname" class="form-control">
                    <label>密码 <span class="muted">(默认123456)</span></label>
                    <input type="password" value="123456" class="form-control">
                    <label>联系电话</label>
                    <input type="text" name="phone" class="form-control">
                    <label>角色</label>
                    <select name="role" class="form-control">
                        <option value="">请选择角色</option>
                        <option value="admin">管理员</option>
                        <option value="doctor">医生</option>
                        <option value="major">主任</option>
                    </select>
                    <label>请选择性别</label>
                    <select name="sex" class="form-control">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                    <label>所属部门</label>
                    <select name="department.id" class="form-control">
                        <option value="">请选择部门</option>
                        <c:forEach var="dept" items="${depts}">
                            <option value="${dept.id}">${dept.deptname}</option>
                        </c:forEach>
                    </select>
                    <div class="form-actions">
                        <button class="button button-flat-action button-pill">保存</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button id="saveAddBtn" type="button" class="btn btn-primary">Save</button>
            </div>
        </div>
    </div>
</div>
<script src="/static/js/jquery-2.2.3.min.js"></script>
<script src="/static/js/bootstrap.js"></script>
<script src="/static/moment/moment.min.js"></script>
<script src="/static/daterangepicker/daterangepicker.js"></script>
<script src="/static/adminlte/plugins/pace/pace.min.js"></script>
<script src="/static/datatable/js/jquery.dataTables.min.js"></script>
<script src="/static/datatable/js/dataTables.bootstrap.min.js"></script>
<script src="/static/adminlte/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/adminlte/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="/static/adminlte/plugins/fastclick/fastclick.js"></script>
<script src="/static/adminlte/dist/js/app.min.js"></script>
<script src="/static/adminlte/dist/js/demo.js"></script>
<script>
    $(function () {
        // 新增用户
        $("#addnew").click(function () {


        });


    });
</script>

</body>
</html>

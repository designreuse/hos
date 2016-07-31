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

    <section class="content" id="content">
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
                                        <a href="javascript:;" rel="${user.id}" class="btn btn-danger lock">冻结</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="javascript:;" rel="${user.id}" class="btn btn-info lock">解冻</a>
                                    </c:otherwise>
                                </c:choose>
                                <a href="javascript:;" rel="${user.id}" class="btn btn-primary modify">修改</a>
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
                    <input type="text" name="username" class="form-control" autofocus>
                    <label>真实姓名 <span class="muted">(用于登录系统)</span></label>
                    <input type="text" name="realname" class="form-control">
                    <label>密码 <span class="muted">(默认123456)</span></label>
                    <input type="password" value="123456" class="form-control" name="password">
                    <label>联系电话</label>
                    <input type="text" name="tel" class="form-control">
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
                    <select name="department.id" class="form-control" id="aselect">
                    </select>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button id="saveAddBtn" type="button" class="btn btn-primary">Save</button>
            </div>
        </div>
    </div>
</div>
<div id="edit" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">编辑用户</h4>
            </div>
            <div class="modal-body">
                <form id="editForm">
                    <input type="text" name="id" id="id" class="hide">
                    <label>登录账号</label>
                    <input type="text" name="username" class="form-control readonly" id="username">
                    <label>真实姓名 <span class="muted">(用于登录系统)</span></label>
                    <input type="text" name="realname" class="form-control" id="realname">
                    <label>联系电话</label>
                    <input type="text" name="tel" class="form-control" id="tel">
                    <label>角色</label>
                    <select name="role" class="form-control" id="role">
                        <option value="">请选择角色</option>
                        <option value="admin">管理员</option>
                        <option value="doctor">医生</option>
                        <option value="major">主任</option>
                    </select>
                    <label>请选择性别</label>
                    <select name="sex" class="form-control" id="sex">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                    <label>所属部门</label>
                    <select name="department.id" class="form-control" id="eselect">
                    </select>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button id="saveEditBtn" type="button" class="btn btn-primary">Save</button>
            </div>
        </div>
    </div>
</div>
<script src="/static/js/jquery-2.2.3.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/moment/moment.min.js"></script>
<script src="/static/js/jquery.validate.min.js"></script>
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
            $("#addForm")[0].reset();
            $.get("/manage/user/deptinf")
                    .done(function (result) {
                        if(result.state != 'success'){
                            return;
                        }
                        var data = result.data;
                        var $select = $("#aselect");
                        $select.html("");
                        $select.append("<option value=''>请选择部门</option>");
                        for (var i = 0; i < data.length; i++) {
                            var dept = data[i];
                            var option = "<option value='" + dept.id + "'>" + dept.deptname + "</option>";
                            $select.append(option);
                        }
                    })
                    .fail(function () {
                        alert("获取客户资料失败,服务器忙")
                    });
            $("#add").modal({
                "show": true,
                "backdrop": "static",
                "keyboard": false
            });
        });
        var $addForm = $("#addForm");
        // 提交新用户数据
        $("#saveAddBtn").click(function(){
            $addForm.submit();
        });
        // 验证数据
        $addForm.validate({
            errorClass: "text-danger",
            errorElement: "span",
            rules: {
                username: {
                    required: true,
                    remote:"/manage/user/identify"
                },
                realname: {
                    required: true
                },
                sex: {
                    required: true,
                },
                age: {
                    required: true,
                    digits: true
                },
                tel: {
                    required: true,
                    digits: true
                },
                role: {
                    required: true
                },
                "department.id": {
                    required: true
                }
            },
            submitHandler: function (form) {
                $.post("/manage/user/add", $(form).serialize())
                        .done(function(data){
                            window.history.go(0);
                            $("#content").prepend("<div class='alert alert-success alert-dismissible'>" +
                                    "<button type='button' class='close' data-dismiss='alert' >" +
                                    "<span aria-hidden='true'>&times;</span>" +
                                    "</button><strong>Tips:</strong>添加用户:" + data + "</div>");
                        })
                        .fail(function(){
                            alert("服务器异常");
                        })
                        .always(function(){
                            $("#add").modal("hide");
                        });
            }




        });
        // 获取需要修改的用户信息
        $(".modify").click(function(){
            var $id = $(this).attr("rel");
            var $select = $("#eselect");
            $select.html("");
            $("#editForm")[0].reset();
            $.get("/manage/user/deptinf")
                    .done(function (result) {
                        if(result.state != 'success'){
                            return;
                        }
                        var data = result.data;
                        var $select = $("#eselect");
                        $select.html("");
                        $select.append("<option value=''>请选择部门</option>");
                        for (var i = 0; i < data.length; i++) {
                            var dept = data[i];
                            var option = "<option value='" + dept.id + "'>" + dept.deptname + "</option>";
                            $select.append(option);
                        }
                    })
                    .fail(function () {
                        alert("获取客户资料失败,服务器忙")
                    });
            $.get("/manage/user/userinf/"+$id)
                    .done(function(result){
                        if(result.state != "success"){
                            return;
                        }
                        var user = result.data;
                        $("#id").val(user.id);
                        $("#username").val(user.username);
                        $("#realname").val(user.realname);
                        $("#tel").val(user.tel);
                        $("#sex").val(user.sex);
                        $("#role").val(user.role);
                        $("#eselect").val(user.department.id);
                        $("#edit").modal({
                            "show": true,
                            "backdrop": "static",
                            "keyboard": false
                        });
                    })
                    .fail(function(){
                        alert("服务器异常");
                    });
        });
        // 提交修改后的数据
        var $editForm = $("#editForm");
        $("#saveEditBtn").click(function(){
            $editForm.submit();
        });
        // 验证数据
        $editForm.validate({
            errorClass: "text-danger",
            errorElement: "span",
            rules: {
                username: {
                    required: true
                },
                realname: {
                    required: true
                },
                sex: {
                    required: true,
                },
                age: {
                    required: true,
                    digits: true
                },
                tel: {
                    required: true,
                    digits: true
                },
                role: {
                    required: true
                },
                "department.id": {
                    required: true
                }
            },
            submitHandler: function (form) {
                $.post("/manage/user/modify", $(form).serialize())
                        .done(function(data){
                            window.history.go(0);
                            $("#content").prepend("<div class='alert alert-success alert-dismissible'>" +
                                    "<button type='button' class='close' data-dismiss='alert' >" +
                                    "<span aria-hidden='true'>&times;</span>" +
                                    "</button><strong>Tips:</strong>修改用户:" + data + "</div>");
                        })
                        .fail(function(){
                            alert("服务器异常");
                        })
                        .always(function(){
                            $("#edit").modal("hide");
                        });
            }




        });

    });
</script>

</body>
</html>

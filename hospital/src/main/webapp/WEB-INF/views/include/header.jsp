<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<nav class="nav navbar-default" style="background-color: #2b80b9">
    <div class="navbar-inner">
        <ul class="nav nav-pills">
            <li class="<c:if test="${param.menu == 'home'}">active</c:if>"><a href="/home"><i class="fa fa-home"></i>首页</a></li>
            <li class="<c:if test="${param.menu == 'notice'}">active</c:if>"><a href="/news"><i class="fa fa-files-o"></i>浙药动态</a></li>
            <li class="<c:if test="${param.menu == 'patient'}">active</c:if>"><a href="/patient"><i class="fa fa-building"></i>病人档案</a></li>
            <li class="<c:if test="${param.menu == 'record'}">active</c:if>"><a href="/record"><i class="fa fa-stethoscope"></i>就诊记录</a></li>
            <li class="<c:if test="${param.menu == 'remind'}">active</c:if>"><a href="/remind"><i class="fa fa-bell-o"></i>复诊提醒</a></li>
            <li class="<c:if test="${param.menu == 'chart'}">active</c:if>"><a href="/chart"><i class="fa fa-bar-chart-o"></i>数据统计</a></li>
            <li class="dropdown <c:if test="${param.menu == 'manage'}">active</c:if>">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" ><i class="fa fa-cogs"></i>系统设置<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="/manage/dept"><i class="fa fa-sitemap"></i>科室设置</a></li>
                    <li><a href="/manage/disease"><i class="fa fa-medkit"></i>病种设置</a></li>
                    <li><a href="/manage/insure"><i class="fa fa-bars"></i>医保类型设置</a></li>
                    <li><a href="/manage/station"><i class="fa fa-child"></i>患者状态设置</a></li>
                    <shiro:hasRole name="admin">
                        <li class="divider"></li>
                        <li><a href="/manage/user"><i class="fa fa-user-md"></i>账号设置</a></li>
                    </shiro:hasRole>
                </ul>
            </li>
            <ul class="nav pull-right nav-pills">
                <li class="divider-vertical"></li>
                <li class="dropdown <c:if test="${param.menu == 'user'}">active</c:if>">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cog"></i>个人设置<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/user/log">查看日志</a></li>
                        <li><a href="/user/password">修改密码</a></li>
                        <li class="divider"><a href="#"></a></li>
                        <li><a href="/signout">安全退出</a></li>
                    </ul>
                </li>
            </ul>
        </ul>
    </div>
</nav>

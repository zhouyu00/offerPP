<%--
  Created by IntelliJ IDEA.
  User: L1ANN
  Date: 2018/3/5
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@   page   language="java"   contentType="text/html;   charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<nav class="navbar navbar-default">
    <div class="navbar-header">
        <div class="navbar-brand brand">
            <img src="<c:url value="/img/title.png"/>">
        </div>
    </div>

    <ul class="nav navbar-nav navtop">
        <li><a class="daohang_text" href="${pageContext.request.contextPath}/user/indexUI.action">首页</a></li>
        <li><a class="daohang_text" href="${pageContext.request.contextPath}/position/query.action">选职位</a></li>
        <li class="dropdown">
            <a href="#" data-toggle="dropdown" class="daohang_text">我的投递
                <span class="caret">
        </span>
            </a>

            <ul  class="dropdown-menu">
                <li><a href="${pageContext.request.contextPath}/user/newApplication.action">新的投递</a></li>
                <li><a href="${pageContext.request.contextPath}/user/arrangedApplication.action">等待面试</a></li>
                <li><a href="${pageContext.request.contextPath}/user/consultedApplication.action">被回绝</a></li>

            </ul>
        </li>

        <li><a class="daohang_text" href="${pageContext.request.contextPath}/resume/getPersonal.action">简历</a></li>

        <li class="dropdown navbar-right" style="padding-right:65px;margin-left: 350px;">
            <a href="#" data-toggle="dropdown" class="name daohang_text" >
                <img class="daohang_people" src="<c:url value="/img/224用户.svg"/>" style="width: 20px;">
                <span class="daohang_name">${user.userName}</span>
            </a>
            <ul class="dropdown-menu">
                <li><a href="${pageContext.request.contextPath}/user/myCollection.action">我的收藏</a></li>
                <li><a href="${pageContext.request.contextPath}/user/changePasswordUI.action">修改密码</a></li>
                <li><a href="${pageContext.request.contextPath}/user/logout.action">退出登录</a></li>

            </ul>
        </li>

    </ul>

</nav>

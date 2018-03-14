
<%--
  Created by IntelliJ IDEA.
  User: L1ANN
  Date: 2018/3/11
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header navbar-nav navbar-left">
            <div class="navbar-brand brand">
                <img src="<c:url value="/img/title.png"/>">
            </div>
        </div>

        <div>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="./showCurrComDetails.action">企业信息</a></li>
                <li><a href="./showPositions.action">招聘岗位</a></li>
                <li><a href="./showResumes.action">简历管理</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        企业服务
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="./changeComPassword.action">修改密码</a></li>
                        <li><a href="./companySignOut.action">退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
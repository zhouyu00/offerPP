<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhouyu
  Date: 2018/3/8
  Time: 上午10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>设定新密码 | offer++</title>
    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/zzhsj_company.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/login_register.css"/>" rel="stylesheet">
</head>

<body>
<c:import url="../user/header_unlogin.jsp"></c:import>
<div class="container">
    <div class="row">
        <form class="col-xs-12 col-md-6 col-md-offset-3">
            <h1>设定新密码</h1>

            <div id="new_psd">
                <div class="form-group">
                    <label for="inputPassword">新密码</label>
                    <input type="password" class="form-control" id="inputPassword" placeholder="密码" name="password">
                </div>
                <div class="form-group">
                    <label for="inputPassword">确认新密码</label>
                    <input type="password" class="form-control" id="inputPasswordConfirm" placeholder="确认密码" name="passwordConfirm">
                </div>
            </div>

            <button  class="btn btn-primary btn-block" type="submit" formaction="${pageContext.request.contextPath}/company/findChangePassword.action" formmethod="post">确定</button>
        </form>
    </div>
</div>

<c:import url="../user/footer.jsp" charEncoding="UTF-8"/>

<script src="<c:url value="/js/login_register.js"/>"></script>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="<c:url value="/js/jquery.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.js"/>"></script>
</body>
</html>

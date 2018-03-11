<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DuJie
  Date: 2018/2/28
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>发布岗位提示</title>
</head>
<body>
<link href="<c:url value="/css/bootstrapdj.min.css"/>" rel="stylesheet">
<link href="<c:url value="/css/zzhsj_company.css"/>" rel="stylesheet">

<style>
    .col-center-block {
        float: none;
        display: block;
        margin-left: auto;
        margin-right: auto;
    }
</style>

<c:import url="header.jsp" charEncoding="UTF-8"></c:import>

<div class="alert alert-success">
    <a href="./showPositions.action" class="alert-link">成功！很好地完成了提交。</a>
</div>

<c:import url="../user/footer.jsp" charEncoding="UTF-8"/>
<script src="<c:url value="/js/jquerydj-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/bootstrapdj.min.js"/>"></script>
</body>
</html>

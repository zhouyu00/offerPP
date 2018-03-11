<%--
  Created by IntelliJ IDEA.
  User: L1ANN
  Date: 2018/3/2
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的投递_新的投递|offer++</title>
    <meta charset="utf-8">
    <link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/zzhsj.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/selfstyle_mydeliver.css"/>" rel="stylesheet">
</head>
<body>
<!--导航栏-->
<c:import url="header_login.jsp" charEncoding="UTF-8"/>
<!--正文-->
<div class="container">
    <div class=" row" style="margin-bottom: 5%;">
        <div class="col-md-1 col-lg-1"></div>
        <div class="col-md-8 col-md-offset-1 col-lg-8 col-lg-offset-1 mode">

            <div class="heading row">
                <span class="text_1">新的投递</span>
            </div>

            <c:forEach items="${positionVos}" var="positionVo">
                <div class="onejob row">

                    <div class="left col-md-7 col-lg-7">
                        <p class="jobname"><a href="${pageContext.request.contextPath}/position/detail.action?id=${positionVo.position.pkPositionId}" class="joblink">${positionVo.position.positionName}</a></p>

                        <p class="jobinfo">
                            <span class="glyphicon glyphicon-record sign"></span>
                            <span class="payment experience">${positionVo.position.positionSalary}</span>
                            <span class="experience">${positionVo.position.positionExperiment}</span>
                            <span class="experience">${positionVo.position.positionEducation}</span>
                        </p>

                        <p class="skillsline">
                            <c:forEach items="${positionVo.skills}" var="skill">
                                <span class="skills">${skill}</span>
                            </c:forEach>
                        </p>

                    </div>

                    <div class="right col-md-5 col-lg-5 ">
                        <p class="companyname">${positionVo.companyName}</p>
                        <p class="companyinfo">
                            <span>${positionVo.position.positionPlace}</span> |
                            <span>${positionVo.companyIndustry}</span> |
                            <span>${positionVo.position.positionProperty}</span>
                        </p>

                        <p class="companyprofit">${positionVo.position.positionWelfare}</p>

                    </div>

                </div>
            </c:forEach>

        </div>

    </div>
</div>
<!--页尾-->
<c:import url="footer.jsp" charEncoding="UTF-8"/>
<!--script脚本-->
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.js"/>"></script>
</body>
</html>

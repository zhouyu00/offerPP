
<%--
  Created by IntelliJ IDEA.
  User: DuJie
  Date: 2018/2/28
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>简历管理</title>
</head>
<body>

<link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/css/bootstrapdj.min.css"/>" rel="stylesheet">
<link href="<c:url value="/css/zzhsj_company.css"/>" rel="stylesheet">
<link href="<c:url value="/css/resume_show.css"/>" rel="stylesheet">

<style>
    .col-center-block {
        float: none;
        display: block;
        margin-left: auto;
        margin-right: auto;
    }

    .sj-info {
        margin-left: 170px;
    }

</style>

<c:import url="header.jsp" charEncoding="UTF-8"></c:import>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-push-8">
            <button type="button" class="btn btn-info" id="ResumePass">简历通过</button>
            <button type="button" class="btn btn-info" id="ResumeReject">简历驳回</button>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8 sj-main-container">
            <h1>简历浏览</h1>
            <div class="sj-info-container">
                <img src="${user.userIcon}" class="fl"/>
                <div class="sj-info">
                    <h2>${user.userName}</h2>
                    <p>${user.userAge}岁 现居${user.userAddressCity},${user.userAddressCountry}</p>
                    <p>邮箱: ${user.userEmail}</p>
                    <p>电话: ${user.userPhone}</p>
                </div>
            </div>
            <div class="sj-about">
                <h2>关于我</h2>
                <ul>
                    <li>职业技能：${user.userSkill}</li>
                    <li>职业方向：${user.userDirection}</li>
                    <li>期望工作地：${user.userWorkAddress}</li>
                </ul>
            </div>
            <div class="sj-skill">
                <%--<div class="sj-skill-content" align="">--%>
                    <h2>工作经验</h2>
                    <p>${user.userStation}</p>
                    <p>${user.userExperience}年</p>
                <%--</div>--%>
            </div>
            <div class="sj-exp sj-work">
                <h2>工作经历</h2>
                <p>${user.userWorkExperience}</p>
            </div>
            <div class="sj-exp sj-education">
                <h2>教育经历</h2>
                <p>${user.userEducation}</p>
            </div>
            <div class="sj-self-intro">
                <h2>个人描述</h2>
                <p>${user.userIntroduction}</p>
            </div>

        </div>
        <div class="col-md-2"></div>
    </div>
</div>

<c:import url="../user/footer.jsp" charEncoding="UTF-8"/>
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/jquerydj-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.js"/>"></script>
<script src="<c:url value="/js/bootstrap-paginator.js"/>"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#ResumePass").click(function () {
            $.post(
                "${pageContext.request.contextPath}/company/acceptResume.action",
                {
                    userId:${user.pkUserId}
                },
                function (data) {
                    if (data.result == "acceptResumeFail") {
                        alert("接收简历失败");
                    }
                    else if (data.result == "acceptResumeOK") {
                        alert("接收简历成功");
                        window.location.href = "${pageContext.request.contextPath}/company/showResumesByPositionId.action?pkPositionId=" +${pkPositionId};
                    }
                }
            );

        });
        $("#ResumeReject").click(function () {
            $.post(
                "${pageContext.request.contextPath}/company/refuseResume.action",
                {
                    userId:${user.pkUserId}
                },
                function (data) {
                    if (data.result == "refuseResumeFail") {
                        alert("拒绝简历失败");
                    }
                    else if (data.result == "refuseResumeOK") {
                        alert("拒绝简历成功");
                        window.location.href = "${pageContext.request.contextPath}/company/showResumesByPositionId.action?pkPositionId=" +${pkPositionId};
                    }
                }
            );
        });
    })
</script>

</body>
</html>

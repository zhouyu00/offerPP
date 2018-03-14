<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/3/10
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="team.offer.entity.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>简历预览 | offer++</title>
    <link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/zzhsj.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/resume_show.css"/>" rel="stylesheet">
    <style>
        .sj-info {
            margin-left: 160px;
        }

        #yulan {
            background-color: #EDEDEF;
            padding-left: 0px;
        }

        .preview-label {
            display: inline-block;
            width: 60%;
            font-size: 20px;
            color: #666666;
            height: 50px;
            line-height: 50px;

        }

        body {
            background-color: #EDEDEF;
        }

        #container {
            padding-top: 20px;
            padding-left: 30px;
        }
        .content {
            padding-top: 30px;
            padding-left: 30px;
        }
        .content_ul{
            padding-top:30px;
            padding-left:0px;
        }
        li.content_li {
            padding-bottom: 10px;
        }
        li{
            list-style:none
        }
    </style>
</head>

<body>
<!--导航栏-->
<c:import url="../user/header_login.jsp" charEncoding="UTF-8"/>
<!--正文-->

<div class="container">
    <div class="row">
        <div class="col-md-2"></div>

        <div class="col-md-8 sj-main-container">
            <div class="preview-label" id="yulan">简历预览</div>
            <div class="sj-info-container" id="container">
                <img src="/pic/${resume.userIcon}" class="fl" width=120 height=114/>
                <div class="sj-info">
                    <h2>${resume.userName}</h2>
                    <p> ${resume.userAge}岁 现居中国，${resume.userAddressCity}</p>
                    <p>邮箱: ${resume.userEmail}</p>
                    <p>电话: ${resume.userPhone}</p>
                </div>
            </div>
            <div class="sj-about">
                <h2>求职意向</h2>
                <div class="content_ul">
                    <ul>
                        <li class="content_li">职业方向：${resume.userDirection}</li>
                        <li class="content_li">工作经验：${resume.userExperience}</li>
                        <li class="content_li">求职岗位：${resume.userStation}</li>
                        <li class="content_li">职业仅能：${resume.userSkill}</li>
                    </ul>
                </div>
            </div>

            <div class="sj-exp sj-work">
                <h2>工作经历</h2>
                <div class="content">
                    <div class="form-group sj-textarea-container">
                        ${resume.userWorkExperience}
                    </div>
                </div>

            </div>
            <%--${resume.userSkill}--%>
            <div class="sj-exp sj-education">
                <h2>教育经历</h2>
                <div class="content">
                    <div class="form-group sj-textarea-container">
                        ${resume.userEduExperience}
                    </div>
                </div>

            </div>
            <div class="sj-self-intro">
                <h2>个人描述</h2>
                <div class="content">
                    <div class="form-group sj-textarea-container">
                        ${resume.userIntroduction}
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="col-md-2"></div>
</div>
</div>

<!--页尾-->
<c:import url="../user/footer.jsp" charEncoding="UTF-8"/>
<!--script脚本-->
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.js"/>"></script>
</body>
</html>


<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/7
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="team.offer.entity.*" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>工作与教育经历 | offer++</title>
    <link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/zzhsj.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/profile.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/overhang.css"/>" rel="stylesheet">
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
</head>

<body>
<!--导航栏-->
<c:import url="../user/header_login.jsp" charEncoding="UTF-8"/>
<!--正文-->

<div class="container">
    <div class="row">
        <aside class="col-md-3">
            <div class="aside-block">

                <div class="daohang_title">个人简历</div>
                <div class="kongxi"></div>
                <a class="daohang_zuoce" style="text-decoration:none;"
                   href="${pageContext.request.contextPath }/resume/getPersonal.action">
                    <span class='glyphicon glyphicon-ok-circle'></span>
                    个人信息
                </a>
                <a class="daohang_zuoce" style="text-decoration:none;"
                   href="${pageContext.request.contextPath }/resume/getSkills.action">
                    <span class='glyphicon glyphicon-ok-circle'></span>
                    职业期望与技能
                </a>
                <a class="daohang_zuoce   row-now" style="text-decoration:none;"
                   href="${pageContext.request.contextPath }/resume/getExperience.action">
                    <span class='glyphicon glyphicon-ok-circle'></span>
                    工作与教育经历
                </a>
                <a class="daohang_zuoce " style="text-decoration:none;"
                   href="${pageContext.request.contextPath }/resume/getDescription.action">
                    <span class='glyphicon glyphicon-ok-circle'></span>
                    个人描述
                </a>

                <a class="see_resume" style="text-decoration:none;"
                   href="${pageContext.request.contextPath }/resume/getResume.action">
                    <button class="click-button">查看简历</button>
                </a>
            </div>
        </aside>

        <form class="col-md-9 main-block" method="post">
            <div class="header-bar">
                工作与教育经历
            </div>

            <div class="profile-panel">


                <div class="experience_title">工作经历</div>
                <div id="summernote1">${careerAndEducationExp.userWorkExperience}</div>

                <div class="form-group">
                    <div class="experience_title">学历</div>
                    <select class="form-control  shuru" id="userEducation" id="inputEducation">
                        <option value="专科"
                                <c:if test="${'专科'== careerAndEducationExp.userEducation}">selected='selected'</c:if>>专科
                        </option>
                        <option value="本科"
                                <c:if test="${'本科'== careerAndEducationExp.userEducation}">selected='selected'</c:if>>本科
                        </option>
                        <option value="硕士"
                                <c:if test="${'硕士'== careerAndEducationExp.userEducation}">selected='selected'</c:if>>硕士
                        </option>
                        <option value="博士"
                                <c:if test="${'博士'== careerAndEducationExp.userEducation}">selected='selected'</c:if>>博士
                        </option>
                    </select>
                </div>

                <div class="experience_title">教育经历</div>
                <div id="summernote2">${careerAndEducationExp.userEduExperience}</div>


                <button class="btn btn-primary form_save_btn" id="save">保存</button>

            </div>
        </form>
    </div>
</div>

<!--页尾-->
<c:import url="../user/footer.jsp" charEncoding="UTF-8"/>
<!--script脚本-->
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.js"/>"></script>
<script src="<c:url value="/js/overhang.js"/>"></script>
<script src="<c:url value="/js/summernote.js"/>"></script>
<script>
    $(document).ready(function () {
        $('#summernote1').summernote({
            height: 250,
            minHeight: 250,
            maxHeight: 250,
            lang: 'zh-CN',
            focus: true
        });

        $('#summernote2').summernote({
            height: 250,
            minHeight: 250,
            maxHeight: 250,
            lang: 'zh-CN',
            focus: true
        });
        if (${result!=null}) {
            $("body").overhang({
                type: "success",
                message: "保存成功",
            });
        }
    });

    $("#save").click(function () {
        var work_experience = $('#summernote1').summernote('code');
        var study_experience = $('#summernote2').summernote('code');
        var education = $("#userEducation").val();
        $.ajax({
            url: "${pageContext.request.contextPath }/resume/setExperience.action",
            type: "post",
            data: {
                "work": work_experience,
                "study": study_experience,
                "education":education
            },
            success: function (data) {

                if (data.result == "changepass") {
                    window.location.href = "${pageContext.request.contextPath}/resume/getExperience.action?result=ok";
                }
            },
            error: function () {
                alert("保存失败");
            }
        })
    });
</script>
</body>
</html>


<%--
  Created by IntelliJ IDEA.
  User: L1ANN
  Date: 2018/3/8
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>职位详情|offer++</title>
    <meta charset="utf-8">

    <link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/selfstyle_positioninfo.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/zzhsj.css"/>" rel="stylesheet">
</head>
<body>
<!--导航栏-->
<c:import url="header_login.jsp" charEncoding="UTF-8"/>
<!--正文-->
<div class="container containerA">
    <div class="row">
        <div class="col-md-2 col-lg-2"></div>
        <div class="col-md-7 col-lg-7">
            <div class="jobinformation">

                <div class="btnline">
                    <button class="btn btn-default toudi" id="jobcollect" onclick="changeDeliver('${positionQuery.pkPositionId}')">
                        <img class="toudi_tubiao" src="<c:url value="/img/skip.png"/>">
                        <span id="deliver">
                            <c:if test="${positionQuery.deliverFlag==1}">
                                已投递
                            </c:if>
                            <c:if test="${positionQuery.deliverFlag!=1}">
                                投递简历
                            </c:if>
                        </span>

                    </button>

                    <button class="btn btn-default shoucang" id="profiledeliver" onclick="changeCollection('${positionQuery.pkPositionId}')">
                        <span class="
                                    <c:if test="${positionQuery.collectionFlag==1}">
                                    glyphicon glyphicon-heart iconon
                                    </c:if>
                                    <c:if test="${positionQuery.collectionFlag!=1}">
                                    glyphicon glyphicon-heart-empty iconoff
                                    </c:if>
                                    " id="heart"></span>
                        <span id="collection">
                            <c:if test="${positionQuery.collectionFlag==1}">
                                已收藏
                            </c:if>
                            <c:if test="${positionQuery.collectionFlag!=1}">
                                收藏职位
                            </c:if>
                        </span>


                    </button>
                </div>

                <div class="leftup">

                    <div class="leftcompanyname" id="#">${positionQuery.companyName}</div>
                    <div class="leftjobname" id="#">${positionQuery.positionName}</div>
                    <div class="leftjobinfo" id="#">
                        <img class="down" src="<c:url value="/img/down_light.png"/>">
                        <span class="payment">￥${positionQuery.positionSalary}</span>

                        <span class="baseinfo" id="#">
                            <img class="down" src="<c:url value="/img/down_light.png"/>">
                            <c:if test="${positionQuery.positionExperiment!=null}">
                                ${positionQuery.positionExperiment}
                            </c:if>
                            <c:if test="${positionQuery.positionExperiment==null}">
                                不限工作经历
                            </c:if></span>

                        <span class="baseinfo" id="#">
                            <img class="down" src="<c:url value="/img/down_light.png"/>">
                            <c:if test="${positionQuery.positionEducation!=null}">
                                ${positionQuery.positionEducation}
                            </c:if>
                            <c:if test="${positionQuery.positionEducation==null}">
                                不限教育经历
                            </c:if>
                        </span>

                        <span class="baseinfo" id="#">
                            <img class="down" src="<c:url value="/img/down_light.png"/>">
                            ${positionQuery.positionPlace}
                        </span>
                    </div>

                </div>

                <div class="leftdown">
                    <div class="items" id="#">技能要求</div>
                    <c:forEach items="${skills}" var="skill">
                        <span class="skills" id="#">${skill}</span>
                    </c:forEach>

                    <div class="items" id="#">公司福利</div>
                    <div class="profit" id="#"><p>${positionQuery.positionWelfare}</p></div>
                    <div class="items" id="#">职位介绍</div>
                    <div class="introduce" id="#">
                        <p>${positionQuery.positionIntroduction}</p>
                    </div>

                    <div class="items" id="#">工作地点</div>
                    <div class="workplace" id="#"><p>${positionQuery.comLocation}</p></div>

                </div>


            </div>
        </div>

        <div class="col-md-2 col-lg-2">
            <div class="companyinfomation">
                <div class="rightup" id="#">${positionQuery.companyName}</div>


                <div class="rightdown" id="#">
                    <div class="companyline  position_content">
                        <span class="glyphicon glyphicon-th-large"></span> ${positionQuery.companyIndustry}
                    </div>

                    <div class="companyline  position_content">
                        <span class="glyphicon glyphicon-user"></span> ${positionQuery.comSize}
                    </div>

                    <div class="companyline  position_content">
                        <span class="glyphicon glyphicon-home "></span> ${positionQuery.comLocation}
                    </div>

                </div>
            </div>

        </div>

    </div>
</div>
<!--页尾-->
<c:import url="footer.jsp" charEncoding="UTF-8"/>
<!--script脚本-->
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.js"/>"></script>
<script type="text/javascript">

    //收藏职位
    function changeCollection(pid) {
        //收藏职位
        if ($("#heart").attr("class").trim() == "glyphicon glyphicon-heart-empty iconoff") {
            $.ajax({
                url: "${pageContext.request.contextPath}/user/addCollection.action",
                type: "post",
                data: {
                    "pid": pid
                },
                success: function (data) {
                    if (data.result == "1") {
                        $("#collection").text("已收藏");
                        $("#heart").attr("class", "glyphicon glyphicon-heart iconon")
                    } else {
                        alert("添加收藏失败！")
                    }
                },
                error: function () {
                    alert("添加收藏失败！");
                }
            });


        }
        //取消收藏
        else {
            $.ajax({
                url: "${pageContext.request.contextPath}/user/deleteCollection.action",
                type: "post",
                data: {
                    "pid": pid
                },
                success: function (data) {
                    if (data.result == "1") {
                        $("#collection").text("收藏职位");
                        $("#heart").attr("class", "glyphicon glyphicon-heart-empty iconoff")
                    } else {
                        alert("取消收藏失败！");
                    }
                },
                error: function () {
                    alert("取消收藏失败！");
                }
            });

        }
    }

    function changeDeliver(pid){
        if ($("#deliver").text().trim() == "投递简历") {
            $.ajax({
                url: "${pageContext.request.contextPath}/user/deliver.action",
                type: "post",
                data: {
                    "pid": pid
                },
                success: function (data) {
                    if (data.result == "1") {
                        $("#deliver").text("已投递");
                    } else {
                        alert("投递失败！");
                    }
                },
                error: function () {
                    alert("投递失败！");
                }
            });
        }else{

        }
    }
</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: L1ANN
  Date: 2018/3/5
  Time: 8:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的收藏|offer++</title>
    <meta charset="utf-8">
    <link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/zzhsj.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/selfstyle_mycollection.css"/>" rel="stylesheet">
</head>
<body>
<!--导航栏-->
<c:import url="header_login.jsp" charEncoding="UTF-8"/>
<!--正文-->
<div class="container">
    <div class="row" style="margin-bottom: 5%;">
        <div class="col-md-1 col-lg-1"></div>
        <div class="col-md-8 col-md-offset-1 col-lg-8 col-lg-offset-1 mode">
            <div class="heading row">
                <span class="text_1">我的收藏</span>
            </div>

            <c:forEach items="${positionVos}" var="positionVo">
                <div class="onejob row">

                    <div class="left col-md-7 col-lg-7">
                        <p class="jobname">
                            <a href="${pageContext.request.contextPath}/position/detail.action?id=${positionVo.position.pkPositionId}" class="joblink">${positionVo.position.positionName}</a>
                            <img src="<c:url value="/img/hearton.png"/>" class="heart" id="heart${positionVo.position.pkPositionId}" onclick="changeHeart('${positionVo.position.pkPositionId}','heart${positionVo.position.pkPositionId}','collect${positionVo.position.pkPositionId}')">
                            <span style="display: none;" class="collect" id="collect${positionVo.position.pkPositionId}">已收藏</span>
                        </p>

                        <p class="jobinfo">
                            <span class="glyphicon glyphicon-record sign"></span>
                            <span class="payment experience">13~15k</span>
                            <span class="experience">两年以上</span>
                            <span class="experience">本科</span>
                        </p>

                        <p class="skillsline">
                            <c:forEach items="${positionVo.skills}" var="skill">
                                <span class="skills">${skill}</span>
                            </c:forEach>
                        </p>

                    </div>

                    <div class="right col-md-5 col-lg-5 ">
                        <p class="companyname">阿里巴巴</p>
                        <p class="companyinfo">
                            <span id="#">中国上海</span> |
                            <span id="#">上市公司</span> |
                            <span id="#">电子商务</span>
                        </p>

                        <p class="companyprofit">股票期权; 弹性工作; 年底双薪; 带薪年假</p>

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
<script type="text/javascript">

    function changeHeart(pid,heart,collection) {
        element = document.getElementById(heart)

        if (element.src.match("heartoff")) {
            $.ajax({
                url:"${pageContext.request.contextPath}/user/addCollection.action",
                type:"post",
                data:{
                    "pid":pid
                },
                success:function(data){
                    if(data.result == "1") {
                        element.src = "<c:url value="/img/hearton.png"/>";
                        collect_remind(heart, collection);
                    }else{
                        alert("添加收藏失败！")
                    }
                },
                error:function(){
                    alert("添加收藏失败！");
                }
            });
        }
        else {
            $.ajax({
                url:"${pageContext.request.contextPath}/user/deleteCollection.action",
                type:"post",
                data:{
                    "pid":pid
                },
                success:function(data){
                    if(data.result == "1") {
                        element.src = "<c:url value="/img/heartoff.png"/>";
                        collect_remind(heart, collection);
                    }else{
                        alert("取消收藏失败！");
                    }
                },
                error:function(){
                    alert("取消收藏失败！");
                }
            });


        }

    }

    function collect_remind(heart,collection) {
        if (document.getElementById(heart).src.match("hearton")) {
            document.getElementById(collection).style.display = "inline-block";
            setTimeout(function () {
                document.getElementById(collection).style.display = "none";
            }, 1500);

        }
    }

</script>
</body>
</html>

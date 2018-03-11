<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <head>
        <title>首页 |offer++</title>
        <meta charset="utf-8">
        <link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">
        <link href="<c:url value="/css/zzhsj.css"/>" rel="stylesheet">
        <link href="<c:url value="/css/selfstyle_index.css"/>" rel="stylesheet">


        <style type="text/css">
            .btn-in-nav
            {font-size: 14px;
                margin-right: 30px;
                margin-top:17px;
                padding-bottom: 4px;
                padding-top: 4px;
            }
            .btn-default{
                font-family: "PingFangSC-Medium", sans-serif;
                font-size: 14px;
                color: #5d6472;
                text-align: center;
                display: inline-block;
                box-sizing: border-box;
                background: rgba(255,255,255,0);
                border: 1px solid #c3ccd9;
                border-radius: 4px;
                padding: 0px 20px 0px 20px;
                cursor: pointer;
                line-height: 32px;
            }

            .btn-primary{
                font-family: "PingFangSC-Medium", sans-serif;
                font-size: 14px;
                color: #5d6472;
                text-align: center;
                display: inline-block;
                box-sizing: border-box;
                background: rgba(255,255,255,0);
                border: 1px solid #c3ccd9;
                border-radius: 4px;
                padding: 0px 20px 0px 20px;
                cursor: pointer;
                line-height: 32px;
                transition: ease-in .2s;
                -webkit-transition: ease-in .2s;
                -moz-transition: ease-in .2s;
                -o-transition: ease-in .2s;
                background: #17b1f7;
                border: 1px solid #17b1f7;
                color: #fff;
            }
            .zhengwenA{
                background:url(https://snow-assets.100offer.com/assets/index_v4/banner-f245c2df306f44d9239079b5d06bb152.jpg) 100%/cover no-repeat;
                width:100%;
            }
            .daohang{
                margin-bottom:0px;
                background-color:#3C4047;
                box-shadow:#3C4047;
                width:100%


            }
            nav.navbar.navbar-default.daohang {
                border:0px;
            }
            .navbar {
                border-radius: 0px;
            }
            .blue-spliter{
                height: 5px;
                width: 50px;
                background-color: #17b1f7;
                margin: 20px 0px;
            }
            .banner-title{
                font-family: "ProductSans Bold", "PingFangSC-Medium", sans-serif;
                font-size: 50px;
                line-height: 70px;
                color: #2F3239;
                text-align: left;
            }
            .content_index{
                text-align:left;
                font-family: "ProductSans", "PingFangSC-Medium", sans-serif;
                font-size: 24px;
                color: #2F3239;
            }
            .zhengwenB{
                background:url(./img/index_xiamian.png) 100%/cover no-repeat;
                width:100%;
                margin:0px;
            }

        </style>
    </head>
</head>
<body>
<nav class="navbar navbar-default daohang" style="height: 30px">
    <div class="container-fluid">
        <div class="navbar-header">
            <div class="navbar-brand brand">
                <img src="<c:url value="/img/tubiao_fanse.png"/>">
            </div>
        </div>


        <%--<p class="navbar-text" style="font-size:23px;padding-left: 375px;color:black;font-family:arial;margin-top:8px;">--%>
            <%--<b> 职位天地，人才家园 </b>--%>
        <%--</p>--%>

        <a href="${pageContext.request.contextPath}/user/registerUI.action" class="navbar-btn btn btn-primary navbar-right btn-in-nav" style="margin-right: 300px;margin-top: 7px;">注册</a>
        <a href="${pageContext.request.contextPath}/user/loginUI.action" class="navbar-btn btn btn-default  navbar-right btn-in-nav zhuce" style="margin-right: 10px;margin-top: 7px;color:#FFFFFF">登录</a>
    </div>
</nav>

<div >
    <div class="zhengwenA-bg">
        <div class="zhengwenA jumbotron">
            <div class="col-md-2 col-lg-2"></div>
            <div class="col-md-4 col-lg-4">
            <div class="banner-title">
                让更好的人才
                <br>
                遇见更好的机会
            </div>
                <div class="blue-spliter"></div>
            <div class="content_index">遇见互联网技术、产品、设计、数据等职位的优质机会</div>
            <%--<p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>--%>
            </div>
        </div>
    </div>
    <div class="zhengwenB-bg">
    <div class="zhengwenB">

    </div>
    </div>

</div>

<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-6 left_block">
                <img src="<c:url value="/img/footer_logo.png"/>"/>
                <p>华中科技大学软件学院2017届学生实训作品, 由软酷网老师指导完成</p>
                <p>欢迎大家使用!</p>
            </div>

            <div class="col-md-2">
                <h4>看机会</h4>
                <ul>
                    <li><a href="#">看机会</a></li>
                    <li><a href="#">使用攻略</a></li>
                    <li><a href="#">常见问题</a></li>
                    <li><a href="#">邀请朋友</a></li>
                    <li><a href="#">移动版</a></li>
                </ul>
            </div>
            <div class="col-md-2">
                <h4>博客</h4>
                <ul>
                    <li><a href="#">文章</a></li>
                    <li><a href="#">活动</a></li>
                </ul>
            </div>
            <div class="col-md-2">
                <h4>offer++</h4>
                <ul>
                    <li><a href="#">关于我们</a></li>
                    <li><a href="#">加入我们</a></li>
                    <li><a href="#">法律条款</a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>

</div>


<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.js"/>"></script>
</body>
</html>

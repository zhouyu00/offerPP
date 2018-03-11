<%--
  Created by IntelliJ IDEA.
  User: L1ANN
  Date: 2018/3/5
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%@   page   language="java"   contentType="text/html;   charset=utf-8"%>
<style>
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
</style>
<nav class="navbar navbar-default" style="height: 30px">
    <div class="container-fluid">
        <div class="navbar-header">
            <div class="navbar-brand brand">
                <img src="<c:url value="/img/title.png"/>">
            </div>
        </div>

        <%--<p class="navbar-text" style="font-size:23px;padding-left: 375px;color:black;font-family:arial;margin-top:8px;">--%>
            <%--<b> 职位天地，人才家园 </b></p>--%>

        <a href="${pageContext.request.contextPath}/user/registerUI.action" class="navbar-btn btn btn-primary navbar-right btn-in-nav" style="margin-right: 300px;margin-top: 7px;">注册</a>
        <a href="${pageContext.request.contextPath}/user/loginUI.action" class="navbar-btn btn btn-default  navbar-right btn-in-nav zhuce" style="margin-right: 10px;margin-top: 7px;">登录</a>
    </div>
</nav>
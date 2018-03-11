<%--
  Created by IntelliJ IDEA.
  User: DuJie
  Date: 2018/2/20
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>企业信息</title>

</head>
<body>
<link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">
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
<%--<nav class="navbar navbar-default" role="navigation">--%>
<%--<div class="container-fluid">--%>
<%--<div class="navbar-header navbar-nav navbar-left">--%>
<%--<img src="<c:url value="/img/1489386486003.jpeg"/>" height="10" width="100" class="img-circle img-thumbnail">--%>
<%--</div>--%>

<%--<div>--%>
<%--<ul class="nav navbar-nav navbar-right">--%>
<%--<li class="active"><a href="./showCurrComDetails.action">企业信息</a></li>--%>
<%--<li><a href="./showPositions.action">招聘岗位</a></li>--%>
<%--<li><a href="./showResumes.action">简历管理</a></li>--%>
<%--<li class="dropdown">--%>
<%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">--%>
<%--企业服务--%>
<%--<b class="caret"></b>--%>
<%--</a>--%>
<%--<ul class="dropdown-menu">--%>
<%--<li><a href="./changeComPassword.action">修改密码</a></li>--%>
<%--<li class="divider"></li>--%>
<%--<li><a href="./companySignOut.action">退出</a></li>--%>
<%--</ul>--%>
<%--</li>--%>
<%--</ul>--%>
<%--</div>--%>
<%--</div>--%>
<%--</nav>--%>

<div class="container">
    <div class="row myCenter">
        <div class="col-sm-8 col-md-8 col-center-block">
            <div class="modal-dialog">
                <form class="form-group center-block" role="form">

                    <%--        <div class="form-group">
                                <label class="col-sm-1 control-label no-padding-right"style="width:180px;font-size:1em; font-family:Microsoft YaHei;"for="form-field-userName1">任务单号:</label>
                                <div class="col-sm-4">
                                    <input class="col-xs-12 col-sm-10" type="text" id="form-field-userName1"placeholder="请输入关键字搜索"/>
                                </div>
                            </div>
                            --%>
                    <div class="form-group">
                        <label for="name"
                               style="height: 30px;width: 100px;font-size: 16pt;font-family: 仿宋">企业名称:</label>
                        <input type="text" class="form-control" id="comName" value="${currCompany.comName}" disabled>
                    </div>
                    <div class="form-group">
                        <label for="name"
                               style="height: 30px;width:200px;font-size: 16pt;font-family: 仿宋">企业工商注册号:</label>
                        <input type="text" class="form-control" id="comNo" value="${currCompany.comNo}" disabled>
                    </div>

                    <div class="form-group">
                        <label for="name"
                               style="height: 30px;width: 100px;font-size: 16pt;font-family: 仿宋">联系方式:</label>
                        <input type="text" class="form-control" id="comContact" value="${currCompany.comContact}"
                               disabled>
                    </div>
                    <div class="form-group">
                        <label for="name"
                               style="height: 30px;width: 100px;font-size: 16pt;font-family: 仿宋">企业邮箱:</label>
                        <input type="text" class="form-control" id="comEmail" value="${currCompany.comEmail}" disabled>
                    </div>
                    <div class="form-group">
                        <label for="name"
                               style="height: 30px;width: 100px;font-size: 16pt;font-family: 仿宋">所属行业:</label>
                        <input type="text" class="form-control" id="comIndustry" value="${currCompany.comIndustry}"
                               disabled>
                    </div>
                    <div class="form-group">
                        <label for="name"
                               style="height: 30px;width: 100px;font-size: 16pt;font-family: 仿宋">公司地址:</label>
                        <input type="text" class="form-control" id="comLocation" value="${currCompany.comLocation}"
                               disabled>
                    </div>
                    <div class="form-group">
                        <label for="name"
                               style="height: 30px;width: 100px;font-size: 16pt;font-family: 仿宋">公司规模:</label>
                        <input type="text" class="form-control" id="comSize" value="${currCompany.comSize}" disabled>
                    </div>
                    <div class="form-group">
                        <label for="name"
                               style="height: 30px;width: 100px;font-size: 16pt;font-family: 仿宋">公司法人:</label>
                        <input type="text" class="form-control" id="comLegalperson"
                               value="${currCompany.comLegalperson}" disabled>
                    </div>
                    <div class="form-group">
                        <label for="name"
                               style="height: 30px;width: 100px;font-size: 16pt;font-family: 仿宋">公司简介:</label>
                        <textarea class="form-control" id="comIntro" value="${currCompany.comIntro}"
                                  disabled></textarea>
                    </div>
                    <div class="form-group">
                        <label for="name"
                               style="height: 30px;width: 200px;font-size: 16pt;font-family: 仿宋">发布岗位上限:</label>
                        <input type="text" class="form-control" id="comPostlimit" value="${currCompany.comPostlimit}"
                               disabled>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<c:import url="../user/footer.jsp" charEncoding="UTF-8"/>

<script src="<c:url value="/js/jquery.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.js"/>"></script>
</body>
</html>

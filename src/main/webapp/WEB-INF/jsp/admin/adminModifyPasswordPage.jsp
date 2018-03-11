
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>修改密码</title>

</head>
<body>
<link rel="stylesheet" href="<%= basePath %>css/bootstrapdj.min.css">
<script src="<%= basePath %>js/jquerydj-3.3.1.min.js"></script>
<script src="<%= basePath %>js/bootstrapdj.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%= basePath %>css/selfstyle_xiugaimima1.css">
<link rel="stylesheet" type="text/css" href="<%= basePath %>css/zzhsj.css" >

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header navbar-nav navbar-left">
            <img src="<%= basePath %>img/1489386486
            003.jpeg" height="10" width="100" class="img-circle img-thumbnail">
        </div>
        <div>
            <ul class="nav navbar-nav navbar-right">
                <li ><a href="${basePath}userManage.action?page=1">用户管理</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        企业管理
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="${basePath}checkCompany.action?page=1">企业审核</a></li>
                        <li class="divider"></li>
                        <li><a href="${basePath}positionLimitManage.action?page=1">企业岗位审核</a></li>
                    </ul>
                </li>
                <li class="dropdown active">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        管理员
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="${basePath}adminModifyPasswordPage.action">修改密码</a></li>
                        <li class="divider"></li>
                        <li><a href="${basePath}exit.action">退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="row" style="margin-bottom: 5%;">

        <form id="mform" action="<%= basePath %>admin/adminModifyPassword.action" method="post">
            <h1>修改密码</h1>

            <div class="form-group">
                <label for="old-password">旧密码</label>
                <input type="password" name="oldPassword" id="old-password" placeholder="请输入旧密码" class="form-control">
            </div>


            <div class="form-group">

                <label for="new-password">新的密码</label>
                <input type="password" name="password" id="new-password" placeholder="请输入新的密码" class="form-control">
            </div>

            <div class="form-group">

                <label for="new-password-again">确认密码</label>
                <input type="password" name="comfirmPassword" id="new-password-again" placeholder="请再次输入新的密码" class="form-control">


            </div>

            <button type="submit" class="btn btn-default yes">确认修改</button>
        </form>

    </div>
</div>


<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-6 left_block">
                <img src="<%= basePath %>img/footer_logo.png"/>
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
<%
    String message = (String)request.getAttribute("message");         // 获取message
    if(message != "n") {
%>
<script type="text/javascript" language="javascript">
 alert("<%=message%>");
</script>
    <%
}
%>
</body>
</html>

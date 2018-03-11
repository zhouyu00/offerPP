<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登陆 | offer++</title>
    <!-- Bootstrap core CSS -->
    <link href="<%= basePath %>css/bootstrap.css" rel="stylesheet">
    <link href="<%= basePath %>css/zzhsj.css" rel="stylesheet">
    <link href="<%= basePath %>css/login_register.css" rel="stylesheet">
</head>

<body>
<nav class="navbar navbar-default" style="height: 30px">
    <div class="container-fluid">
        <div class="navbar-header">
            <div class="navbar-brand">
                <b style="font-size: 25px;float: left;margin-top:1px;color: #4682b4">Offer++&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</b>
            </div>
        </div>

        <p class="navbar-text" style="font-size:23px;padding-left: 375px;color:black;font-family:arial;margin-top:8px;">
            <b> 职位天地，人才家园 </b></p>
    </div>
</nav>

<div class="container">
    <div class="row">
        <form class="col-xs-12 col-md-6 col-md-offset-3" action="${pageContext.request.contextPath}/admin/adminLogin.action" method="post">
            <h1>管理员登录</h1>

            <div class="form-group">
                <label for="inputEmail">账号</label>
                <input type="text" class="form-control" id="inputEmail" name="id" placeholder="账号">
            </div>
            <div class="form-group">
                <label for="inputPassword">密码</label>
                <input type="password" class="form-control" id="inputPassword" name="password" placeholder="密码">
            </div>
            <button type="submit" class="btn btn-primary btn-block">确定</button>
        </form>
    </div>
</div>

<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
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
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="<%= basePath %>js/jquery.min.js"></script>
<script src="<%= basePath %>js/bootstrap.js"></script>
</body>
</html>

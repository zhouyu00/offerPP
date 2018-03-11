<%--
  Created by IntelliJ IDEA.
  User: L1ANN
  Date: 2018/3/1
  Time: 8:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>修改密码 |offer++</title>
    <meta charset="utf-8">
    <link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet" >
    <link href="<c:url value="/css/zzhsj.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/selfstyle_changepassword.css"/>" rel="stylesheet" >
    <link href="<c:url value="/css/overhang.css"/>" rel="stylesheet">
</head>
<body>
<!--导航栏-->
<c:import url="header_login.jsp" charEncoding="UTF-8"/>
<!--正文-->
<div class="container">
    <div class="row">

        <form class="col-xs-12 col-md-6 col-md-offset-3" action="${pageContext.request.contextPath}/user/changePassword.action" method="post">
            <h1>修改密码</h1>

            <div class="form-group">
                <label for="oldPassword" class="zhanghao_mima">旧密码</label>
                <input type="password" name="oldPassword" id="oldPassword" placeholder="请输入旧密码" class="form-control" value="${data.oldPassword}">
            </div>


            <div class="form-group">

                <label for="newPassword" class="zhanghao_mima">新密码</label>
                <input type="password" name="userPassword" id="newPassword" placeholder="请输入新的密码" class="form-control" value="${data.newPassword}">
                <span class="error_message">
                <c:forEach items="${errors}" var="error">
                    ${error.defaultMessage}<br/>
                </c:forEach>
                    </span>
            </div>

            <div class="form-group">

                <label for="confirmNewPassword" class="zhanghao_mima">确认新密码</label>
                <input type="password" name="confirmNewPassword" id="confirmNewPassword" placeholder="请再次输入新的密码" value="${data.confirmNewPassword}"
                       class="form-control">

            </div>

            <button class="btn btn-default yes" type="submit">提交</button>
        </form>

    </div>
</div>
<!--页尾-->
<c:import url="footer.jsp" charEncoding="UTF-8"/>
<!--script脚本-->
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.js"/>"></script>
<script src="<c:url value="/js/overhang.js"/>"></script>
<script type="text/javascript">
    $(document).ready(function(){

        if(${oldError!=null}){
            $("body").overhang({
                type: "error",
                message: "旧密码错误，请重新输入",
            });
        }
        if(${confirmError!=null}){
            $("body").overhang({
                type: "error",
                message: "确认密码与新密码不同，请重新输入",
            });
        }
       if(${result!=null}){
           $("body").overhang({
               type: "success",
               message: "修改密码成功",
           });
       }
    });
</script>
</body>
</html>

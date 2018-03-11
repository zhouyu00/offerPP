<%--
  Created by IntelliJ IDEA.
  User: L1ANN
  Date: 2018/2/28
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>设定新密码 | offer++</title>
    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/zzhsj.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/login_register.css"/>" rel="stylesheet">
</head>
<body>
<!--导航栏-->
<c:import url="header_unlogin.jsp" charEncoding="UTF-8"/>
<!--正文-->
<div class="container">
    <div class="row">
        <form class="col-xs-12 col-md-6 col-md-offset-3" action="${pageContext.request.contextPath}/user/forgetPassword.action" method="post">
            <h1>设定新密码</h1>
            <!--保存用户邮箱-->
            <hidden name="email" value="${email}"/>
            <div id="new_psd">
                <div class="form-group">
                    <label for="inputPassword">新密码</label>
                    <input type="password" class="form-control" id="inputPassword" name="userPassword" placeholder="密码">
                    <c:forEach items="${errors}" var="error">
                        ${error.defaultMessage}<br/>
                    </c:forEach>
                </div>
                <div class="form-group">
                    <label for="inputPassword">确认新密码</label>
                    <input type="password" class="form-control" id="inputPasswordConfirm" name="confirmPassword" placeholder="确认密码">
                    <c:if test="${confirmError!=null}">
                        ${confirmError}
                    </c:if>
                </div>
            </div>
            <button  class="btn btn-primary btn-block" type="submit">确定</button>
        </form>
    </div>
</div>
<!--页尾-->
<c:import url="footer.jsp" charEncoding="UTF-8"/>
<!--script脚本-->
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.js"/>"></script>
<script type="text/javascript">
    $(document).ready(function(){
       if(${error!=null}){
           alert("密码修改失败！");
       }
    });
</script>
</body>
</html>

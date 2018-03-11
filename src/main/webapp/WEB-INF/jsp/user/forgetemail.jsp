<%--
  Created by IntelliJ IDEA.
  User: L1ANN
  Date: 2018/2/28
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>找回密码 | offer++</title>
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
        <form class="col-xs-12 col-md-6 col-md-offset-3" action="${pageContext.request.contextPath}/user/forgetEmail.action" method="post">
            <h1>找回密码</h1>
            <div class="type_choose">
                <div class="fl user_type_box">
                    <div class="radio">
                        <label><input type="radio" name="user_type" checked="checked"/> 我是候选人</label>
                    </div>
                </div>
                <div class="fr user_type_box">
                    <div class="radio">
                        <label><input type="radio" name="user_type"/> 我是HR</label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="email">邮箱</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="邮箱">
                <c:if test="${error!=null}">
                    ${error}
                </c:if>
            </div>
            <button class="fr btn btn-primary" type="button" onclick="sendEmail()">发送验证码</button>
            <div class="form-group">
                <label for="inputValidator">验证码</label>
                <input type="number" class="form-control" id="inputValidator" name="inputCode" placeholder="请填写邮件中的验证码">
                <c:if test="${codeError!=null}">
                    ${codeError}
                </c:if>
            </div>

            <button type="submit" class="btn btn-primary btn-block">确定</button>
        </form>
    </div>
</div>
</div>
<!--页尾-->
<c:import url="footer.jsp" charEncoding="UTF-8"/>
<!--script脚本-->
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.js"/>"></script>
<script type="text/javascript">
    function sendEmail() {
        var email = $("#email").val();
        $.ajax({
            url: "sendEmail.action?email="+email+"&request=forgetemail",
            type: "post",
            data: {
            },
            success: function (data) {
                if(data.result=="emailFalse"){
                    alert("邮箱输入错误，请重新输入！");

                }
            },
            error:function(){
                alert("发送验证码失败！");
            }
        });
    }
</script>
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhouyu
  Date: 2018/3/8
  Time: 上午10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>找回密码 | offer++</title>
    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/zzhsj_company.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/login_register.css"/>" rel="stylesheet">

</head>

<body>
<c:import url="../user/header_unlogin.jsp"></c:import>

<div class="container">
    <div class="row">
        <form class="col-xs-12 col-md-6 col-md-offset-3">
            <h1>找回密码</h1>


            <div class="hr-input" >
                <div class="form-group">
                    <label for="inputEmail">邮箱</label>
                    <input type="email" class="form-control" id="comEmail" placeholder="邮箱" name="comEmail"/>
                </div>
                <button class="fr btn btn-primary" type="button" onclick="sendEmail()">发送验证码</button>
                <div class="form-group">
                    <label for="inputValidator">验证码</label>
                    <input type="number" class="form-control" id="Validator" placeholder="请填写邮件中的验证码" name="inputCode"/>
                </div>
            </div>
            <button type="submit" class="btn btn-primary btn-block" formaction="./verifyVerifyCode.action" formmethod="post">确定</button>
        </form>
    </div>
</div>
</div>


<c:import url="../user/footer.jsp" charEncoding="UTF-8"/>

<script src="<c:url value="/js/login_register.js"/>"></script>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="<c:url value="/js/jquery.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.js"/>"></script>
<script type="text/javascript">
    function sendEmail() {
        var email = $("#comEmail").val();

        $.ajax({
            url: "${pageContext.request.contextPath}/company/sendEmail.action?email="+email+"&request=forgetemail",
            type: "post",
            data: {},
            success: function (data) {
                if(data.result=="emailFalse"){
                    alert("邮箱输入错误，请重新输入！");
                }
                else alert("验证码已发送到邮箱！");
            },
            error:function(){
                alert("发送验证码失败！");
            }
        });
    }
</script>
</body>
</html>
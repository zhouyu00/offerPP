<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DuJie
  Date: 2018/2/28
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>修改密码</title>
</head>
<body>
<script src="../../../jQuery/jquerydj-3.3.1.min.js"></script>
<script src="../../../js/bootstrapdj.min.js"></script>

<link href="<c:url value="/css/bootstrapdj.min.css"/>" rel="stylesheet">
<link href="<c:url value="/css/zzhsj_company.css"/>" rel="stylesheet">
<link href="<c:url value="/css/selfstyle_xiugaimima1.css"/>" rel="stylesheet">

<c:import url="header.jsp" charEncoding="UTF-8"></c:import>
<div class="container">
    <div class="row" style="margin-bottom: 5%;">

        <form >
            <h1>修改密码</h1>

            <div class="form-group">
                <label for="old-password">旧密码</label>
                <input type="text" name="oldpass" id="old-password" placeholder="请输入旧密码" class="form-control">
                <p hidden id="oldPassError" type="backVerify">旧密码输入错误</p>
            </div>


            <div class="form-group">

                <label for="new-password">新的密码</label>
                <input type="password" name="newpass" id="new-password" placeholder="请输入新的密码" class="form-control">
                <p hidden id="newPassLenthError" type="frontVerify">密码长度应为6-16位字符</p>
            </div>

            <div class="form-group">

                <label for="new-password-again">确认</label>
                <input type="password" name="newpassConfirm" id="new-password-again" placeholder="请再次输入新的密码" class="form-control">
                <p hidden id="newPassConfirmError" type="frontVerify">新密码与密码确认不一致</p>
            </div>

            <button type="button" class="btn btn-default yes" id="passSubmit">提交</button>
        </form>

    </div>
</div>
<c:import url="../user/footer.jsp" charEncoding="UTF-8"/>
<script src="<c:url value="/js/jquerydj-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/bootstrapdj.min.js"/>"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#passSubmit").click(function () {
            $(".backVerify").hide();
            $(".frontVerify").hide();
            var oldpass= $("#old-password").val();
            var newpass= $("#new-password").val();
            var newpassConfirm=$("#new-password-again").val();

            if(newpass.length<6||newpass.length>16){
                $("#newPassLenthError").show()
            }
            else if(newpass!=newpassConfirm){
                $("#newPassConfirmError").show();
            }
            else{
                $.post(
                    "./updateCompany.action",
                    {
                        oldpass:oldpass,
                        newpass:newpass,
                        newpassConfirm:newpassConfirm
                    },
                    function (data) {
                        if(data.result=='oldPassError'){
                            $("#oldPassError").show();
                        }
                        else if(data.result=='newPassConfirmError'){
                            alert("新密码与确认密码不一致");
                        }
                        else if(data.result=='changePassWordError'){
                            alert("修改密码失败");
                        }
                        else if(data.result=='changePasswordSuccess'){
                            alert("修改密码成功");
                        }
                        else{
                            alert("修改密码出错");
                        }
                    }
                );
            }
        });
    });
</script>
</body>
</html>

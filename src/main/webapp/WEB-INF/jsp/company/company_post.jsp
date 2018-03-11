<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DuJie
  Date: 2018/2/28
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>发布岗位</title>
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
<div class="container">
    <div class="row myCenter">
        <div class="col-sm-8 col-md-8 col-center-block">
            <div class="modal-dialog">
                <br class="form-group center-block" role="form">
                    <form >
                    <div class="form-group">
                        <label for="name" style="height: 30px;width: 100px;font-size: 16pt;font-family:仿宋; ">职位名称:</label>
                        <input type="text" class="form-control" id="positionName" name="positionName">
                        <p hidden id="positionNameNullError" class="frontVerify">职位名称不能为空</p>
                    </div>
                    <div class="form-group">
                        <label for="name" style="height: 30px;width: 100px;font-size: 16pt;font-family:仿宋; ">工作性质:</label>
                        <input type="text" class="form-control" id="positionProperty" name="positionProperty">
                        <p hidden id="positionPropertyNullError" class="frontVerify">工作性质不能为空</p>
                    </div>
                    <div class="form-group">
                        <label for="name" style="height: 30px;width: 100px;font-size: 16pt;font-family:仿宋; ">工作地点:</label>
                        <input type="text" class="form-control" id="positionPlace" name="positionPlace">
                        <p hidden id="positionPlaceNullError" class="frontVerify">工作性质不能为空</p>
                    </div>
                    <div class="form-group">
                        <label for="name" style="height: 30px;width: 100px;font-size: 16pt;font-family:仿宋; ">学历要求:</label>
                        <input type="text" class="form-control" id="positionEducation" name="positionEducation">
                        <p hidden id="positionEducationNullError" class="frontVerify">工作性质不能为空</p>
                    </div>
                    <div class="form-group">
                        <label for="name" style="height: 30px;width: 100px;font-size: 16pt;font-family:仿宋; ">工作经验:</label>
                        <input type="text" class="form-control" id="positionExperiment" name="positionExperiment">
                        <p hidden id="positionExperimentNullError" class="frontVerify">工作性质不能为空</p>
                    </div>
                    <div class="form-group">
                        <label for="name" style="height: 30px;width: 100px;font-size: 16pt;font-family:仿宋; ">薪资范围:</label>
                        <input type="text" class="form-control" id="positionSalary" name="positionSalary">
                        <p hidden id="positionSalaryNullError" class="frontVerify">工作性质不能为空</p>
                    </div>
                    <div class="form-group">
                        <label for="name" style="height: 30px;width: 100px;font-size: 16pt;font-family:仿宋; ">技能要求:</label>
                        <input type="text" class="form-control" id="positionSkill" name="positionSkill">
                        <p hidden id="positionSkillNullError" class="frontVerify">工作性质不能为空</p>
                    </div>
                    <div class="form-group">
                        <label for="name" style="height: 30px;width: 100px;font-size: 16pt;font-family:仿宋; ">公司福利:</label>
                        <input type="text" class="form-control" id="positionWelfare" name="positionWelfare">
                        <p hidden id="positionWelfareNullError" class="frontVerify">工作性质不能为空</p>
                    </div>
                    <div class="form-group">
                        <label for="name" style="height: 30px;width: 100px;font-size: 16pt;font-family:仿宋; ">职位介绍:</label>
                        <input type="text" class="form-control" id="positionIntro" name="positionIntro">
                        <p hidden id="positionIntroNullError" class="frontVerify">工作性质不能为空</p>
                    </div>

                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-md-push-3">
                            <button type="button" class="btn" id="submit">确认发布</button>
                        </div>
                    </div>
                </div>

                </form>
            </div>
        </div>
    </div>
</div>

<c:import url="../user/footer.jsp" charEncoding="UTF-8"/>

<script src="<c:url value="/js/jquery.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.js"/>"></script>
<script src="<c:url value="/js/jquerydj-3.3.1.min.js"/>"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#submit").click(function () {
            $(".frontVerify").hide();
           var positionName = $("#positionName").val();
           var positionProperty = $("#positionProperty").val();
           var positionPlace =$("#positionPlace").val();
           var positionEducation =$("#positionEducation").val();
           var positionExperiment =$("#positionExperiment").val();
           var positionSalary=$("#positionSalary").val();
           var positionSkill=$("#positionSalary").val();
           var positionWelfare =$("#positionWelfare").val();
           var positionIntro = $("#positionIntro").val();
           if(positionName.length==0){
               $("#positionNameNullError").show();
           }
           else if(positionProperty.length==0){
               $("#positionPropertyNullError").show();
           }
           else if(positionPlace.length==0){
               $("#positionPlaceNullError").show();
           }
           else if(positionEducation.length==0){
               $("#positionEducationNullError").show();
           }
           else if(positionExperiment.length==0){
               $("#positionExperimentNullError").show();
           }
           else if(positionSalary.length==0){
               $("#positionSalaryNullError").show();
           }
           else if(positionSkill.length==0){
               $("#positionSkillNullError").show();
           }
           else if(positionWelfare.length==0){
               $("#positionWelfareNullError").show();
           }
           else if(positionIntro.length==0){
               $("#positionIntroNullError").show();
           }
           else{
               $.post(
                   "./postPosition.action",
                   {
                       positionName:positionName,
                       positionProperty:positionProperty,
                       positionPlace:positionPlace,
                       positionEducation:positionEducation,
                       positionExperiment:positionExperiment,
                       positionSalary:positionSalary,
                       positionWelfare:positionWelfare,
                       positionIntroduction:positionIntro,
                       positionSkill:positionSkill,
                       comId:${currCompany.pkComId}
                   },
                   function (data) {
                        if(data.result=="postFail"){
                            alert("发布失败");
                        }
                        else if(data.result=="postOK"){
                            window.location.href="./success.action"
                        }
                        else{
                            alert("发布出错");
                        }
                   }
               )
           }
        })
    });
</script>


</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DuJie
  Date: 2018/2/28
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
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
    .shuru{
        width: 100%;
        padding: 9px;
        transition: border 0.2s ease-in 0s;
        -webkit-transition: border 0.2s ease-in 0s;
        -moz-transition: border 0.2s ease-in 0s;
        -o-transition: border 0.2s ease-in 0s;
        border-color: #dcdcdc;
        border-width: 1px;
        border-style: solid;
        border-radius: 2px;
        color: #666666;
        box-shadow: none;
        resize: none;
        height: 40px;
        border-radius: 2px;
        color: #333333;
    }
    .salary{
        width:60px;
        padding: 9px;
        transition: border 0.2s ease-in 0s;
        -webkit-transition: border 0.2s ease-in 0s;
        -moz-transition: border 0.2s ease-in 0s;
        -o-transition: border 0.2s ease-in 0s;
        border-color: #dcdcdc;
        border-width: 1px;
        border-style: solid;
        border-radius: 2px;
        color: #666666;
        box-shadow: none;
        resize: none;
        height: 40px;
        border-radius: 2px;
        color: #333333;
    }
    .form-group.duotian {
        margin-bottom:50px;
    }
    input#positionSkill {
        margin-top: 15px;
    }
    input#positionWelfare{
        margin-top:15px;
    }
    .queren{
        margin-top:10px;
    }
    div#skillContainer {
        padding-top: 5px;
    }
    span.label.label-primary {
        margin-top: 7px;
        margin-right: 5px;
        width: 30px;
        /* padding: 0px; */
        height: 20px;
        padding: 10px;
        font-size: 15px;
    }
    div#welfareContainer{
        padding-top: 5px;
    }
</style>
<c:import url="header.jsp" charEncoding="UTF-8"></c:import>
<div class="container">
    <div class="row myCenter">
        <div class="col-sm-8 col-md-8 col-center-block">
            <div class="modal-dialog">
                <br class="form-group center-block" role="form">
                <form>
                    <div class="form-group">
                        <label for="name"
                               style="height: 30px;width: 100px;font-size: 16px; ">职位名称:</label>
                        <input type="text" class="form-control shuru" id="positionName" name="positionName">
                        <p hidden id="positionNameNullError" class="frontVerify">职位名称不能为空</p>
                    </div>

                    <div class="form-group">
                        <label for="positionProperty"
                               style="height: 30px;width: 100px;font-size: 16px;">工作性质:</label>

                        <select id="positionProperty" class="selectpicker form-control shuru">
                            <option value="兼职">兼职</option>
                            <option value="实习">实习</option>
                            <option value="全职">全职</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="positionPlace" style="height: 30px;width: 100px;font-size: 16px;">工作城市:</label>
                        <%--<input type="text" class="form-control" id="positionPlace" name="positionPlace">--%>
                        <select id="positionPlace" class="selectpicker selectpicker form-control shuru">
                            <option value="上海">上海</option>
                            <option value="北京">北京</option>
                            <option value="深圳">深圳</option>
                            <option value="杭州">杭州</option>
                            <option value="广州">广州</option>
                            <option value="武汉">武汉</option>
                        </select>

                    </div>

                    <div class="form-group">
                        <label for="positionAddress" style="height: 30px;width: 100px;font-size: 16px;">详细地址:</label>
                        <input type="text" class="form-control  shuru" id="positionAddress" name="positionPlace">
                        <p hidden id="positionAddressNullError" class="frontVerify">详细地址不能为空</p>
                    </div>

                    <div class="form-group">
                        <label for="positionEducation" style="height: 30px;width: 100px;font-size: 16px;">学历要求:</label>

                        <select id="positionEducation" class="selectpicker selectpicker form-control shuru">
                            <option value="专科">专科</option>
                            <option value="本科">本科</option>
                            <option value="硕士">硕士</option>
                            <option value="博士">博士</option>
                        </select>

                    </div>

                    <div class="form-group">
                        <label for="positionExperiment" style="height: 30px;width: 100px;font-size: 16px;">工作经验:</label>

                        <select id="positionExperiment" class="selectpicker selectpicker form-control shuru">
                            <option value="一年及以上">一年及以上</option>
                            <option value="两年及以上">两年及以上</option>
                            <option value="三年及以上">三年及以上</option>
                            <option value="五年及以上">五年及以上</option>
                            <option value="十年及以上">十年及以上</option>
                        </select>

                    </div>

                    <div class="form-group">
                        <label for="positionSalary" style="height: 30px;width: 100px;font-size: 16px;">薪资范围:</label>

                        <input type="text" class="salary" id="salaryBegin" value="0"> ~ <input type="text" class="salary" id="salaryEnd" value="0">k * <input type="text" class="salary" id="salaryDuration" value="12">月

                    </div>

                    <div class="form-group duotian">
                        <label for="positionSkill" style="height: 30px;width: 100px;font-size: 16px;">技能要求:</label>
                        <input type="button" value="+" id="addSkill">
                        <div id="skillContainer"></div>
                        <div class="addSkill">
                            <input type="text" class="form-control" id="positionSkill" name="positionSkill">
                            <div class="col-sm-8 col-md-push-3 queren">
                                <button type="button" class="btn" id="skillCancel">取消</button>
                                <button type="button" class="btn" id="skillSubmit">确认</button>
                            </div>
                        </div>

                        <p hidden id="positionSkillNullError" class="frontVerify">技能要求不能为空</p>
                    </div>

                    <div class="form-group duotian">
                        <label for="positionWelfare" style="height: 30px;width: 100px;font-size: 16px;">公司福利:</label>
                        <input type="button" value="+" id="addWelfare">
                        <div id="welfareContainer"></div>
                        <div class="addWelfare">
                            <input type="text" class="form-control" id="positionWelfare" name="positionWelfare">
                            <div class="col-sm-8 col-md-push-3 queren">
                                <button type="button" class="btn" id="welfareCancel">取消</button>
                                <button type="button" class="btn" id="welfareSubmit">确认</button>
                            </div>
                        </div>
                        <p hidden id="positionWelfareNullError" class="frontVerify">公司福利不能为空</p>
                    </div>

                    <div class="form-group duotian">
                        <label for="positionIntro" style="height: 30px;width: 100px;font-size: 16px;">职位介绍:</label>
                        <textarea class="form-control  shuru" id="positionIntro" name="positionIntro"></textarea>
                        <%--<input type="text" class="form-control" id="positionIntro" name="positionIntro">--%>
                        <p hidden id="positionIntroNullError" class="frontVerify">职位介绍不能为空</p>
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
        var Skills;
        var Welfares;
        console

        //添加技能
        $(".addSkill").hide();
        $("#addSkill").click(function () {
            $(".addSkill").show();
        });
        $("#skillCancel").click(function () {
            $(".addSkill").hide();
        });
        $("#skillSubmit").click(function () {
            var skill = $("#positionSkill").val();
            if(skill!=''&&skill!=undefined){
                if(Skills==''||Skills==undefined){
                    Skills=skill;
                }
                else{
                    Skills=Skills+";"+skill;
                }

            }

            console.log(Skills);

            var tag = document.createElement('span');
            tag.className = "label label-primary";
            tag.textContent = skill;
            document.querySelector("#skillContainer").appendChild(tag);
            $(".addSkill").hide();

        });

        //添加福利

        $(".addWelfare").hide();
        $("#addWelfare").click(function () {
            $(".addWelfare").show();
        });
        $("#welfareCancel").click(function () {
            $(".addWelfare").hide();
        });
        $("#welfareSubmit").click(function () {
            var welfare = $("#positionWelfare").val();
            if(welfare!=''&&welfare!=undefined){
                if(Welfares==''||Welfares==undefined){
                    Welfares=welfare;
                }
                else{
                    Welfares=Welfares+"；"+welfare;
                }

            }

            var tag = document.createElement('span');
            tag.className = "label label-primary";
            tag.textContent = welfare;
            document.querySelector("#welfareContainer").appendChild(tag);
            $(".addWelfare").hide();

        });

        $("#submit").click(function () {
            $(".frontVerify").hide();
            //填入
            var positionName = $("#positionName").val();
            var positionAddress =$("#positionAddress").val();
            //选择
            var positionProperty = $("#positionProperty").val();
            var positionPlace =$("#positionPlace").val();
            var positionEducation =$("#positionEducation").val();
            var positionExperiment =$("#positionExperiment").val();
            //简单拼接
            var positionSalary=$("#salaryBegin").val()+"~"+$("#salaryEnd").val()+"k * "+$("#salaryDuration").val()+"月";
            console.log(positionSalary);
            //复杂拼接

            var positionIntro = $("#positionIntro").val();
            if(positionName.length==0){
                $("#positionNameNullError").show();
            }
            else if(Skills.length==0){
                $("#positionSkillNullError").show();
            }
            else if(Welfares.length==0){
                $("#positionWelfareNullError").show();
            }
            else if(positionAddress.length==0){
                $("#positionAddressNullError").show();
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
                        positionWelfare:Welfares,
                        positionIntroduction:positionIntro,
                        positionSkill:Skills,
                        positionAddress:positionAddress,
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

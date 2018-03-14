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
    #comUpdate{
        background-color: #17b1f7;
        border:#17b1f7;
    }

    .btn-primary{
        background-color: #17b1f7;
        border:#17b1f7;
    }
</style>
<c:import url="header.jsp" charEncoding="UTF-8"></c:import>

<div class="container">
    <div class="row myCenter">
        <div class="col-sm-8 col-md-8 col-center-block">
            <div class="modal-dialog">
                <form class="form-group center-block" role="form">

                    <div class="form-group">
                        <label for="name"
                               style="height: 30px;width: 100px;font-size: 16px">企业名称</label>
                        <input type="text" class="form-control" id="comName" value="${company.comName}" disabled>
                    </div>
                    <div class="form-group">
                        <label for="name"
                               style="height: 30px;width:200px;font-size: 16px;">企业工商注册号</label>
                        <input type="text" class="form-control" id="comNo" value="${company.comNo}" disabled>
                    </div>

                    <div class="form-group">
                        <label for="name"
                               style="height: 30px;width: 100px;font-size: 16px;">公司法人</label>
                        <input type="text" class="form-control" id="comLegalperson"
                               value="${company.comLegalperson}" disabled>
                    </div>

                    <div class="form-group">
                        <label for="name"
                               style="height: 30px;width: 100px;font-size: 16px;">企业邮箱</label>
                        <input type="text" class="form-control" id="comEmail" value="${company.comEmail}" disabled>
                    </div>

                    <div class="form-group">
                        <label for="name"
                               style="height: 30px;width: 100px;font-size: 16px;">联系方式</label>
                        <input type="text" class="form-control" id="comContact" value="${company.comContact}"
                               disabled>
                    </div>

                    <div class="form-group">
                        <label style="height: 30px;width: 100px;font-size: 16px;">所属行业</label>
                        <input type="text" class="form-control" id="comIndustry"
                               disabled>
                        <div class="btn-group" data-toggle="buttons" id="indOptions">
                            <label class="btn btn-primary">
                                <input type="radio" name="indOptions" id="option1" value="移动互联网 "> 移动互联网
                            </label>
                            <label class="btn btn-primary">
                                <input type="radio" name="indOptions" id="option2" value="电子商务"> 电子商务
                            </label>
                            <label class="btn btn-primary">
                                <input type="radio" name="indOptions" id="option3" value="教育"> 教育
                            </label>
                            <label class="btn btn-primary">
                                <input type="radio" name="indOptions" id="option4" value="金融"> 金融
                            </label>
                            <label class="btn btn-primary">
                                <input type="radio" name="indOptions" id="option5" value="通讯"> 通讯
                            </label>
                            <label class="btn btn-primary">
                                <input type="radio" name="indOptions" id="option6" value="硬件"> 硬件
                            </label>
                            <label class="btn btn-primary">
                                <input type="radio" name="indOptions" id="option7" value="游戏"> 游戏
                            </label>
                            <label class="btn btn-primary">
                                <input type="radio" name="indOptions" id="option8" value="数据"> 数据
                            </label>
                            <label class="btn btn-primary">
                                <input type="radio" name="indOptions" id="option9" value="安全"> 安全
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name"
                               style="height: 30px;width: 100px;font-size: 16px;">公司地址</label>
                        <input type="text" class="form-control shuru" id="comLocation" value="${company.comLocation}"
                               disabled>
                    </div>
                    <div class="form-group">
                        <label for="comSize"
                               style="height: 30px;width: 100px;font-size: 16px;">公司规模</label>
                        <input type="text" class="form-control" id="comSize"  value="${company.comSize}" disabled>
                        <div class="btn-group" data-toggle="buttons" id="sizeOptions">
                            <label class="btn btn-primary">
                                <input type="radio" name="sizeOptions" id="sizeOption1" value="20人以下"> 20人以下
                            </label>
                            <label class="btn btn-primary">
                                <input type="radio" name="sizeOptions" id="sizeOption2" value="20-50人"> 20-50人
                            </label>
                            <label class="btn btn-primary">
                                <input type="radio" name="sizeOptions" id="sizeOption3" value="50-100人"> 50-100人
                            </label>
                            <label class="btn btn-primary">
                                <input type="radio" name="sizeOptions" id="sizeOption4" value="100-500人"> 100-500人
                            </label>
                            <label class="btn btn-primary">
                                <input type="radio" name="sizeOptions" id="sizeOption5" value="500-1000人"> 500-1000人
                            </label>
                            <label class="btn btn-primary">
                                <input type="radio" name="sizeOptions" id="sizeOption6" value="1000人以上"> 1000人以上
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="comIntro"
                               style="height: 30px;width: 100px;font-size: 16px;">公司简介</label>
                        <textarea class="form-control" id="comIntro"
                                  disabled>${company.comIntro}</textarea>
                    </div>
                    <div class="form-group">
                        <label for="name"
                               style="height: 30px;width: 200px;font-size: 16px;">发布岗位上限</label>
                        <input type="text" class="form-control" id="comPostlimit" value="${company.comPostlimit}"
                               disabled>
                    </div>

                    <div class="form-group">
                        <button type="button" class="btn btn-primary btn-block" id="comUpdate" >修改</button>
                        <button hidden type="button" class="btn btn-primary btn-block" id="comPostUpdate" >提交修改</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<c:import url="../user/footer.jsp" charEncoding="UTF-8"/>

<script src="<c:url value="/js/jquery.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.js"/>"></script>
<script type="text/javascript">

    $(document).ready(function () {
        //获取后台值
        var IndustryValue="${company.comIndustry}";
        var SizeValue="${company.comSize}";
        $("#comIndustry").val(IndustryValue);
        $("#comSize").val(SizeValue);



        $("#comPostUpdate").hide();
        $("#indOptions").hide();
        $("#sizeOptions").hide();
        //公司可修改内容
        //联系方式
        //所属行业
        //公司地址
        //公司规模
        //公司简介

        $("#comUpdate").click(function () {
            $("input[name='indOptions']").each(function () {
                if($(this).val()==$("#comIndustry")){
                    $(this).addClass("active");
                }
            })
            $("input[name='sizeOptions']").each(function () {
                if($(this).val()==$("#comSize")){
                    $(this).addClass("active");
                }
            })
            //解放这些区域的值
            $("#comContact").attr("disabled",false);
            $("#comLocation").attr("disabled",false);
            $("#comSize").attr("disabled",false);
            $("#comIntro").attr("disabled",false);
            //隐藏表示框，显示选择项
            //行业
            $("#comIndustry").hide();
            $("#indOptions").show();
            //规模
            $("#comSize").hide();
            $("#sizeOptions").show();

            //显示提交修改按钮，隐藏修改按钮
            $("#comUpdate").hide();
            $("#comPostUpdate").show();

        })
        $("#comPostUpdate").click(function () {
            //获取选择值
            var comIndustry = $("input[name='indOptions']:checked").val();
            var comSize =$("input[name='sizeOptions']:checked").val();
            //隐藏之前取另一部分值
            var comContact =$("#comContact").val();
            var comLocation =$("#comLocation").val();
            var comIntro=$("#comIntro").val();

            //隐藏提交修改按钮
            $("#comPostUpdate").hide();
            //显示修改按钮
            $("#comUpdate").show();
            //显示展示框，隐藏选择项
            //行业
            $("#indOptions").hide();
            $("#comIndustry").show();
            //规模
            $("#sizeOptions").hide();
            $("#comSize").show();

            //锁定这些区域的值
            $("#comContact").attr("disabled",true);
            $("#comLocation").attr("disabled",true);
            $("#comSize").attr("disabled",true);
            $("#comIntro").attr("disabled",true);


            $.ajax({
                type:'POST',
                async: false,
                url:"${pageContext.request.contextPath}/company/completeCompany.action",
                data:{
                    pkComId:${company.pkComId},
                    comContact:comContact,
                    comIndustry:comIndustry,
                    comLocation:comLocation,
                    comSize:comSize,
                    comIntro:comIntro
                },
                dataType:'json',
                success:function (data) {
                    if(data.result="completeOK"){
                        alert("修改成功！");
                        $("#comIndustry").val(data.comIndustry);
                        $("#comSize").val(data.comSize);
                        $("#comContact").val(data.comContact);
                        $("#comLocation").val(data.comLocation);
                        $("#comIntro").val(data.comIntro);
                    }
                    else{
                        alert(data.result);
                    }
                },


            });



        })
    });
</script>
</body>
</html>

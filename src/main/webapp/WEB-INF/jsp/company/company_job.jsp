<%--
  Created by IntelliJ IDEA.
  User: DuJie
  Date: 2018/2/27
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>招聘岗位</title>
</head>
<body>


<link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/css/bootstrapdj.min.css"/>" rel="stylesheet">
<link href="<c:url value="/css/zzhsj_company.css"/>" rel="stylesheet">

<style>
    .col-center-block {
        float: none;
        display: block;
        margin-left: auto;
        margin-right: auto;
    }

    .btn-info{
        background-color:#17b1f7;
    }
</style>

<c:import url="header.jsp" charEncoding="UTF-8"></c:import>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-push-8">
            <button type="button" class="btn btn-info" onclick="location='./postPositionPageRequest.action'">发布岗位</button>
        </div>
    </div>
</div>
<div class="container">
    <div class="row myCenter">
        <div class="col-sm-8 col-md-8 col-center-block">
            <div class="modal-dialog">
                <table class="table table-hover">
                    <caption>已发布岗位</caption>
                    <thead>
                    <tr>
                        <th>岗位名称</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="position" items="${positionList}">
                        <tr>
                            <td>${position.positionName}</td>
                            <td><button type="button" class="btn btn-link" onclick="location='./deletePositionById.action?pkPositionId=${position.pkPositionId}'">
                                删除</button> </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div  style="text-align:center">
                    <ul id="bp-element" style="display:inline-block"></ul>
                </div>
            </div>
        </div>

    </div>
</div>

<c:import url="../user/footer.jsp" charEncoding="UTF-8"/>

<script src="<c:url value="/js/jquery.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.js"/>"></script>
<script src="<c:url value="/js/bootstrap-paginator.js"/>"></script>
<script type="text/javascript">
    $("#bp-element").bootstrapPaginator({
        bootstrapMajorVersion: 3,//对应的bootstrap版本
        currentPage: ${positionPageInfo.pageNum}, //当前页数，这里是用的EL表达式，获取从后台传过来的值
        numberOfPages: 5, //每页页数
        totalPages:${positionPageInfo.pages}, //总页数，这里是用的EL表达式，获取从后台传过来的值
        alignment: 'center',
        itemTexts: function (type, page, current) {//设置显示的样式，默认是箭头
            switch (type) {
                case "first":
                    return "首页";
                case "prev":
                    return "上一页";
                case "next":
                    return "下一页";
                case "last":
                    return "末页";
                case "page":
                    return page;
            }
        },
        //点击事件
        onPageClicked: function (event, originalEvent, type, page) {
            location.href = "showPositions.action?page=" + page;
        }

    })
</script>
</body>
</html>

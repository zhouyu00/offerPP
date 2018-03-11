<%--
  Created by IntelliJ IDEA.
  User: DuJie
  Date: 2018/2/28
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>查看简历</title>
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
</style>
<style>
    .list-group-item{
        padding-bottom: 18px;
    }
</style>

<c:import url="header.jsp" charEncoding="UTF-8"></c:import>

<div class="container">
    <div class="row myCenter">
        <div class="col-sm-8 col-md-8 col-center-block">
            <div class="modal-dialog">

                <div class="list-group">
                    <a href="#" class="list-group-item active">
                        <h4 class="list-group-item-heading">
                            已收到简历
                        </h4>
                    </a>
                    <c:forEach var="user" items="${userList}">
                        <a href="./showResumeDetails.action?userId=${user.pkUserId}" class="list-group-item">
                            <h4 class="list-group-item-heading">
                                    ${user.userEmail}
                            </h4>
                            <div class="row col-md-2">
                                <span>${user.userName}</span>
                            </div>

                        </a>
                    </c:forEach>

                </div>

            </div>

            </table>
            <div  style="text-align:center">
                <ul id="bp-element" style="display:inline-block"></ul>
            </div>
        </div>
    </div>
</div>


<c:import url="../user/footer.jsp" charEncoding="UTF-8"/>
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/jquerydj-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.js"/>"></script>
<script src="<c:url value="/js/bootstrap-paginator.js"/>"></script>
<script type="text/javascript">
    $("#bp-element").bootstrapPaginator({
        bootstrapMajorVersion: 3,//对应的bootstrap版本
        currentPage: ${userPageInfo.pageNum}, //当前页数，这里是用的EL表达式，获取从后台传过来的值
        numberOfPages: 5, //每页页数
        totalPages:${userPageInfo.pages}, //总页数，这里是用的EL表达式，获取从后台传过来的值
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
            location.href = "/company/showResumesByPositionId.action?pkPositionId=${pkPositionId}&page=" + page;
        }

    })
</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: L1ANN
  Date: 2018/3/5
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>职位搜索|offer++</title>
    <meta charset="utf-8">
    <link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/zzhsj.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/selfstyle_search.css"/>" rel="stylesheet">
</head>
<body>
<!--导航栏-->
<c:import url="header_login.jsp" charEncoding="UTF-8"/>
<!--正文-->
<div class="container">
    <div class="col-md-1 col-lg-1"></div>
    <div class="row col-md-11 col-lg-11">

        <!--搜索栏-->
        <div class="col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 jobkeywords">

            <form class="jobfind" action="${pageContext.request.contextPath}/position/query.action" method="post">

                <div class="input-group  input-group-lg">
                    <div class="input-group-addon"><img class="search" src="<c:url value="/img/search.png"/>"></div>
                    <%--<span class="glyphicon glyphicon-search"></span>--%>
                    <input type="text" class="form-control" id="jobfind" name="name" placeholder="请输入要查找的职位"
                           value="<c:if test="${name!=null}">${name}</c:if>">

                    <div class="input-group-addon jobsearchright">
                        <button class="jobsearch" type="submit">搜索职位</button>
                    </div>
                </div>


                <div class="line">
                    <span class="itemname">工作地点</span>

                    <span class="
                                <c:if test="${places != null && places.size()!=0}">itemoff nolimit</c:if>
                                <c:if test="${places.size()==0 || places ==null}">itemon nolimit</c:if>
                                " id="place" onclick="choosePlace(this)">不限</span>

                    <span class="
                                <c:if test="${places.contains('上海')}">itemon place</c:if>
                                <c:if test="${!places.contains('上海')}">itemoff place</c:if>
                                " onclick="choosePlace(this)"><input class="hidden_place" name="places"
                                                                     type="hidden" value="
                                <c:if test="${places.contains('上海')}">上海</c:if>
                                <c:if test="${!places.contains('上海')}"></c:if>
                                ">上海</span>

                    <span class="
                                <c:if test="${places.contains('北京')}">itemon place</c:if>
                                <c:if test="${!places.contains('北京')}">itemoff place</c:if>
                                " onclick="choosePlace(this)"><input class="hidden_place" name="places"
                                                                     type="hidden" value="
                                <c:if test="${places.contains('北京')}">北京</c:if>
                                <c:if test="${!places.contains('北京')}"></c:if>
                                ">北京</span>

                    <span class="
                                <c:if test="${places.contains('深圳')}">itemon place</c:if>
                                <c:if test="${!places.contains('深圳')}">itemoff place</c:if>
                                " onclick="choosePlace(this)"><input class="hidden_place" name="places"
                                                                     type="hidden" value="
                                <c:if test="${places.contains('深圳')}">深圳</c:if>
                                <c:if test="${!places.contains('深圳')}"></c:if>
                                ">深圳</span>

                    <span class="
                                <c:if test="${places.contains('杭州')}">itemon place</c:if>
                                <c:if test="${!places.contains('杭州')}">itemoff place</c:if>
                                " onclick="choosePlace(this)"><input class="hidden_place" name="places"
                                                                     type="hidden" value="
                                <c:if test="${places.contains('杭州')}">杭州</c:if>
                                <c:if test="${!places.contains('杭州')}"></c:if>
                                ">杭州</span>

                    <span class="
                                <c:if test="${places.contains('广州')}">itemon place</c:if>
                                <c:if test="${!places.contains('广州')}">itemoff place</c:if>
                                " onclick="choosePlace(this)"><input class="hidden_place" name="places"
                                                                     type="hidden" value="
                                <c:if test="${places.contains('广州')}">广州</c:if>
                                <c:if test="${!places.contains('广州')}"></c:if>
                                ">广州</span>

                    <span class="
                                <c:if test="${places.contains('武汉')}">itemon place</c:if>
                                <c:if test="${!places.contains('武汉')}">itemoff place</c:if>
                                " onclick="choosePlace(this)"><input class="hidden_place" name="places"
                                                                     type="hidden" value="
                                <c:if test="${places.contains('武汉')}">武汉</c:if>
                                <c:if test="${!places.contains('武汉')}"></c:if>
                                ">武汉</span>
                </div>

                <div class="line">
                    <span class="itemname">公司规模</span>

                    <span class="
                                <c:if test="${sizes != null && sizes.size()!=0}">itemoff nolimit</c:if>
                                <c:if test="${sizes.size()==0 || sizes == null}">itemon nolimit</c:if>
                                " id="size" onclick="chooseSize(this)">不限</span>

                    <span class="
                                <c:if test="${sizes.contains('20人以下')}">itemon size</c:if>
                                <c:if test="${!sizes.contains('20人以下')}">itemoff size</c:if>
                                " onclick="chooseSize(this)"><input class="hidden_size" name="sizes"
                                                                    type="hidden" value="
                                <c:if test="${sizes.contains('20人以下')}">20人以下</c:if>
                                <c:if test="${!sizes.contains('20人以下')}"></c:if>
                                ">20人以下</span>

                    <span class="
                                <c:if test="${sizes.contains('20-50人')}">itemon size</c:if>
                                <c:if test="${!sizes.contains('20-50人')}">itemoff size</c:if>
                                " onclick="chooseSize(this)"><input class="hidden_size" name="sizes"
                                                                    type="hidden" value="
                                <c:if test="${sizes.contains('20-50人')}">20-50人</c:if>
                                <c:if test="${!sizes.contains('20-50人')}"></c:if>
                                ">20-50人</span>

                    <span class="
                                <c:if test="${sizes.contains('50-100人')}">itemon size</c:if>
                                <c:if test="${!sizes.contains('50-100人')}">itemoff size</c:if>
                                " onclick="chooseSize(this)"><input class="hidden_size" name="sizes"
                                                                    type="hidden" value="
                                <c:if test="${sizes.contains('50-100人')}">50-100人</c:if>
                                <c:if test="${!sizes.contains('50-100人')}"></c:if>
                                ">50-100人</span>

                    <span class="
                                <c:if test="${sizes.contains('100-500人')}">itemon size</c:if>
                                <c:if test="${!sizes.contains('100-500人')}">itemoff size</c:if>
                                " onclick="chooseSize(this)"><input class="hidden_size" name="sizes"
                                                                    type="hidden" value="
                                <c:if test="${sizes.contains('100-500人')}">100-500人</c:if>
                                <c:if test="${!sizes.contains('100-500人')}"></c:if>
                                ">100-500人</span>

                    <span class="
                                <c:if test="${sizes.contains('500-1000人')}">itemon size</c:if>
                                <c:if test="${!sizes.contains('500-1000人')}">itemoff size</c:if>
                                " onclick="chooseSize(this)"><input class="hidden_size" name="sizes"
                                                                    type="hidden" value="
                                <c:if test="${sizes.contains('500-1000人')}">500-1000人</c:if>
                                <c:if test="${!sizes.contains('500-1000人')}"></c:if>
                                ">500-1000人</span>

                    <span class="
                                <c:if test="${sizes.contains('1000人以上')}">itemon size</c:if>
                                <c:if test="${!sizes.contains('1000人以上')}">itemoff size</c:if>
                                " onclick="chooseSize(this)"><input class="hidden_size" name="sizes"
                                                                    type="hidden" value="
                                <c:if test="${sizes.contains('1000人以上')}">1000人以上</c:if>
                                <c:if test="${!sizes.contains('1000人以上')}"></c:if>
                                ">1000人以上</span>
                </div>

                <div class=" line">
                    <span class="itemname">学历要求</span>

                    <span class="
                                <c:if test="${educations != null && educations.size()!=0}">itemoff nolimit</c:if>
                                <c:if test="${educations.size()==0 || educations == null}">itemon nolimit</c:if>
                                " id="education" onclick="chooseEducation(this)">不限</span>

                    <span class="
                                <c:if test="${educations.contains('专科')}">itemon education</c:if>
                                <c:if test="${!educations.contains('专科')}">itemoff education</c:if>
                                " onclick="chooseEducation(this)"><input class="hidden_education" name="educations"
                                                                         type="hidden" value="
                                <c:if test="${educations.contains('专科')}">专科</c:if>
                                <c:if test="${!educations.contains('专科')}"></c:if>
                                ">专科</span>

                    <span class="
                                <c:if test="${educations.contains('本科')}">itemon education</c:if>
                                <c:if test="${!educations.contains('本科')}">itemoff education</c:if>
                                " onclick="chooseEducation(this)"><input class="hidden_education" name="educations"
                                                                         type="hidden" value="
                                <c:if test="${educations.contains('本科')}">本科</c:if>
                                <c:if test="${!educations.contains('本科')}"></c:if>
                                ">本科</span>

                    <span class="
                                <c:if test="${educations.contains('硕士')}">itemon education</c:if>
                                <c:if test="${!educations.contains('硕士')}">itemoff education</c:if>
                                " onclick="chooseEducation(this)"><input class="hidden_education" name="educations"
                                                                         type="hidden" value="
                                <c:if test="${educations.contains('硕士')}">硕士</c:if>
                                <c:if test="${!educations.contains('硕士')}"></c:if>
                                ">硕士</span>

                    <span class="
                                <c:if test="${educations.contains('博士')}">itemon education</c:if>
                                <c:if test="${!educations.contains('博士')}">itemoff education</c:if>
                                " onclick="chooseEducation(this)"><input class="hidden_education" name="educations"
                                                                         type="hidden" value="
                                <c:if test="${educations.contains('博士')}">博士</c:if>
                                <c:if test="${!educations.contains('博士')}"></c:if>
                                ">博士</span>
                </div>


                <div class="line">
                    <span class="itemname">所属行业</span>
                    <span class="
                                <c:if test="${industries != null && industries.size()!=0}">itemoff nolimit</c:if>
                                <c:if test="${industries.size()==0 || industries == null}">itemon nolimit</c:if>
                                " id="industry" onclick="chooseIndustry(this)">不限</span>

                    <span class="
                                <c:if test="${industries.contains('移动互联网')}">itemon industry</c:if>
                                <c:if test="${!industries.contains('移动互联网')}">itemoff industry</c:if>
                                " onclick="chooseIndustry(this)"><input class="hidden_industry" name="industries"
                                                                        type="hidden" value="
                                <c:if test="${industries.contains('移动互联网')}">移动互联网</c:if>
                                <c:if test="${!industries.contains('移动互联网')}"></c:if>
                                ">移动互联网</span>

                    <span class="
                                <c:if test="${industries.contains('电子商务')}">itemon industry</c:if>
                                <c:if test="${!industries.contains('电子商务')}">itemoff industry</c:if>
                                " onclick="chooseIndustry(this)"><input class="hidden_industry" name="industries"
                                                                        type="hidden" value="
                                <c:if test="${industries.contains('电子商务')}">电子商务</c:if>
                                <c:if test="${!industries.contains('电子商务')}"></c:if>
                                ">电子商务</span>

                    <span class="
                                <c:if test="${industries.contains('教育')}">itemon industry</c:if>
                                <c:if test="${!industries.contains('教育')}">itemoff industry</c:if>
                                " onclick="chooseIndustry(this)"><input class="hidden_industry" name="industries"
                                                                        type="hidden" value="
                                <c:if test="${industries.contains('教育')}">教育</c:if>
                                <c:if test="${!industries.contains('教育')}"></c:if>
                                ">教育</span>
                    <span class="
                                <c:if test="${industries.contains('金融')}">itemon industry</c:if>
                                <c:if test="${!industries.contains('金融')}">itemoff industry</c:if>
                                " onclick="chooseIndustry(this)"><input class="hidden_industry" name="industries"
                                                                        type="hidden" value="
                                <c:if test="${industries.contains('金融')}">金融</c:if>
                                <c:if test="${!industries.contains('金融')}"></c:if>
                                ">金融</span>

                    <span class="
                                <c:if test="${industries.contains('通讯')}">itemon industry</c:if>
                                <c:if test="${!industries.contains('通讯')}">itemoff industry</c:if>
                                " onclick="chooseIndustry(this)"><input class="hidden_industry" name="industries"
                                                                        type="hidden" value="
                                <c:if test="${industries.contains('通讯')}">通讯</c:if>
                                <c:if test="${!industries.contains('通讯')}"></c:if>
                                ">通讯</span>

                    <span class="
                                <c:if test="${industries.contains('游戏')}">itemon industry</c:if>
                                <c:if test="${!industries.contains('游戏')}">itemoff industry</c:if>
                                " onclick="chooseIndustry(this)"><input class="hidden_industry" name="industries"
                                                                        type="hidden" value="
                                <c:if test="${industries.contains('游戏')}">游戏</c:if>
                                <c:if test="${!industries.contains('游戏')}"></c:if>
                                ">游戏</span>

                    <span class="
                                <c:if test="${industries.contains('数据')}">itemon industry</c:if>
                                <c:if test="${!industries.contains('数据')}">itemoff industry</c:if>
                                " onclick="chooseIndustry(this)"><input class="hidden_industry" name="industries"
                                                                        type="hidden" value="
                                <c:if test="${industries.contains('数据')}">数据</c:if>
                                <c:if test="${!industries.contains('数据')}"></c:if>
                                ">数据</span>

                    <span class="
                                <c:if test="${industries.contains('安全')}">itemon industry</c:if>
                                <c:if test="${!industries.contains('安全')}">itemoff industry</c:if>
                                " onclick="chooseIndustry(this)"><input class="hidden_industry" name="industries"
                                                                        type="hidden" value="
                                <c:if test="${industries.contains('安全')}">安全</c:if>
                                <c:if test="${!industries.contains('安全')}"></c:if>
                                ">安全</span>

                    <span class="
                                <c:if test="${industries.contains('硬件')}">itemon industry</c:if>
                                <c:if test="${!industries.contains('硬件')}">itemoff industry</c:if>
                                " onclick="chooseIndustry(this)"><input class="hidden_industry" name="industries"
                                                                        type="hidden" value="
                                <c:if test="${industries.contains('硬件')}">硬件</c:if>
                                <c:if test="${!industries.contains('硬件')}"></c:if>
                                ">硬件</span>

                </div>

                <div class="line">
                    <span class="itemname">工作经验</span>

                    <span class="
                                <c:if test="${experiments != null && experiments.size()!=0}">itemoff nolimit</c:if>
                                <c:if test="${experiments.size()==0 || experiments == null}">itemon nolimit</c:if>
                                " id="experiment" onclick="chooseExperiment(this)">不限</span>

                    <span class="
                                <c:if test="${experiments.contains('一年及以上')}">itemon experiment</c:if>
                                <c:if test="${!experiments.contains('一年及以上')}">itemoff experiment</c:if>
                                " onclick="chooseExperiment(this)"><input class="hidden_experiment" name="experiments"
                                                                          type="hidden" value="
                                <c:if test="${experiments.contains('一年及以上')}">一年及以上</c:if>
                                <c:if test="${!experiments.contains('一年及以上')}"></c:if>
                                ">一年及以上</span>

                    <span class="
                                <c:if test="${experiments.contains('两年及以上')}">itemon experiment</c:if>
                                <c:if test="${!experiments.contains('两年及以上')}">itemoff experiment</c:if>
                                " onclick="chooseExperiment(this)"><input class="hidden_experiment" name="experiments"
                                                                          type="hidden" value="
                                <c:if test="${experiments.contains('两年及以上')}">两年及以上</c:if>
                                <c:if test="${!experiments.contains('两年及以上')}"></c:if>
                                ">两年及以上</span>

                    <span class="
                                <c:if test="${experiments.contains('三年及以上')}">itemon experiment</c:if>
                                <c:if test="${!experiments.contains('三年及以上')}">itemoff experiment</c:if>
                                " onclick="chooseExperiment(this)"><input class="hidden_experiment" name="experiments"
                                                                          type="hidden" value="
                                <c:if test="${experiments.contains('三年及以上')}">两年及以上</c:if>
                                <c:if test="${!experiments.contains('三年及以上')}"></c:if>
                                ">三年及以上</span>

                    <span class="
                                <c:if test="${experiments.contains('五年及以上')}">itemon experiment</c:if>
                                <c:if test="${!experiments.contains('五年及以上')}">itemoff experiment</c:if>
                                " onclick="chooseExperiment(this)"><input class="hidden_experiment" name="experiments"
                                                                          type="hidden" value="
                                <c:if test="${experiments.contains('五年及以上')}">五年及以上</c:if>
                                <c:if test="${!experiments.contains('五年及以上')}"></c:if>
                                ">五年及以上</span>

                    <span class="
                                <c:if test="${experiments.contains('十年及以上')}">itemon experiment</c:if>
                                <c:if test="${!experiments.contains('十年及以上')}">itemoff experiment</c:if>
                                " onclick="chooseExperiment(this)"><input class="hidden_experiment" name="experiments"
                                                                          type="hidden" value="
                                <c:if test="${experiments.contains('十年及以上')}">十年及以上</c:if>
                                <c:if test="${!experiments.contains('十年及以上')}"></c:if>
                                ">十年及以上</span>
                </div>

                <div class="line">
                    <span class="itemname">工作性质</span>

                    <span class="
                                <c:if test="${properties != null && properties.size()!=0}">itemoff nolimit</c:if>
                                <c:if test="${properties.size()==0 || properties == null}">itemon nolimit</c:if>
                                " id="property" onclick="chooseProperty(this)">不限</span>

                    <span class="
                                <c:if test="${properties.contains('全职')}">itemon property</c:if>
                                <c:if test="${!properties.contains('全职')}">itemoff property</c:if>
                                " onclick="chooseProperty(this)"><input class="hidden_property" name="properties"
                                                                        type="hidden" value="
                                <c:if test="${properties.contains('全职')}">全职</c:if>
                                <c:if test="${!properties.contains('全职')}"></c:if>
                                ">全职</span>

                    <span class="
                                <c:if test="${properties.contains('兼职')}">itemon property</c:if>
                                <c:if test="${!properties.contains('兼职')}">itemoff property</c:if>
                                " onclick="chooseProperty(this)"><input class="hidden_property" name="properties"
                                                                        type="hidden" value="
                                <c:if test="${properties.contains('兼职')}">兼职</c:if>
                                <c:if test="${!properties.contains('兼职')}"></c:if>
                                ">兼职</span>

                    <span class="
                                <c:if test="${properties.contains('实习')}">itemon property</c:if>
                                <c:if test="${!properties.contains('实习')}">itemoff property</c:if>
                                " onclick="chooseProperty(this)"><input class="hidden_property" name="properties"
                                                                        type="hidden" value="
                                <c:if test="${properties.contains('实习')}">实习</c:if>
                                <c:if test="${!properties.contains('实习')}"></c:if>
                                ">实习</span>
                </div>
            </form>
        </div>

        <!--职位显示-->
        <div class="col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 jobshow">
            <div class="heading">
                <span class="text_1">全部职位</span>

                <a href="${pageContext.request.contextPath}/user/myCollection.action" class="mycollection"><!--<span class="glyphicon glyphicon-heart-empty"></span>-->
                    <span class="heart_collection"><img class="collection" src="<c:url value="/img/heartcollection.png"/>"></span><span class="collection_text">&nbsp;职位收藏</span>
                </a>
            </div>
            <c:forEach items="${positionQuery.list}" var="positionVo">
                <div class="onejob row">

                    <div class="left col-md-7 col-lg-7">
                        <p class="jobname">
                            <a href="${pageContext.request.contextPath}/position/detail.action?id=${positionVo.pkPositionId}"
                               class="joblink">${positionVo.positionName}</a>
                            <img src="
                            <c:if test="${positionVo.collectionFlag!=null}">
                            <c:url value="/img/hearton.png"/>
                            </c:if>

                            <c:if test="${positionVo.collectionFlag==null}">
                            <c:url value="/img/heartoff.png"/>
                            </c:if>
                                     " class="heart" id="heart${positionVo.pkPositionId}"
                                 onclick="changeHeart('${positionVo.pkPositionId}','heart${positionVo.pkPositionId}','collect${positionVo.pkPositionId}')">
                            <span style="display: none;" class="collect"
                                  id="collect${positionVo.pkPositionId}">已收藏</span>
                        </p>

                        <p class="jobinfo">
                            <span class="glyphicon glyphicon-record sign"></span>
                            <span class="payment experience">${positionVo.positionSalary}</span>
                            <span class="experience">
                                <c:if test="${positionVo.positionExperiment!=null}">
                                    ${positionVo.positionExperiment}
                                </c:if>
                                <c:if test="${positionVo.positionExperiment==null}">
                                    不限工作经历
                                </c:if>
                            </span>
                            <span class="experience">
                                <c:if test="${positionVo.positionEducation!=null}">
                                    ${positionVo.positionEducation}
                                </c:if>
                                <c:if test="${positionVo.positionEducation==null}">
                                    不限教育经历
                                </c:if>
                            </span>
                        </p>

                        <p class="skillsline">
                            <c:forEach items="${positionVo.skills}" var="skill">
                                <span class="skills">${skill}</span>
                            </c:forEach>
                        </p>

                    </div>

                    <div class="right col-md-5 col-lg-5 ">
                        <p class="companyname">${positionVo.companyName}</p>
                        <p class="companyinfo">
                            <span>${positionVo.positionPlace}</span> |
                            <span>${positionVo.companyIndustry}</span> |
                            <span>${positionVo.positionProperty}</span>
                        </p>

                        <p class="companyprofit">${positionVo.positionWelfare}</p>

                    </div>

                </div>
            </c:forEach>

            <!--下面是控制分页空间，必须要是ul元素才行-->

            <%--<div class="row">--%>

            <%--<div class="col-md-6 col-lg-6">--%>
            <ul id="bp-element"></ul>
            <%--</div>--%>

            <%--</div>--%>
        </div>
    </div>
</div>
<!--页尾-->
<c:import url="footer.jsp" charEncoding="UTF-8"/>
<!--script脚本-->
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.js"/>"></script>
<script src="<c:url value="/js/bootstrap-paginator.js"/>"></script>
<script type="text/javascript">

    var num_place = <c:if test="${places==null || places.size()==0}">0</c:if><c:if test="${places!=null && places.size()!=0}">${places.size()}</c:if>;
    var num_size = <c:if test="${sizes==null || sizes.size()==0}">0</c:if><c:if test="${sizes!=null && sizes.size()!=0}">${sizes.size()}</c:if>;;
    var num_education = <c:if test="${educations==null || educations.size()==0}">0</c:if><c:if test="${educations!=null && educations.size()!=0}">${educations.size()}</c:if>;;
    var num_industry = <c:if test="${industries==null || industries.size()==0}">0</c:if><c:if test="${industries!=null && industries.size()!=0}">${industries.size()}</c:if>;;
    var num_experiment = <c:if test="${experiments==null || experiments.size()==0}">0</c:if><c:if test="${experiments!=null && experiments.size()!=0}">${experiments.size()}</c:if>;;
    var num_property = <c:if test="${properties==null || properties.size()==0}">0</c:if><c:if test="${properties!=null && properties.size()!=0}">${properties.size()}</c:if>;;

    <!--分页 配置-->
    $("#bp-element").bootstrapPaginator({
        bootstrapMajorVersion: 3,//对应的bootstrap版本
        currentPage:${positionQuery.pageNum},//当前页数，从后台获取当前页数
        numberOfPages: 3,//每页显示的分页页数
        totalPages:${positionQuery.pages},//总页数
        alignment: 'center',
        itemTexts: function (type, page, current) {//改写分页按钮字样，默认是箭头
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

            var name = $("#jobfind").val();

            var places = new Array();
            $("input[name='places']").each(function () {
                places.push($(this).val().trim());
            });

            var sizes = new Array();
            $("input[name='sizes']").each(function () {
                sizes.push($(this).val().trim());
            });

            var educations = new Array();
            $("input[name='educations']").each(function () {
                educations.push($(this).val().trim());
            });

            var experiments = new Array();
            $("input[name='experiments']").each(function () {
                experiments.push($(this).val().trim());
            });

            var industries = new Array();
            $("input[name='industries']").each(function () {
                industries.push($(this).val().trim());
            });

            var properties = new Array();
            $("input[name='properties']").each(function () {
                properties.push($(this).val().trim());
            });


            location.href = "${pageContext.request.contextPath}/position/query.action?page=" + page + "&name=" + name + "&places=" + places + "&sizes=" + sizes + "&educations=" + educations + "&experiments=" + experiments + "&industries=" + industries + "&properties=" + properties;
        }
    });


    <!--搜索条件JS-->
    function choosePlace(e) {
        //添加搜索条件
        //点击除了“不限”以外的按钮时，如果按钮处于off状态，调整为on状态，如果此时“不限”处于on状态，调整为off状态
        if (e.className.trim() == "itemoff place") {
            e.className = "itemon place";
            e.children[0].value = e.innerText;
            num_place++;
            if ($("#place").attr("class").trim() == "itemon nolimit") {
                $("#place").attr("class", "itemoff nolimit");
            }
        }
        //取消搜索条件
        //点击除了“不限”以外的按钮时，如果按钮处于on状态，调整为off状态，如果此时“不限”以外的按钮都处于off状态
        //调整“不限”按钮为on状态
        else if (e.className.trim() == "itemon place") {
            e.className = "itemoff place";
            num_place--;
            e.children[0].value = "";
            if (num_place == 0) {
                $("#place").attr("class", "itemon nolimit");
            }
        }
        //取消所有搜索条件，处于“不限”状态
        else {
            //点击“不限”按钮时，如果处于on状态，不处理
            if (e.className.trim() == "itemon nolimit") {

            }
            //点击“不限”按钮时，如果处于off状态，调整为on状态，并将除“不限”按钮以外的按钮调整为off状态
            if (e.className.trim() == "itemoff nolimit") {
                e.className = "itemon nolimit";
                $(".place").attr("class", "itemoff place");
                $(".hidden_place").val("");
                num_place = 0;
            }
        }
    }

    function chooseSize(e) {
        //添加搜索条件
        //点击除了“不限”以外的按钮时，如果按钮处于off状态，调整为on状态，如果此时“不限”处于on状态，调整为off状态
        if (e.className.trim() == "itemoff size") {
            e.className = "itemon size";
            e.children[0].value = e.innerText;
            num_size++;
            if ($("#size").attr("class").trim() == "itemon nolimit") {
                $("#size").attr("class", "itemoff nolimit");
            }
        }
        //取消搜索条件
        //点击除了“不限”以外的按钮时，如果按钮处于on状态，调整为off状态，如果此时“不限”以外的按钮都处于off状态
        //调整“不限”按钮为on状态
        else if (e.className.trim() == "itemon size") {
            e.className = "itemoff size";
            num_size--;
            e.children[0].value = "";
            if (num_size == 0) {
                $("#size").attr("class", "itemon nolimit");
            }
        }
        //取消所有搜索条件，处于“不限”状态
        else {
            //点击“不限”按钮时，如果处于on状态，不处理
            if (e.className.trim() == "itemon nolimit") {

            }
            //点击“不限”按钮时，如果处于off状态，调整为on状态，并将除“不限”按钮以外的按钮调整为off状态
            if (e.className.trim() == "itemoff nolimit") {
                e.className = "itemon nolimit";
                $(".size").attr("class", "itemoff size");
                $(".hidden_size").val("");
                num_size = 0;
            }
        }
    }

    function chooseEducation(e) {
        //添加搜索条件
        //点击除了“不限”以外的按钮时，如果按钮处于off状态，调整为on状态，如果此时“不限”处于on状态，调整为off状态
        if (e.className.trim() == "itemoff education") {
            e.className = "itemon education";
            e.children[0].value = e.innerText;
            num_education++;
            if ($("#education").attr("class").trim() == "itemon nolimit") {
                $("#education").attr("class", "itemoff nolimit");
            }
        }
        //取消搜索条件
        //点击除了“不限”以外的按钮时，如果按钮处于on状态，调整为off状态，如果此时“不限”以外的按钮都处于off状态
        //调整“不限”按钮为on状态
        else if (e.className.trim() == "itemon education") {
            e.className = "itemoff education";
            num_education--;
            e.children[0].value = "";
            if (num_education == 0) {
                $("#education").attr("class", "itemon nolimit");
            }
        }
        //取消所有搜索条件，处于“不限”状态
        else {
            //点击“不限”按钮时，如果处于on状态，不处理
            if (e.className.trim() == "itemon nolimit") {

            }
            //点击“不限”按钮时，如果处于off状态，调整为on状态，并将除“不限”按钮以外的按钮调整为off状态
            if (e.className.trim() == "itemoff nolimit") {
                e.className = "itemon nolimit";
                $(".education").attr("class", "itemoff education");
                $(".hidden_education").val("");
                num_education = 0;
            }
        }
    }

    function chooseIndustry(e) {
        //添加搜索条件
        //点击除了“不限”以外的按钮时，如果按钮处于off状态，调整为on状态，如果此时“不限”处于on状态，调整为off状态
        if (e.className.trim() == "itemoff industry") {
            e.className = "itemon industry";
            e.children[0].value = e.innerText;
            num_industry++;
            if ($("#industry").attr("class").trim() == "itemon nolimit") {
                $("#industry").attr("class", "itemoff nolimit");
            }
        }
        //取消搜索条件
        //点击除了“不限”以外的按钮时，如果按钮处于on状态，调整为off状态，如果此时“不限”以外的按钮都处于off状态
        //调整“不限”按钮为on状态
        else if (e.className.trim() == "itemon industry") {
            e.className = "itemoff industry";
            num_industry--;
            e.children[0].value = "";
            if (num_industry == 0) {
                $("#industry").attr("class", "itemon nolimit");
            }
        }
        //取消所有搜索条件，处于“不限”状态
        else {
            //点击“不限”按钮时，如果处于on状态，不处理
            if (e.className.trim() == "itemon nolimit") {

            }
            //点击“不限”按钮时，如果处于off状态，调整为on状态，并将除“不限”按钮以外的按钮调整为off状态
            if (e.className.trim() == "itemoff nolimit") {
                e.className = "itemon nolimit";
                $(".industry").attr("class", "itemoff industry");
                $(".hidden_industry").val("");
                num_industry = 0;
            }
        }
    }

    function chooseExperiment(e) {
        //添加搜索条件
        //点击除了“不限”以外的按钮时，如果按钮处于off状态，调整为on状态，如果此时“不限”处于on状态，调整为off状态
        if (e.className.trim() == "itemoff experiment") {
            e.className = "itemon experiment";
            e.children[0].value = e.innerText;
            num_experiment++;
            if ($("#experiment").attr("class").trim() == "itemon nolimit") {
                $("#experiment").attr("class", "itemoff nolimit");
            }
        }
        //取消搜索条件
        //点击除了“不限”以外的按钮时，如果按钮处于on状态，调整为off状态，如果此时“不限”以外的按钮都处于off状态
        //调整“不限”按钮为on状态
        else if (e.className.trim() == "itemon experiment") {
            e.className = "itemoff experiment";
            num_experiment--;
            e.children[0].value = "";
            if (num_experiment == 0) {
                $("#experiment").attr("class", "itemon nolimit");
            }
        }
        //取消所有搜索条件，处于“不限”状态
        else {
            //点击“不限”按钮时，如果处于on状态，不处理
            if (e.className.trim() == "itemon nolimit") {

            }
            //点击“不限”按钮时，如果处于off状态，调整为on状态，并将除“不限”按钮以外的按钮调整为off状态
            if (e.className.trim() == "itemoff nolimit") {
                e.className = "itemon nolimit";
                $(".experiment").attr("class", "itemoff experiment");
                $(".hidden_experiment").val("");
                num_experiment = 0;
            }
        }
    }

    function chooseProperty(e) {
        //添加搜索条件
        //点击除了“不限”以外的按钮时，如果按钮处于off状态，调整为on状态，如果此时“不限”处于on状态，调整为off状态
        if (e.className.trim() == "itemoff property") {
            e.className = "itemon property";
            e.children[0].value = e.innerText;
            num_property++;
            if ($("#property").attr("class").trim() == "itemon nolimit") {
                $("#property").attr("class", "itemoff nolimit");
            }
        }
        //取消搜索条件
        //点击除了“不限”以外的按钮时，如果按钮处于on状态，调整为off状态，如果此时“不限”以外的按钮都处于off状态
        //调整“不限”按钮为on状态
        else if (e.className.trim() == "itemon property") {
            e.className = "itemoff property";
            num_property--;
            e.children[0].value = "";
            if (num_property == 0) {
                $("#property").attr("class", "itemon nolimit");
            }
        }
        //取消所有搜索条件，处于“不限”状态
        else {
            //点击“不限”按钮时，如果处于on状态，不处理
            if (e.className.trim() == "itemon nolimit") {

            }
            //点击“不限”按钮时，如果处于off状态，调整为on状态，并将除“不限”按钮以外的按钮调整为off状态
            if (e.className.trim() == "itemoff nolimit") {
                e.className = "itemon nolimit";
                $(".property").attr("class", "itemoff property");
                $(".hidden_property").val("");
                num_property = 0;
            }
        }
    }

    function trim(str) { //删除左右两端的空格
        return str.replace(/(^\s*)|(\s*$)/g, "");
    }

    <!--收藏按钮JS-->
    //pid:职位id  heart：图片id  collection：已收藏文字的id
    function changeHeart(pid, heart, collection) {
        element = document.getElementById(heart)
        //如果没有收藏该职位，收藏，并将心变色，显示已收藏文字
        if (element.src.match("heartoff")) {
            $.ajax({
                url: "${pageContext.request.contextPath}/user/addCollection.action",
                type: "post",
                data: {
                    "pid": pid
                },
                success: function (data) {
                    if (data.result == "1") {
                        element.src = "<c:url value="/img/hearton.png"/>";
                        collect_remind(heart, collection);
                    } else {
                        alert("添加收藏失败！")
                    }
                },
                error: function () {
                    alert("添加收藏失败！");
                }
            });
        }
        //如果收藏该职位，取消收藏，将红心变色
        else {
            $.ajax({
                url: "${pageContext.request.contextPath}/user/deleteCollection.action",
                type: "post",
                data: {
                    "pid": pid
                },
                success: function (data) {
                    if (data.result == "1") {
                        element.src = "<c:url value="/img/heartoff.png"/>";
                        collect_remind(heart, collection);
                    } else {
                        alert("取消收藏失败！");
                    }
                },
                error: function () {
                    alert("取消收藏失败！");
                }
            });


        }

    }

    function collect_remind(heart, collection) {
        if (document.getElementById(heart).src.match("hearton")) {
            document.getElementById(collection).style.display = "inline-block";
            setTimeout(function () {
                document.getElementById(collection).style.display = "none";
            }, 1500);

        }
    }
</script>
</body>
</html>

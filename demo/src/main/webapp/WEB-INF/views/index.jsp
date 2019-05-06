<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理界面</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<!-- 引入jquery -->
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.11.3.js"></script>
<!-- 引入样式 -->
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 搭建框架页面 -->
	<div class="container">
		<!-- 头部 标题 -->
		<div class="row">
			<div class="col-lg-12">
				<h1>SSM-用户管理</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-lg-2 col-lg-offset-10">
				<button class="btn btn-primary">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<!-- 表格 -->
		<div class="row">
			<div class="col-lg-12">
				<table class="table table-hover">
					<tr calss=" ">
						<th class="col-lg-1">id</th>
						<th class="col-lg-1">姓名</th>
						<th class="col-lg-1">性别</th>
						<th class="col-lg-1">年龄</th>
						<th class="col-lg-2">省份</th>
						<th class="col-lg-2">地区</th>
						<th class="col-lg-2">操作</th>
					</tr>
					<c:forEach items="${pageInfo.list}" var="user">
						<tr>
							<td class="col-lg-1">${user.id }</td>
							<td class="col-lg-1">${user.name }</td>
							<td class="col-lg-1">${user.sex }</td>
							<td class="col-lg-1">${user.age }</td>
							<td class="col-lg-2">${user.pname }</td>
							<td class="col-lg-2">${user.cname }</td>
							<td class="col-lg-2">
								<button class="btn btn-primary glyphicon glyphicon-pencil btn-sm">修改</button>
								<button class="btn btn-danger glyphicon glyphicon-trash btn-sm">删除</button>
							</td>
						</tr>
					</c:forEach>

				</table>
			</div>
		</div>
		<!-- 分页 -->
		<div class="row">
			<!-- 分页信息 -->
			<div class="col-md-6">当前第${pageInfo.pageNum }页，共${pageInfo.pages }页，合计${pageInfo.total }个用户</div>
			<!-- 分页条 -->
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				<ul class="pagination">
					<!-- 首页逻辑 如果是第一页 则不能点 前一页也不能点 -->
					<c:if test="${pageInfo.pageNum==1 }">
						<li class="disabled"> <a href="#">首页</a> </li>
						<li class="disabled"> <a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span> </a> </li>
					</c:if>
					<c:if test="${pageInfo.pageNum!=1 }">
						<li class=""> <a href="${APP_PATH}/users?pn=1">首页</a> </li>
						<li> <a href="${APP_PATH}/users?pn=${pageInfo.pageNum-1 }" aria-label="Previous"> <span aria-hidden="true">&laquo;</span> </a> </li>
					</c:if>
					<!-- 遍历页码 -->
					<c:forEach items="${pageInfo.navigatepageNums }" var="page_num">
						<!-- 当前页码高亮显示 -->
						<c:if test="${page_num==pageInfo.pageNum }">
							<li class="active"> <a href="${APP_PATH}/users?pn=${page_num }">${page_num }</a> </li>
						</c:if>
						<c:if test="${page_num!=pageInfo.pageNum}">
							<li> <a href="${APP_PATH}/users?pn=${page_num }">${page_num }</a> </li>
						</c:if>
					</c:forEach>
					<!-- 末页逻辑 如果是最后一页 则不能点 后一页也不能点 -->
					<c:if test="${pageInfo.pageNum==pageInfo.pages }">
						<li class="disabled"> <a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a> </li>
						<li class="disabled"> <a href="#">末页</a> </li>	
					</c:if>
					<c:if test="${pageInfo.pageNum!=pageInfo.pages }">
						<li class=""> <a href="${APP_PATH}/users?pn=${pageInfo.pageNum+1 }" aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a> </li>
						<li class=""> <a href="${APP_PATH}/users?pn=${pageInfo.pages}">末页</a> </li>	
					</c:if>
				</ul>
				</nav>
			</div>
		</div>


	</div>

	<div></div>

	<div></div>
</body>
</html>
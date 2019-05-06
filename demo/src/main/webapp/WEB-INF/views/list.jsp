<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>用户列表</title>
</head>
<body>
	<from>
	<table border="1px solid #fff">
		<tr>
			<th>id</th>
			<th>姓名</th>
			<th>年龄</th>
			<th>性别</th>
			<th>头像</th>
			<th>所在省</th>
			<th>所在市</th>
			<th>操作</th>
		<tr>
		<tr>
			<td>${user.username}</td>
			<td>${user.gender}</td>
			<td>${user.credits}</td>
			<td>${user.address}</td>
			<td>${user.mobile}</td>
			<td>${user.address}</td>
			<td>${user.mobile}</td>
			<td>
				<a href="selectUserInfo?username=${user.username}">查看用户信息</a>
			</td>
		</tr>
	</table>
	</from>

</body>
</html>
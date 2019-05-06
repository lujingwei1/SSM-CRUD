<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>添加员工</title>
<style type="text/css">
#pic {
	width: 300px;
}
</style>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<!-- 引入jquery -->
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.11.3.js"></script>
<!-- 引入样式 -->
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>


<script language="javascript" type="text/javascript">
	$(document).ready(
			function() {
				$('#province').change(
						function() {
							if ($(this).val() == '选择') {
								$('#city').empty();
								$('#city').append(
										"<option value='选择'>请选择</option>");
								return;
							}
							$('#city').empty();
							$('#city')
									.append("<option value='选择'>请选择</option>");
							var pid = $('#province option:selected').val();
							var pname = $('#province option:selected').text();
							alert(pname);
							//获取城市
							var url = "/demo/getCitys/" + pid;
							//准备参数
							var args = {
								"time" : new Date()
							}
							$.get(url, args, function(data) {
								for (var i = 0; i < data.length; i++) {
									var cname = data[i].cname;
									var cid = data[i].cid;
									$("#city").append(
											"<option value='"+cid+"'>" + cname
													+ "</option>");
								}
							}, "JSON");
						})
				//获取省份
				var url = "/demo/getProvinces"
				//准备参数
				var args = {
					"time" : new Date()
				}
				$.get(url, args, function(data) {
					for (var i = 0; i < data.length; i++) {
						var pname = data[i].pname;
						var pid = data[i].pid;
						$("#province").append(
								"<option value='"+pid+"'>" + pname
										+ "</option>");
					}
				}, "JSON");
			})
</script>

</head>

<body>

	<form method="post" enctype="multipart/from-data" action="${pageContext.request.contextPath}/student/add">
		<table>
			<tr>
				<td>
					<table>
						<tr>
							<td>姓名:</td>
							<td>
								<input type="text" name="name" id="name" />
							</td>
						</tr>
						<tr>
							<td>年龄:</td>
							<td>
								<input type="text" name="age" />
							</td>
						</tr>

						<tr>
							<td>性别:</td>
							<td>
								<input type="radio" name="sex" value="男">
								男
								<input type="radio" name="sex" value="女">
								女
							</td>
						</tr>
						<tr>
							<td>所在省</td>
							<select id="province">
								<option value="选择">请选择</option>
							</select>
						</tr>
						<tr>
							<td>所在市:</td>
							<select id="city">
								<option value="选择">请选择</option>
							</select>
						</tr>
						<tr>
							<td>上传照片:</td>

							<td>
								<input type="file" name="image" />
							</td>


						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="提交" />
							</td>
						</tr>
					</table>
				</td>
				<!-- <td>
					<img src="images/timg.jpg" id="pic" />
				</td> -->
			</tr>
		</table>
	</form>
	<button id="btn1" onClick="add()">在图片前面添加文本</button>


</body>
</html>


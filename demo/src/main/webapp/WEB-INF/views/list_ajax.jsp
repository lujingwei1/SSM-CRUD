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
	<!-- Modal 用户添加-->
	<div class="modal fade" id="userAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">用户添加</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="add_user_form">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="name_add_input" name="name" placeholder="XXX">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline">
									<input type="radio" name="sex" id="sex1_add_radio" value="男" checked="checked">
									男
								</label>
								<label class="radio-inline">
									<input type="radio" name="sex" id="sex2_add_radio" value="女">
									女
								</label>
							</div>

						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">年龄</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="age" id="age_add_input" placeholder="XX">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">省份</label>
							<div class="col-sm-4 pname-add-div">
								<select class="form-control" name="pname" id="pname_add_select">
									<option>请选择</option>
								</select>
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">城市</label>
							<div class="col-sm-4">
								<select class="form-control" name="cname" id="cname_add_select">
									<option>请选择</option>
								</select>
								<span class="help-block"></span>
							</div>
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="user_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal 用户修改-->
	<div class="modal fade" id="userUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" >用户修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="update_user_form">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="name_update_static" name="name" readonly>
								<span class="help-block"></span>
								
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline">
									<input type="radio" name="sex" id="sex1_update_radio" value="男">
									男
								</label>
								<label class="radio-inline">
									<input type="radio" name="sex" id="sex2_update_radio" value="女">
									女
								</label>
							</div>

						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">年龄</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="age" id="age_update_input" placeholder="XX">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">省份</label>
							<div class="col-sm-4 pname-update-div">
								<select class="form-control" name="pname" id="pname_update_select">
									<option>请选择</option>
								</select>
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">城市</label>
							<div class="col-sm-4">
								<select class="form-control" name="cname" id="cname_update_select">
									<option>请选择</option>
								</select>
								<span class="help-block"></span>
							</div>
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="user_update_btn">保存</button>
				</div>
			</div>
		</div>
	</div>
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
				<button class="btn btn-primary" id="user_add_modal_btn">新增</button>
				<button class="btn btn-danger" id="user_delete_all_btn">删除</button>
			</div>
		</div>
		<!-- 表格 -->
		<div class="row">
			<div class="col-lg-12">
				<table class="table table-hover">
					<!-- 表头 -->
					<thead>
						<tr>
							<th class="col-lg-1">
							<input type="checkbox" id="check_all">
							</th>
							
							<th class="col-lg-1">id</th>
							<th class="col-lg-1">姓名</th>
							<th class="col-lg-1">性别</th>
							<th class="col-lg-1">年龄</th>
							<th class="col-lg-2">省份</th>
							<th class="col-lg-2">地区</th>
							<th class="col-lg-2">操作</th>
						</tr>
					</thead>
					<!-- 数据 -->
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 分页 -->
		<div class="row">
			<!-- 分页信息 -->
			<div class="col-md-6" id="page_info_area"></div>
			<!-- 分页条 -->
			<div class="col-md-6" id="page_nav_area"></div>
		</div>
	</div>
	<script type="text/javascript">
		//定义全局变量 
		//总页数 
		var pages;
		//当前页码 
		var page

		//1. 页面加载完成以后， 发送ajax请求，获取到分页数据

		$(function() {
			to_page(1);
		});

		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH}/users",
				data : "pn=" + pn,
				type : "get",
				success : function(result) {
					//console.log(result);
					//调用解析用户数据
					build_users_table(result);
					//解析显示分页信息 
					build_page_info(result);
					//解析分页条 
					build_page_nav(result);
				}
			});
		}
		//解析表格数据
		function build_users_table(result) {
			//清空数据
			$(".table tbody").empty();
			//取出用户数据
			var emps = result.extend.pageInfo.list;
			$.each(emps, function(index, item) {
				//alert(item.name); 
				//构建行内元素
				var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				var idTd = $("<td></td>").append(item.id);
				var nameTd = $("<td></td>").append(item.name);
				var ageTd = $("<td></td>").append(item.age);
				var sexTd = $("<td></td>").append(item.sex);
				var pnameTd = $("<td></td>").append(item.pname);
				var cnameTd = $("<td></td>").append(item.cname);
				//构建按钮 修改 删除
				/* <button class="btn btn-primary glyphicon glyphicon-pencil btn-sm">修改</button>
				<button class="btn btn-danger glyphicon glyphicon-trash btn-sm">删除</button> */
				var editBtn = $("<button></button>").addClass(
						"btn btn-primary glyphicon glyphicon-pencil btn-sm edit_btn")
						.append("修改");
				//为按钮添加自定义属性，标志id 
				editBtn.attr("edit-id",item.id);
				var delBtn = $("<button></button>").addClass(
						"btn btn-danger glyphicon glyphicon-trash btn-sm delete_btn")
						.append("删除");
				//为按钮添加自定义属性，标志id 
				delBtn.attr("del-id",item.id);
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(
						delBtn);
				$("<tr></tr>").append(checkBoxTd).append(idTd).append(nameTd).append(ageTd)
						.append(sexTd).append(pnameTd).append(cnameTd).append(
								btnTd)
						//添加到表格的 tbody 中
						.appendTo(".table tbody");

			})
		}
		//解析显示分页信息  ：当前第页，共页，合计 个用户
		function build_page_info(result) {
			//清空数据
			$("#page_info_area").empty();
			$("#page_info_area").append(
					"当前第 " + result.extend.pageInfo.pageNum + "页，共 "
							+ result.extend.pageInfo.pages + "页，合计 "
							+ result.extend.pageInfo.total + "个用户");
			pages = result.extend.pageInfo.pages;
			page = result.extend.pageInfo.pageNum;
		};
		//解析分页条 
		function build_page_nav(result) {
			$("#page_nav_area").empty();
			var nav = $("<nav></nav>");
			//构建分页条 ul
			var ul = $("<ul></ul>").addClass("pagination");

			//首页
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));

			//上一页
			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;"));

			//是否有上一页 没有的话 禁用首页 和上一页功能 
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				nextPageLi.addClass("disabled");
			} else {
				//添加首页添加单击事件
				firstPageLi.click(function() {
					to_page(1);
				});
				//添加上一页单击事件
				nextPageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum - 1);
				});
			}
			;
			//下一页
			var lastPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;"));

			//末页
			var prePageLi = $("<li></li>").append($("<a></a>").append("末页"));

			//是否有下一页 没有的话 禁用末页 和下一页功能 
			if (result.extend.pageInfo.hasNextPage == false) {
				lastPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				//为下一页添加单击事件
				lastPageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum + 1);
				});
				//为末页添加单击事件
				prePageLi.click(function() {
					to_page(result.extend.pageInfo.pages);
				});

			}

			// 按顺序向分页条ul添加元素 首页 上一页 
			ul.append(firstPageLi).append(nextPageLi);
			//遍历分页列表 12345
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (item == result.extend.pageInfo.pageNum) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					to_page(item);
				});
				//遍历添加到ul
				ul.append(numLi);
			});
			// 向分页条ul添加元素 下一页 末页
			ul.append(lastPageLi).append(prePageLi)
			//添加到 nav
			.appendTo(nav);
			$("#page_nav_area").append(nav);
		}
		//为添加按钮绑定模态框
		$("#user_add_modal_btn").click(function() {
			//表单重置 (数据+样式) 
			reset_from("#userAddModal form");
			//打开模态框
			$("#userAddModal").modal({
				//设置点击背景不关闭
				backdrop : "static"
			});
			//点击按钮的时候 发送ajax请求 获取到省份信息
			getProvince("#pname_add_select");
		});

		//表单重置方法
		function reset_from(ele){
			//清除内容 
			$(ele)[0].reset();
			//清除样式 find("*") 找$(ele)下的所有元素 
			$(ele).find("*").removeClass("has-success has-error");
			//清除文字提示
			$(ele).find(".help-block").text("");
		}
		
		//获取省份信息
		function getProvince(ele) {
			//清空 ele下的所有子节点
			//$(ele).empty();
			//移除除了第一个的元素 
			$("#pname_add_select option:not(:first)").remove();
			$("#pname_update_select option:not(:first)").remove();
			$.ajax({
				url : "${APP_PATH}/getProvinces",
				type : "get",
				success : function(result) {
					$.each(result.extend.list, function(index, item) {
						var option_P = $("<option></option>")
								.append(item.pname).attr("pid", item.pid);
						$(ele).append(option_P);
						//console.log(option_P.attr("pid"));
					});
				}
			});
		}

		//获取城市信息
		function getCity(pid,ele) {
			//清空 恢复ajax之前的状态
			//$(ele).empty();
			//移除不是第一个的元素
			$("#cname_add_select option:not(:first)").remove();
			$("#cname_update_select option:not(:first)").remove();
			$.ajax({
				url : "${APP_PATH}/getCitys",
				type : "get",
				data : "pid=" + pid,
				success : function(result) {
					$.each(result.extend.list, function(index, item) {
						var option_C = $("<option></option>").append(item.cname)
						$(ele).append(option_C);
					});
				}
			});
		}

		//添加界面 省份下拉框变化的事件
		$(".pname-add-div select").change(function() {
			//注意 pid属性在 option 标签上 
			var pid = $("#pname_add_select option:checked").attr("pid");
			//给 add 城市下拉框加数据
			getCity(pid,"#cname_add_select");
		});
		//修改界面 省份下拉框变化的事件
		$(".pname-update-div select").change(function() {
			//注意 pid属性在 option 标签上 
			var pid = $("#pname_update_select option:checked").attr("pid");
			//给 update 城市下拉框加数据
			getCity(pid,"#cname_update_select");
		});
		//添加保存按钮的 事件
		$("#user_save_btn").click(function() {
			//1.数据校验 
			if(!validate_add_from()){
				//不提交
				
				return false;
			} 
			//2.判断ajax的结果 成功才能提交
			if($("#user_save_btn").attr("ajax-va")=="error"){
				//不提交
				show_validate_msg("#name_add_input", "error", "请重新输入姓名 , 姓名要求为2-10位中文, 或6-16位英文和数字的组合, 不能有空格");
				return false;
			}
			
			$.ajax({
				url : "${APP_PATH}/user",
				type : "POST",
				data : $("#add_user_form").serialize(),
				success : function(result) {
					//JSR303校验
					if(result.code=="200"){
						console.log(result.extend.errorFields);
						//遍历错误信息   function(index,item) 中(index,item) 就是(名，值)
						/* $.each(result.extend.errorFields,function(index,item){
					        console.log(index+" : "+item);// 打印map的 名 值
						})  */
						//比较 result.extend.errorFields.email是不是存在， 存在即验证不通过
						if(undefined !=result.extend.errorFields.name){
							show_validate_msg("#name_add_input", "error", result.extend.errorFields.name);
						}
						if(undefined !=result.extend.errorFields.age){
							show_validate_msg("#age_add_input", "error", result.extend.errorFields.age);
						}
						
					} else {
						// 成功 关闭模态框
						$('#userAddModal').modal('hide');
						//来到最后一页 (最后一页+1)
						//console.log("当前最后一页是"+pages);
						to_page(pages + 1);
						//console.log(result);
					}				
				}
			})
		});
		//添加数据校验
		function validate_add_from() {
			//1.拿到数据 使用正则表达式 校验  姓名
			var userName = $("#name_add_input").val();
			//正则表达式
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,10}$)/;
			if (!regName.test(userName)) {
				show_validate_msg("#name_add_input", "error",
						"姓名要求为2-10位中文,或6-16位英文和数字的组合,不能有空格");
				return false;
			} else {
				show_validate_msg("#name_add_input", "success", "该输入可用");
			}
			//2.年龄验证 
			var userAge = $("#age_add_input").val();
			//正则表达式
			var regAge = /(^[0-9]{1,3}$)/;
			if (!regAge.test(userAge)) {
				show_validate_msg("#age_add_input", "error", "年龄要求为3位以下数字");
				return false;
			} else {
				show_validate_msg("#age_add_input", "success", "该输入可用");
			}
			//3. 省份 验证 
			var userPname = $("#pname_add_select").val();
			if (userPname == "请选择") {
				show_validate_msg("#pname_add_select", "error", "请选择省份");
				//如果省份没有选择，那么城市框不需要有提示  
				if($("#cname_add_select").val()=="请选择"){
					$("#cname_add_select").parent().removeClass("has-success has-error");
					$("#cname_add_select").next("span").text("");
				}
				return false;
			} else {
				show_validate_msg("#pname_add_select", "success", "");
			}
			//4. 城市验证 
			var userCname = $("#cname_add_select").val();
			if (userCname == "请选择") {
				show_validate_msg("#cname_add_select", "error", "请选择城市");
				return false;
			} else {
				show_validate_msg("#cname_add_select", "success", "");
			}
			//数据完整合法，可以提交
			return true;
		}
		//检验成功或失败的时候添加状态 
		function show_validate_msg(ele, status, msg) {
			//移除之前的状态 添加新的
			$(ele).parent().removeClass("has-success has-error");
			if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			} else if ("error" == status) {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			} else {
				$(ele).parent().addClass("has-warning");
				$(ele).next("span").text(msg);
			}
		}
		//添加用户页面的 name值改变事件
		$("#name_add_input").change(function(){
			var name = $("#name_add_input").val();
			$.ajax({
				url:"${APP_PATH}/checkUserName",
				type:"POST",
				data:"name="+name,
				success:function(result){
					if(result.code=="100"){
						//可用 
						show_validate_msg("#name_add_input", "success",result.extend.va_msg);
						//给按钮加事件，把姓名的ajax校验结果标志出来
						$("#user_save_btn").attr("ajax-va","success");
					}else{
						//不可用
						$("#user_save_btn").attr("ajax-va","error");
						show_validate_msg("#name_add_input", "error",result.extend.va_msg);
					}
				}
			})
		});
		//因为按钮是后来动态添加的 click事件绑不上，
		$(document).on("click",".edit_btn",function(){
			
			//表单重置 (数据+样式) 
			//reset_from("#userUpdateModal form");
			//1.点击按钮的时候 发送ajax请求 获取到省份 城市信息 
			getProvince($("#pname_update_select"));
			//2.查用户数据
			getUser($(this).attr("edit-id"));
			//3.给保存按钮加属性 值为当前用户的id
			$("#user_update_btn").attr("edit-id",$(this).attr("edit-id"));
			//4.打开模态框
			$("#userUpdateModal").modal({
				//设置点击背景不关闭
				backdrop : "static"
			});
			show_validate_msg("#pname_update_select", "has-warning", "加载中");
			show_validate_msg("#cname_update_select", "has-warning", "加载中")
			
		});
		
		//获取用户信息
		function getUser(id){
			$.ajax({
				url:"${APP_PATH}/user/"+id,
				type:"GET",
				success:function(result){
					console.log(result);
					var userData = result.extend.user;
					//数据绑定 先获取省份 
					$("#pname_update_select").val([userData.pname]);
					$("#name_update_static").val(userData.name);
					$("#userUpdateModal input[name=sex]").val([userData.sex]);
					$("#age_update_input").val(userData.age);
					var pid = $("#pname_update_select option:checked").attr("pid");
					//给  城市下拉框加数据
					getCity(pid,"#cname_update_select");
					setTimeout(function(){
						//加载城市数据延时500ms 
						$("#cname_update_select").val([userData.cname]);
						if($("#cname_update_select").val()=="请选择"){
							//console.log("1");
							$("#pname_update_select").val([userData.pname]);
							$("#cname_update_select").val([userData.cname]);
						}
						//清除加载样式 
						$("#userUpdateModal").find("*").removeClass("has-success has-error has-warning");
						//清除文字提示
						$("#userUpdateModal").find(".help-block").text("");
					},500);
				}
			});
		}
		//修改按钮的事件
		$("#user_update_btn").click(function(){
			//1.数据校验 
			if(!validate_update_from()){
				//不提交
				return false;
			} 

			$.ajax({
				url : "${APP_PATH}/user/"+$(this).attr("edit-id"),
				type : "PUT",
				//注意 必须要加 _method 属性 有下划线 
				//data : $("#update_user_form").serialize()+"&_method=PUT",
				data : $("#update_user_form").serialize(),
				success : function(result) {
					//console.log(result);
					$('#userUpdateModal').modal('hide');
					//回到当前页
					to_page(page);		
				}
			})
		})
		
		//添加数据校验
		function validate_update_from() {
			//2.年龄验证 
			var userAge = $("#age_update_input").val();
			//正则表达式
			var regAge = /(^[0-9]{1,3}$)/;
			if (!regAge.test(userAge)) {
				show_validate_msg("#age_update_input", "error", "年龄要求为3位以下数字");
				return false;
			} else {
				show_validate_msg("#age_update_input", "success", "该输入可用");
			}
			//3. 省份 验证 
			var userPname = $("#pname_update_select").val();
			if (userPname == "请选择") {
				show_validate_msg("#pname_update_select", "error", "请选择省份");
				//如果省份没有选择，那么城市框不需要有提示  
				if($("#cname_update_select").val()=="请选择"){
					$("#cname_update_select").parent().removeClass("has-success has-error");
					$("#cname_update_select").next("span").text("");
				}
				return false;
			} else {
				show_validate_msg("#pname_update_select", "success", "");
			}
			//4. 城市验证 
			var userCname = $("#cname_update_select").val();
			if (userCname == "请选择") {
				show_validate_msg("#cname_update_select", "error", "请选择城市");
				return false;
			} else {
				show_validate_msg("#cname_update_select", "success", "");
			}
			//数据完整合法，可以提交
			return true;
		}
		$(document).on("click",".delete_btn",function(){
			var id = $(this).attr("del-id");
			var name = $(this).parents("tr").find("td:eq(2)").text();
			if(confirm("确定删除用户 "+name+" 吗？")){
				$.ajax({
					url:"${APP_PATH}/user/"+id,
					type:"DELETE",
					success:function(result){
						//console.log(result);
						alert("删除成功！")
						to_page(page);
					}
				})
			}		
		})
		//全选框的事件
		$("#check_all").click(function(){
			//获取dom原生属性  用attr 获取自定义
			//alert($(this).prop("checked"));
			//使下面的选择框的 状态 和全选框保持一致
			$(".check_item").prop("checked",$(this).prop("checked"));
		})
		
		//单选框的事件
		$(document).on("click",".check_item",function(){
			//全选满的话 flag = true 给全选按钮也打上对勾 否则 不能有对勾
			var flag = $(".check_item:checked").length==$(".check_item").length;
			$("#check_all").prop("checked",flag);

		})
		//全部删除按钮的事件
		$("#user_delete_all_btn").click(function(){
			var userNames = "";
			var delIds= "";
			$.each($(".check_item:checked"),function(){
				userNames += $(this).parents("tr").find("td:eq(2)").text()+",";
				delIds += $(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			//去除最后一个“，”  - 
			userNames = userNames.substring(0, userNames.length-1);
			delIds = delIds.substring(0, delIds.length-1);
			if(confirm("确定删除 "+userNames+" 这些用户吗？")){
				 $.ajax({
					url:"${APP_PATH}/user/"+delIds,
					type:"DELETE",
					success:function(result){
						//console.log(result);
						alert("删除成功！")
						to_page(page);
					}
				})
			}
		})
			
	</script>
</body>

</html>

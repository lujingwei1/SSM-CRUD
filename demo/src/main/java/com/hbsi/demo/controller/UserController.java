package com.hbsi.demo.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.validation.Valid;

import org.junit.runners.Parameterized.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hbsi.demo.bean.Msg;
import com.hbsi.demo.bean.User;
import com.hbsi.demo.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	// @PathVariable 从URL中获取参数
	// @RequestParam 从参数列表中获取

	/**
	 * 删除用户 批量  + 单个整合
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/user/{ids}", method = RequestMethod.DELETE)
	public Msg deleteUser(@PathVariable("ids") String ids) {
		// 参数中如果包含 ‘ -’ 说明是批量删除 否则不是
		if (ids.contains("-")) {
			// 获取分割后的的id
			String[] str_ids = ids.split("-");
			//准备一个ArrayList 存放要删除的id
			List<Integer> del_ids = new ArrayList<Integer>();
			for (int i = 0; i < str_ids.length; i++) {
				System.out.println(i+"id"+str_ids[i]);
				//给list中添加 前端传过来的id
				del_ids.add(Integer.parseInt(str_ids[i]));
			}
			
			userService.deleteBatch(del_ids);
		} else {
			// 把String 转为Integer
			userService.deleteUser(Integer.parseInt(ids));
		}

		return Msg.success();
	}

	/**
	 * 修改用户
	 * 
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/user/{id}", method = RequestMethod.PUT)
	public Msg saveUser(User user) {
		System.out.println(user);
		userService.updateUser(user);
		return Msg.success();
	}

	@ResponseBody
	@RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
	public Msg getUser(@PathVariable("id") Integer id) {

		User user = userService.getUser(id);
		return Msg.success().add("user", user);

	}

	/**
	 * 判断用户名是否可用
	 * 
	 * @param name
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/checkUserName", method = RequestMethod.POST)
	public Msg checkUserName(@RequestParam("name") String name) {

		String regName = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,10}$)";
		// 正则判断 不符合就返回
		if (!name.matches(regName)) {
			return Msg.error().add("va_msg", "姓名要求为2-10位中文,或6-16位英文和数字的组合,不能有空格");
		}
		Boolean flag = userService.checkUserName(name);
		if (flag) {
			return Msg.success().add("va_msg", "该输入可用");
		} else {
			return Msg.error().add("va_msg", "姓名已存在");
		}

	}

	/**
	 * 添加用户
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public Msg saveUser(@Valid User user, BindingResult result) {
		// 如果有校验失败的数据
		if (result.hasErrors()) {
			// 校验失败 取到所有的失败数据 遍历 封装到map中 返回前台
			Map<String, Object> map = new HashMap<String, Object>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.err.println("错误字段名： " + fieldError.getField());
				System.err.println("错误信息： " + fieldError.getDefaultMessage());
				// (错误字段名,错误信息)
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.error().add("errorFields", map);
		} else {
			userService.saveUser(user);
			System.out.println(user);
			return Msg.success();
		}

	}

	/**
	 * 查询用户数据 分页
	 * 
	 * @param pn
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/users")
	public Msg getUSerWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		// 引入了分页插件，只需要在查询之前调用
		// 传入页码和每页数据数
		PageHelper.startPage(pn, 5);
		// startPage后紧跟的查询就是分页查询
		List<User> users = userService.getAll();
		// 使用pageInfo包装查询后的数据
		// pageInfo封装了详细的分页数据，包括查询到的数据，
		// new PageInfo(users,5); 参数 （查询到的数据，连续显示的页数）
		PageInfo page = new PageInfo(users, 5);

		return Msg.success().add("pageInfo", page);
	}

	@RequestMapping("/list_ajax")
	public String list() {
		return "list_ajax";
	}

	/**
	 * 分页 查询用户数据
	 * 
	 * @return
	 */
	// @RequestMapping("/users")
	// 对控制器Controller 下的有RequestMapping 注解的进行映射
	public String getUsers(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		// 引入了分页插件，只需要在查询之前调用
		// 传入页码和每页数据数
		PageHelper.startPage(pn, 5);
		// startPage后紧跟的查询就是分页查询
		List<User> users = userService.getAll();
		// 使用pageInfo包装查询后的数据
		// pageInfo封装了详细的分页数据，包括查询到的数据，
		// new PageInfo(users,5); 参数 （查询到的数据，连续显示的页数）
		PageInfo page = new PageInfo(users, 5);
		model.addAttribute("pageInfo", page);

		return "index";
	}

}

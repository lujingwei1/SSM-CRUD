package com.hbsi.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hbsi.demo.bean.User;
import com.hbsi.demo.bean.UserExample;
import com.hbsi.demo.bean.UserExample.Criteria;
import com.hbsi.demo.dao.UserMapper;

@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;

	public void saveUser(User user) {
		userMapper.insertSelective(user);

	}

	/**
	 * 查询所有员工
	 * 
	 * @return
	 */
	public List<User> getAll() {
		List<User> users = userMapper.selectByExample(null);
		return users;

	}

	public User getUser(int id) {
		User user = userMapper.selectByPrimaryKey(id);
		return user;
	}

	/**
	 * 通过name查用户，
	 * @param name
	 */
	public boolean checkUserName(String name) {
		UserExample example = new UserExample();
		//构造条件
		Criteria criteria = example.createCriteria();
		criteria.andNameEqualTo(name);
		System.out.println(name);
		long count = userMapper.countByExample(example);
		System.out.println("找出来了"+count+"条数据");
		//等于0 说明没数据， 用户名可用
		return count ==0;
	}

	/**
	 * 修改员工
	 * @param user
	 */
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		//按照主键有选择的更新
		userMapper.updateByPrimaryKeySelective(user);
	}

	/**
	 * 删除员工
	 * @param id
	 */
	public void deleteUser(Integer id) {
		// TODO Auto-generated method stub
		userMapper.deleteByPrimaryKey(id);
	}

	public void deleteBatch(List<Integer> ids) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		//id 在这个集合里面 
		criteria.andIdIn(ids);
		// TODO Auto-generated method stub
		userMapper.deleteByExample(example);
	}

}

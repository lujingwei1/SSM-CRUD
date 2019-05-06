package com.hbsi.demo.test;


import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hbsi.demo.bean.User;
import com.hbsi.demo.dao.UserMapper;

/**
 * 1. 导入springTest模块 
 * 2. 使用ContextConfiguration注解
 * 3. 直接	@Autowired
 * @author HASEE
 *
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring/spring-mybatis.xml"})
public class TestDemo {
	@Autowired
	UserMapper userMapper;
	@Autowired
	SqlSession SqlSession;
	
	@Test
	public void testUser(){
		//System.out.println(userMapper.selectByPrimaryKey(1).toString());
		
		//批量插入员工数据
		//使用可以批量执行的sqlSession
		UserMapper userMapper = SqlSession.getMapper(UserMapper.class);
		for (int i = 0; i < 50; i++) {
			String name = UUID.randomUUID().toString().substring(0, 6);
			userMapper.insertSelective(new User(null, name, "22", "男", "无", "河北", "保定"));
		}
	}
	
	


}

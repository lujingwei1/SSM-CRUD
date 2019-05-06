package com.hbsi.demo.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.hbsi.demo.bean.User;

/**
 * 娴ｈ法鏁pring閹绘劒绶甸惃鍕ゴ鐠囨洝顕Ч鍌氬閼筹拷
 * 
 * @author HASEE
 *
 */

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/spring-mybatis.xml", "classpath:spring/spring-mvc.xml" })
public class MVCTest {

	@Autowired
	WebApplicationContext context;

	MockMvc mockMvc;

	@Before
	public void initMockMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}

	@Test
	public void testPage() throws Exception {

		MvcResult result;
		result = mockMvc.perform(MockMvcRequestBuilders.get("/users").param("pn", "10")).andReturn();
		MockHttpServletRequest request = result.getRequest();
		PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
		System.out.println(pageInfo.getPageNum());
		System.out.println(pageInfo.getPages());
		System.out.println(pageInfo.getTotal());
		System.out.println(pageInfo.getStartRow());
		System.out.println(pageInfo.getEndRow());
		System.out.println(pageInfo.isHasPreviousPage());
		System.out.println(pageInfo.isHasNextPage());
		int[] nums = pageInfo.getNavigatepageNums();
		for (int i = 0; i < nums.length; i++) {
			System.out.println(" " + i);

		}

		List<User> list = pageInfo.getList();
		for (User user : list) {
			System.out.println(user);
		}

	}

}

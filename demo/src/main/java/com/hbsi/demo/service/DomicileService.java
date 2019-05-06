package com.hbsi.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hbsi.demo.bean.City;
import com.hbsi.demo.bean.CityExample;
import com.hbsi.demo.bean.Province;
import com.hbsi.demo.dao.CityMapper;
import com.hbsi.demo.dao.ProvinceMapper;

/**
 * 获取省份 城市
 * 
 * @author HASEE
 *
 */
@Service
public class DomicileService {

	@Autowired
	private ProvinceMapper provinceMapper;
	@Autowired
	private CityMapper cityMapper;

	/**
	 * 获取省份列表
	 * 
	 * @return
	 */
	public List<Province> getProvinces() {
		return provinceMapper.selectByExample(null);
	}

	/**
	 * 根据省份查城市列表
	 * 
	 * @param id
	 * @return
	 */
	public List<City> getCitys(Integer id) {
		CityExample example = new CityExample();
		CityExample.Criteria criteria = example.createCriteria();
		criteria.andPidEqualTo(id);
		return cityMapper.selectByExample(example);
	}

}

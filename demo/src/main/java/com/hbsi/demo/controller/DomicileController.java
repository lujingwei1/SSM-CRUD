package com.hbsi.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hbsi.demo.bean.City;
import com.hbsi.demo.bean.Msg;
import com.hbsi.demo.bean.Province;
import com.hbsi.demo.service.DomicileService;

@Controller
public class DomicileController {

	@Autowired
	private DomicileService domicileService;

	@ResponseBody
	@RequestMapping("/getProvinces")
	public Msg getProvinces() {
		List<Province> list = domicileService.getProvinces();
		return Msg.success().add("list", list);

	}

	@ResponseBody
	@RequestMapping(value="/getCitys",method=RequestMethod.GET )
	public  Msg getCitys(@RequestParam(value = "pid")Integer pid) {
		List<City> list = domicileService.getCitys(pid);
		return Msg.success().add("list", list);
	}

}

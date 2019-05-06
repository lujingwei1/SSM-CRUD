package com.hbsi.demo.dao;

import com.hbsi.demo.bean.City;
import com.hbsi.demo.bean.CityExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CityMapper {
    long countByExample(CityExample example);

    int deleteByExample(CityExample example);

    int deleteByPrimaryKey(Integer cid);

    int insert(City record);

    int insertSelective(City record);

    List<City> selectByExample(CityExample example);

    City selectByPrimaryKey(Integer cid);

    int updateByExampleSelective(@Param("record") City record, @Param("example") CityExample example);

    int updateByExample(@Param("record") City record, @Param("example") CityExample example);

    int updateByPrimaryKeySelective(City record);

    int updateByPrimaryKey(City record);
}
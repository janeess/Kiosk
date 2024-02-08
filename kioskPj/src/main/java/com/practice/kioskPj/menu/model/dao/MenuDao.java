package com.practice.kioskPj.menu.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.practice.kioskPj.menu.model.vo.Menu;

@Repository
public class MenuDao {

	
	//메뉴 리스트 불러오기
	public ArrayList<Menu> selectListMenu(SqlSessionTemplate sqlSession, int shopNum) {
		return (ArrayList) sqlSession.selectList("menuMapper.selectListMenu", shopNum);
	}

}

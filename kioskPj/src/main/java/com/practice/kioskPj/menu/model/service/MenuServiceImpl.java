package com.practice.kioskPj.menu.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.practice.kioskPj.menu.model.dao.MenuDao;
import com.practice.kioskPj.menu.model.vo.Menu;

@Service
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private MenuDao menuDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//메뉴 리스트 불러오기
	@Override
	public ArrayList<Menu> selectListMenu(int shopNum) {
		return menuDao.selectListMenu(sqlSession, shopNum);
	}
	

}

package com.practice.kioskPj.menu.model.service;

import java.util.ArrayList;

import com.practice.kioskPj.menu.model.vo.Menu;

public interface MenuService {

	//메뉴 리스트 불러오기
	ArrayList<Menu> selectListMenu(int shopNum);




}

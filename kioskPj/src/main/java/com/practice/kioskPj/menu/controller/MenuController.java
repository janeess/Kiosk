package com.practice.kioskPj.menu.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.practice.kioskPj.menu.model.service.MenuService;
import com.practice.kioskPj.menu.model.vo.Menu;
import com.practice.kioskPj.shop.model.service.ShopService;
import com.practice.kioskPj.shop.model.vo.Shop;

@Controller
public class MenuController {
	
	   @Autowired
	   private MenuService menuService;
	   
		@Autowired
		private ShopService shopService;
	
	  //메뉴 리스트 불러오기
	  @RequestMapping("getMenuList.do") public ModelAndView
	  menuList(@RequestParam(value = "shopNum", defaultValue = "2") int shopNum) {
	  ModelAndView mv = new ModelAndView();
	  
	  // 상점 리스트 가져오기 
	  ArrayList<Shop> sList = shopService.selectListShop();
	  
	  // 선택된 상점 번호에 해당하는 메뉴 리스트 가져오기 
	  ArrayList<Menu> menus =menuService.selectListMenu(shopNum);
	  
	  // ModelAndView 객체에 상점 리스트와 메뉴 리스트 추가 
	  mv.addObject("sList", sList);
	  mv.addObject("menus", menus);
	 
	  mv.setViewName("shop/menuList");
	  
	  return mv; }
	



	
	
	
	
	
	
	
	
}

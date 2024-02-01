package com.practice.kioskPj.shop.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.practice.kioskPj.common.PageInfo;
import com.practice.kioskPj.shop.model.dao.ShopDao;
import com.practice.kioskPj.shop.model.vo.Shop;

@Service
public class ShopServiceImpl implements ShopService {
	
	@Autowired
	private ShopDao shopDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// 가게 리스트 뽑아주기
	@Override
	public ArrayList<Shop> selectListShop() {
		return shopDao.selectListShop(sqlSession);
	}

	//로그인 서비스
	@Override
	public Shop loginMember(String shopId) {
		return shopDao.loginMember(sqlSession, shopId);
	}

	//로그인 유저
	@Override
	public Shop loginUser(Shop s) {
		return shopDao.loginUser(sqlSession, s);
	}

	// 회원정보 리스트 불러오기
	@Override
	public Shop selectMyPage(String shopId) {
		return shopDao.selectMyPage(sqlSession,shopId);
	}

	//회원정보 수정
	@Override
	public int updateShop(Shop s) {
		return shopDao.updateShop(sqlSession,s);
	}

	// 전체 상점 개수
	@Override
	public int selectListCount() {
		return shopDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Shop> selectAllShopList(PageInfo pi) {
		return shopDao.selectAllShopList(sqlSession, pi);
	}

	// 유저 상태변경
	@Override
	public int changeUserStatus(Shop s) {
		return shopDao.changeUserStatus(sqlSession, s);
	}
	
	


}

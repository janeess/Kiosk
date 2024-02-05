package com.practice.kioskPj.shop.model.service;

import java.util.ArrayList;

import com.practice.kioskPj.common.PageInfo;
import com.practice.kioskPj.shop.model.vo.Shop;

public interface ShopService {
	
	//가게 리스트 뽑아주기
	ArrayList<Shop> selectListShop();
	
	//로그인 서비스
	Shop loginMember(String shopId);
	
	//로그인 유저
	Shop loginUser(Shop s);

	// 회원정보 리스트 불러오기
	Shop selectMyPage(String shopId);

	//회원 정보 수정
	int updateShop(Shop s);

	// 전체 상점 개수
	int selectListCount();
	ArrayList<Shop> selectAllShopList(PageInfo pi);

	// 유저 상태변경
	int changeUserStatus(Shop s);

	// 업체 등록
	int enrollShop(Shop s);

	// 아이디 중복체크
	int checkDupId(String checkId);
	
	// 업체명 중복체크
	int checkDupName(String checkName);
	
	// 업체 삭제
	int deleteShop(String shopId);

	// 비밀번호 초기화 이메일 체크
	Shop selectShopEmail(String chkEmail);

	// 비밀번호 초기화 후 재설정
	int resetPwdNew(Shop vo);


	

	

}

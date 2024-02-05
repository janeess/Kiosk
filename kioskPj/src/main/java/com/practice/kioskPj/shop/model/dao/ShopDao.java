package com.practice.kioskPj.shop.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.practice.kioskPj.common.PageInfo;
import com.practice.kioskPj.shop.model.vo.Shop;


@Repository
public class ShopDao {
	
	// 가게 리스트 뽑아주기
	public ArrayList<Shop> selectListShop(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("shopMapper.selectListShop");
	}

	//로그인 서비스
	public Shop loginMember(SqlSessionTemplate sqlSession, String shopId) {
		return sqlSession.selectOne("shopMapper.loginMember", shopId);
	}

	// 로그인시 아이디와 비밀번호 확인
	public Shop loginUser(SqlSessionTemplate sqlSession, Shop s) {
		return sqlSession.selectOne("shopMapper.loginUser", s);
	}

	// 회원정보 리스트 불러오기
	public Shop selectMyPage(SqlSessionTemplate sqlSession, String shopId) {
		return sqlSession.selectOne("shopMapper.selectMyPage", shopId);
	}
	
	//회원정보 수정
	public int updateShop(SqlSessionTemplate sqlSession, Shop s) {
		return sqlSession.update("shopMapper.updateShop",s);
	}

	// 전체 상점 개수
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("shopMapper.selectListShopCount");
	}

	public ArrayList<Shop> selectAllShopList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("shopMapper.selectAllShopList", null, rowBounds);
	}

	//회원 수정
	public int changeUserStatus(SqlSessionTemplate sqlSession, Shop s) {
		return sqlSession.update("shopMapper.changeUserStatus",s);
	}

	// 업체 등록
	public int enrollShop(SqlSessionTemplate sqlSession, Shop s) {
		return sqlSession.insert("shopMapper.enrollShop",s);
	}

	// 아이디 중복체크
	public int checkDupId(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("shopMapper.checkDupId", checkId);
	}
	
	// 업체명 중복체크
	public int checkDupName(SqlSessionTemplate sqlSession, String checkName) {
		return sqlSession.selectOne("shopMapper.checkName", checkName);
	}
		
	// 업체 삭제
	public int deleteShop(SqlSessionTemplate sqlSession, String shopId) {
		return sqlSession.delete("shopMapper.deleteShop", shopId);
	}

	//비밀번호 초기화 이메일 체크
	public Shop selectShopEmail(SqlSessionTemplate sqlSession, String chkEmail) {
		return sqlSession.selectOne("shopMapper.selectShopEmail", chkEmail);
	}

	// 비밀번호 초기화 후 재설정
	public int resetPwdNew(SqlSessionTemplate sqlSession, Shop vo) {
		return sqlSession.update("shopMapper.resetPwdNew", vo);
	}









}

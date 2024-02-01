package com.practice.kioskPj.shop.controller;

import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.practice.kioskPj.common.PageInfo;
import com.practice.kioskPj.common.Pagination;
import com.practice.kioskPj.shop.model.service.ShopService;
import com.practice.kioskPj.shop.model.vo.Shop;


@Controller
public class ShopController {
	
	@Autowired
	private ShopService shopService;
	
	// 로그인 폼으로 이동
	@RequestMapping("loginForm.sh")
	public String enrollForm() {
		return "admin/login";
	}
	
	// 마이페이지 이동
	@RequestMapping("myPageForm.sh")
	public String myPageForm() {
		return "admin/myPageForm";
	}
	
	// 회원정보 수정 페이지 이동
	@RequestMapping("updateShopForm.sh")
	public String updateMemberForm() {
		return "admin/updateShopForm";
	}
	
	

	// 가게 리스트 뽑아주기
	@RequestMapping("sList.do")
	public String selectListShop(Model model) {
	    
		ArrayList<Shop> sList = shopService.selectListShop();
	    
	    model.addAttribute("sList", sList);

	    return "shop/shopList";
	}
     
	
	
	// 로그인
	@PostMapping("login.sh")
	public String loginMember(Shop s, HttpSession session, ModelAndView mv, HttpServletRequest request) {
		
		// 입력 값 로깅
//	    System.out.println("로그인 시도: ID = " + s.getShopId() + ", Password = " + s.getShopPwd());
//	    
//	    if (s.getShopId() == null || s.getShopId().isEmpty() || s.getShopPwd() == null || s.getShopPwd().isEmpty()) {
//	        System.out.println("로그인 실패: 입력 값 누락");
//	        session.setAttribute("alertMsg", "로그인 실패: 필요한 정보가 누락되었습니다.");
//	        return "common/errorPage";
//	    }

		Shop loginUser = shopService.loginMember(s.getShopId());
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			return "redirect:/";
		}else {
			mv.addObject("errorMsg","로그인 실패");
			session.setAttribute("alertMsg", "로그인 실패.");
			return "common/errorPage";
		}
	}
	
	// 회원정보 리스트 불러오기
	@RequestMapping("myPage.sh")
	public ModelAndView myPageShop(String shopId, ModelAndView mv) {
		
		Shop s = shopService.selectMyPage(shopId);
//		System.out.println("Received shopId: " + shopId);
		
        // 계약 기간 종료 날짜
        Calendar cal = Calendar.getInstance();
        cal.setTime(s.getContractPeriod());
        cal.add(Calendar.YEAR, 1); // 1년 추가
        
        // mv에 추가
        mv.addObject("s", s).setViewName("admin/myPage");;
        mv.addObject("contractPeriodEnd", cal.getTime()); // 종료 날짜
		
		return mv;
	}
	
	
	// 로그아웃
	@RequestMapping("logout.sh")
	public String logoutMember(HttpSession session) {

		session.removeAttribute("loginUser");
		session.setAttribute("alertMsg", "로그아웃 되었습니다.");
		return "redirect:/";
	}
	
	// 회원 정보수정
	@RequestMapping("update.sh")
	public String updateShop(Shop s, HttpSession session, ModelAndView mv) {
		
		int result = shopService.updateShop(s);
		
		
		if (result > 0) {
			
			Shop updateShop = shopService.loginMember(s.getShopId());
			
	        // 계약 기간 종료 날짜
	        Calendar cal = Calendar.getInstance();
	        cal.setTime(s.getContractPeriod());
	        cal.add(Calendar.YEAR, 1); // 1년 추가
			
			session.setAttribute("contractPeriodEnd", cal.getTime());
			session.setAttribute("loginUser", updateShop);
			return "redirect:/myPageForm.sh";

		} else {
			return "common/errorPage";
		}
		
	}
	
	// 관리자 회원 리스트
	@RequestMapping("manageAllShopsForm")
	public String shopListForm(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {

		// 전체 상점 개수
		int listCount = shopService.selectListCount();
		int pageLimit = 10;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageinfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Shop> sList = shopService.selectAllShopList(pi);

		model.addAttribute("sList", sList);
		model.addAttribute("pi", pi);

		return "admin/manageAllShops";
	}
	
	// 회원 상태 변경
	@RequestMapping("changeStatus")
	@ResponseBody
	public String changeUserStatus(Shop s) {
	    try {
	        // 상태 변경 로직
	        int result = shopService.changeUserStatus(s);

	        // 변경 결과에 따라 응답 반환
	        if (result > 0) { // 성공적으로 업데이트된 경우
	            return "success";
	        } else { // 업데이트가 되지 않은 경우
	            return "no changes";
	        }
	    } catch (Exception e) {
	        // 예외 발생 시
	        e.printStackTrace();
	        return "error";
	    }
	}


}

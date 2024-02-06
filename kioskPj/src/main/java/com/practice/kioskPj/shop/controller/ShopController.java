package com.practice.kioskPj.shop.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	
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
	
	// 업체 등록 페이지 이동
	@RequestMapping("enrollShopForm.sh")
	public String enrollShopForm() {
		return "admin/enrollShopForm";
	}
	
	// 비밀번호 초기화 페이지로 이동
	@RequestMapping("resetPwdForm.sh")
	public String resetPwdView() {
		return "shop/resetPwdForm";
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
        mv.addObject("s", s).setViewName("admin/myPage");
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
	
	
	// 업체 등록
	@RequestMapping("enrollShop.sh")
	public ModelAndView enrollShop(Shop s, ModelAndView mv, HttpSession session) {
		
		int result = shopService.enrollShop(s);
		
		if(result > 0) {
			Shop loginUser = shopService.loginMember(s.getShopId());
			mv.setViewName("redirect:/manageAllShopsForm");
		}else {
			mv.setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	

	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping("checkDupId.sh")
	public String checkDupId(String checkId) {
		
		int count = shopService.checkDupId(checkId);

		String str = "";

		if (count > 0) {
			str = "NNNNN";
		} else {
			str = "NNNNY";
		}

		return str;
	}
	
	// 업체명 중복 체크
	@ResponseBody
	@RequestMapping("checkDupName.sh")
	public String checkDupName(String checkName) {
		
		int count = shopService.checkDupName(checkName);

		String str = "";

		if (count > 0) {
			str = "NNNNN";
		} else {
			str = "NNNNY";
		}

		return str;
	}
	
	// 업체 삭제
	@RequestMapping("delete.sh")
	public ModelAndView deleteShop(String shopId, HttpSession session, ModelAndView mv) {
		
		int result = shopService.deleteShop(shopId);
		
		
		if(result>0) {
			mv.setViewName("redirect:/");
		}else {
			mv.addObject("errorMsg", "삭제 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	

	// 업체 - 비밀번호 초기화 (메일 api)
	@RequestMapping("resetPwd.sh")
	public ModelAndView resetShopPwd(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {

		ModelAndView mv = new ModelAndView();
		String chkEmail = (String) request.getParameter("chkEmail");
		String name = (String) request.getParameter("shopName"); 

		session.setAttribute("chkEmail", chkEmail);

		// 비밀번호 초기화 이메일 체크
		Shop vo = shopService.selectShopEmail(chkEmail);
		

		if (vo != null && vo.getShopEmail().equals(chkEmail)) {
			if (vo.getShopName().equals(name)) { // 이메일과 이름이 모두 일치하는 경우 비밀번호 초기화
				
				Random r = new Random();
				int num = r.nextInt(999999); // 인증번호용 랜덤난수설정
				
				session.setAttribute("email", vo.getShopEmail());

				String setfrom = "hejin28739@gmail.com";
				String tomail = chkEmail; // 받는사람
				String title = "[FastKiosk] 비밀번호변경 인증 이메일 입니다";
				String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
						+ "FastKiosk 비밀번호 초기화 인증번호는 '" + num + "'입니다." + System.getProperty("line.separator"); //

				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

					messageHelper.setFrom(setfrom);
					messageHelper.setTo(tomail);
					messageHelper.setSubject(title);
					messageHelper.setText(content);

					mailSender.send(message);
				} catch (Exception e) {
					e.printStackTrace();
				}

				mv.setViewName("shop/resetPwdEmail");
				mv.addObject("num", num);
			} else {  // 업체명이 일치하지 않는 경우
				mv.addObject("alertMsg", "입력하신 정보가 일치하지 않습니다.");
				mv.setViewName("shop/resetPwdForm");
			}
		} else { // 이메일이 일치하지 않는 경우
			mv.addObject("errorMsg", "입력하신 이메일이 존재하지 않습니다.");
			mv.setViewName("shop/resetPwdForm");
		}
		
		return mv;

	}

	// 업체 -비밀번호 이메일 인증번호 확인
	@RequestMapping(value = "/resetPwdEmail.sh", method = RequestMethod.POST)
	public String resetPwdEmail(@RequestParam(value = "emailAuthNum") String emailAuthNum, @RequestParam(value = "num") String num, 
			HttpSession session) throws IOException {

		if (emailAuthNum.equals(num)) {
			session.removeAttribute("num");
			session.setAttribute("alertMsg", "비밀번호 인증이 완료되었습니다.");
			return "shop/resetPwdNew";
		} else {
			session.setAttribute("errorMsg", "인증번호가 일치하지 않습니다.");
			return "shop/resetPwdForm";
		}
	}


	// 업체 - 비밀번호 업데이트
	@RequestMapping(value = "/resetPwdNew.sh", method = RequestMethod.POST)
	public String resetPwdNew(HttpSession session, String newPwd) throws IOException {

		Shop vo = new Shop();
		vo.setShopPwd(newPwd);

		String chkEmail = (String) session.getAttribute("chkEmail");
		vo.setShopEmail(chkEmail);

		int result = shopService.resetPwdNew(vo);

		if (result == 1) {
	        session.removeAttribute("chkEmail");
	        session.removeAttribute("loginUser");
	        session.setAttribute("alertMsg", "비밀번호 변경이 완료되었습니다.");
	        return "redirect:/loginForm.sh";
		} else {
			session.setAttribute("errorMsg", "비밀번호 변경이 실패하였습니다.");
			return "shop/resetPwdNew";
		}
	}

	
	// 관리자 - 비밀번호 초기화(초기화 비밀번호 설정)
	@RequestMapping("resetPassword.ad")
	public ResponseEntity<String> resetPassword(@RequestParam("shopId") String shopId) {
	    try {
	        
	    	// 비밀번호 초기화 처리
	    	String resetDefaultPwd = "qwerty!!!22";
	    	
	        int result = shopService.resetPassword(shopId, resetDefaultPwd);
	        
	        if (result > 0) {
	            return ResponseEntity.ok("비밀번호가 'qwerty!!!22'로 초기화되었습니다.");
	        } else {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("비밀번호 초기화 실패");
	        }
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("서버 오류 발생");
	    }
	}

	
	

}

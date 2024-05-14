package controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Cart;
import model.Member;
import service.CartMybatisDao;
import service.MemberMybatisDao;

@Controller
@RequestMapping("/cart/")
public class CartController {

	@Autowired
	CartMybatisDao cd;

	HttpServletRequest request;
	Model m;
	HttpSession session;

	@ModelAttribute
	void init(HttpServletRequest request, Model m) {
		this.request = request;
		this.m = m;
		this.session = request.getSession();
	}

	@RequestMapping("cartList")
	public String cartList() throws Exception {
		String userId = (String) session.getAttribute("id");

		List<Cart> list = cd.cartList(userId);

		m.addAttribute("list", list);
		return "/cart/cartList";
	}

	@RequestMapping("orderList")
	public String orderList() throws Exception {

		String userId = (String) session.getAttribute("id");

		List<Cart> list = cd.orderList(userId);
		Member mb = cd.selectOne(userId);
		
		if(list.isEmpty()) {
			String msg = "장바구니에서 상품을 추가해주세요";
			String url = "/cart/cartList";
			m.addAttribute("msg", msg);
			m.addAttribute("url", url);
			return "alert";
		}
		
		m.addAttribute("list", list);
		m.addAttribute("mb", mb);

		return "/cart/orderList";
	}

	@RequestMapping("cartDelete")
	public String basketDelete(String[] did) throws Exception {
		String userId = (String) session.getAttribute("id");

		String msg = "선택하신 상품을 삭제하였습니다.";
		String url = "/cart/cartList";

		if (did == null) {
			msg = "삭제할 상품을 선택해 주세요";
			m.addAttribute("msg", msg);
			m.addAttribute("url", url);

			return "alert";
		} else {
			cd.cartDelete(userId, did);

		}
		String referer = request.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.

//		return "redirect:" + referer; // 이전 페이지로 리다이렉
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert";
	}

	@RequestMapping("cartPro")
	public String cartPro(Cart cart) throws Exception {
		String userId = (String) session.getAttribute("id");

		cart.setDid(userId);
		// 결제하려는 수량이 0이면 다른 List로 일단 돌려보내기
		if (cart.getDqty() == 0) {
			return "redirect:/cart/cartList";
		}

		Cart cartChk = cd.cartOne(cart);
		if (cartChk != null) {
			String msg = "장바구니에 같은 제품이 있습니다. 확인해 주세요";
			String url = "/cart/cartList";

			session.setAttribute("msg", msg);
			session.setAttribute("url", url);

			return "alert";
		} else {
			cart.setDpay("0");
			int num = cd.cartInsert(cart);
		}
		return "redirect:/cart/cartList";
	}

	@RequestMapping("cartPro1")
	public String cartPro1(Cart cart) throws Exception {
		String userId = (String) session.getAttribute("id");
		cart.setDid(userId);
		// 결제하려는 수량이 0이면 다른 List로 일단 돌려보내기
		if (cart.getDqty() == 0) {
			return "redirect:/cart/cartList";
		}

		Cart cartChk = cd.cartOne(cart);
		if (cartChk != null) {
			String msg = "장바구니에 같은 제품이 있습니다. 확인해 주세요";
			String url = "/cart/cartList";

			session.setAttribute("msg", msg);
			session.setAttribute("url", url);

			return "alert";
		} else {
			cart.setDpay("1");
			int num = cd.cartInsert(cart);
		}
		return "redirect:/cart/orderList";
	}

// 장바구니 결제버튼 클릭 
	@RequestMapping("cartUpdatePro")
	public String cartUpdatePro(String[] did, String[] dqty, String[] dtotal, String dpay) throws Exception {
// id는 체크된 값만 들어온다. dqty, dtotal 2개의 "" 값 제거 필요	
		ArrayList<String> dqtyArrList = new ArrayList<>();
		ArrayList<String> dtotalArrList = new ArrayList<>();
		String userId = (String) session.getAttribute("id");

//		 dqty 값 중 ""값이 아닌 값들 dqtyArrList에 추가
		String msg = "";
		String url = "/cart/cartList";

		if (did == null) {
			msg = "결제 할 상품의 선택해주세요";
			m.addAttribute("msg", msg);
			m.addAttribute("url", url);

			return "alert";
		} else {

			if (dpay.equals("0")) {

				for (String string : dqty) {
					if (string != "") {
						dqtyArrList.add(string);
					}
				}

				for (String string : dtotal) {
					if (string != "") {
						dtotalArrList.add(string);
					}
				}

				for (String string : dqty) {
					if ( string.startsWith("0")) {
			               System.out.println("dqty else: " + dqty);
			               msg = "각각의 제품을 1개 이상 선택해주세요";
			               url = "/cart/cartList";
			               m.addAttribute("msg", msg);
			               m.addAttribute("url", url);
			               return "alert";
			            }
					if (string != null) {
						dtotalArrList.add(string);
					}
				}

				cd.cartUpdate1(userId, did, dqtyArrList, dtotalArrList);
			}
			
		}

		return "redirect:/cart/orderList";

	}

	@RequestMapping("cancleOrder")
	public String cancleOrder(String[] dnum) throws Exception {

		String msg = "";
		String url = "";
		msg = " 품목 삭제를 실패 하였습니다.";
		url = "/cart/cartList";

		String userId = (String) session.getAttribute("id");

		if (dnum != null) {
			int confirm = cd.cancleOrder(userId, dnum);
			if (confirm > 0) {
				msg = "결제가 취소되었습니다";
				url = "/cart/cartList";
			} else {
				msg = " 상품 삭제를 실패 하였습니다.";
				url = "/cart/cartList";
			}
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert";

	}

}
package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Cart;
import model.Member;
import model.Order;
import service.OrderMybatisDao;

@Controller
@RequestMapping("/order/")
public class OrderController {

	@Autowired
	OrderMybatisDao cd;

	HttpServletRequest request;
	Model m;
	HttpSession session;

	@ModelAttribute
	void init(HttpServletRequest request, Model m) {
		this.request = request;
		this.m = m;
		this.session = request.getSession();
	}

	// date 타입 http에서 받을 수 있게 하는 코드
	/*
	 * @InitBinder protected void initBinder(WebDataBinder binder) {
	 * CustomDateEditor dateEditor=new CustomDateEditor(new
	 * SimpleDateFormat("yyyyMMdd"), true); binder.registerCustomEditor(Date.class,
	 * dateEditor); }
	 * 
	 */

	@RequestMapping("myOrderListInfo")
	public String myOrderListInfo() throws Exception {
		String userId = (String) session.getAttribute("id");
		List<Object> list = cd.myOrderListInfo(userId);
		m.addAttribute("list", list);
		return "/order/myOrderListInfo";
	}

	@RequestMapping("myOrderDetailList")
	public String myOrderDetailList(Order order, String orderId) throws Exception {
		String userId = (String) session.getAttribute("id");
		List<Order> list = cd.myOrderDetailList(userId, orderId);
		m.addAttribute("list", list);
		return "/order/myOrderDetailList";
	}

	@RequestMapping("payment")
	public String payment(Order order, String[] dnum, String[] dname, String[] dqty, String[] dprice, String[] dtotal)
			throws Exception {
		String msg = "";
		String url = "";
		String userId = (String) session.getAttribute("id");
		if (dnum == null) {
			url = "/cart/cartList";
			msg = "제품이 없습니다";
			m.addAttribute("msg", msg);
			m.addAttribute("url", url);
			return "alert";
		}
		cd.selectOrderId();

		cd.orderInsert(dnum, dname, dqty, dprice, dtotal, order, userId);
		cd.modifyDqty(userId, dnum, dqty);

		int confirm = cd.deleteCart(userId, dnum);

		if (confirm > 0) {
			System.out.println("삭제");
			msg = "결제가 왼료되었습니다.";
			url = "/cart/cartList";
		} else {
			System.out.println("실패!");
			msg = "실패 하였습니다.";
			url = "/cart/cartList";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert";
	}
}
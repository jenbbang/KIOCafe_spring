package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.el.lang.FunctionMapperImpl.Function;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import model.Cart;
import model.Category;

import service.CategoryMybatisDao;

@Controller
@RequestMapping("/category/")
public class CategoryController {
	@Autowired
	CategoryMybatisDao bd;

	HttpServletRequest request;
	Model m;
	HttpSession session;

	@ModelAttribute
	void init(HttpServletRequest request, Model m) {
		this.request = request;
		this.m = m;
		this.session = request.getSession();
	}

	@RequestMapping("mainpage")
	public String mainpage() {

		return "mainpage";
	}

	@RequestMapping("bakeryMain")
	public String bakeryMain(String cmenu) {
	      cmenu="1";
	      List<Category> list=bd.menuList(cmenu);
	      
	     m.addAttribute("cmenu", cmenu);
	     m.addAttribute("list", list);
	         
	      System.out.println(list);
	     
    return "category/bakeryMain";
	}

	@RequestMapping("drinkMain")
	public String drinkMain(String cmenu) {
			  cmenu="2";
		      List<Category> list=bd.menuList(cmenu);
		      
		      m.addAttribute("cmenu", cmenu);
		      m.addAttribute("list", list);
		          
		      System.out.println(list);
		     
	    return "category/drinkMain";
	}

	

	@RequestMapping("categoryDetailForm")
	public String categoryDetailForm(int cnum, Category category) throws Exception {
		category = bd.categoryOne(cnum);
		System.out.println(cnum);
		int dprice=category.getCprice();
		System.out.println(dprice);
		System.out.println(category);
		
		m.addAttribute("category", category);
		

		return "category/categoryDetailForm";
	}

	@RequestMapping("menuUpdate")
	public String menuUpdate() throws Exception {
		return "category/menuUpdate";
	}

	@RequestMapping("menuUpdatePro")
	public String menuUpdatePro(Category category, String cid) throws Exception {

		String filename = null;
		String msg = "제품 등록 실패";
		String url = "category/menuUpdate";
		
		if (cid == null)
			cid = "1";
		category.setCid(cid); // 우선 공지사항

		// category.setCpicture(""); //null값
		int num = bd.insertCategory(category);

		if (num > 0) {
			msg = "제품 등록 성공";
			url = "/category/categoryList";
		}

		System.out.println(category);

		m.addAttribute("filename", filename);
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert";
	}


	@RequestMapping("categoryList")
	public String categoryList(String cid, String pageNum) {

		session = request.getSession();
		if (cid!= null) {
			session.setAttribute("cid", cid);
			session.setAttribute("pageNum", "1");
		}

		if (cid == null)
			cid = "1";
		// 다른 게시판으로 갈때 다시 1로 넘어갈수 있도록 명령어를 넣어준다. 만약 없으면 자동으로 동일한 page로 들어가서 해당 page의 갯수가
		// 없으면 야예 없는 null이 뜨게 한다.

		if (pageNum != null) {
			session.setAttribute("pageNum", pageNum);
		}

		pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null)
			pageNum = "1";
		int pageInt = Integer.parseInt(pageNum);
		int limit = 10; // 한 page당 게시물 갯수
		// 100개이면 order by 최근 num desc

		/*
		 * 스타트 페이지를 알아야 한다. 전체 페이지에서 찾을려면 startPage(pageInt-1)*limit+1, end:startPage +
		 * limit -1을 하면 해당 값이 나온다. 예) 1 page : 1,2,3 2 : 4,5,6 s: 4 , e: 6 3 : 7,8,9 s:
		 * 7 ,e: 9
		 */

		int categoryCount = bd.categoryCount(cid);

		System.out.println(categoryCount);
		List<Category> list = bd.categoryList(pageInt, limit, cid);
		int bottomLine = 3; // 페이지 수
		int start = (pageInt - 1) / bottomLine * bottomLine + 1; // 이전
		int end = start + bottomLine - 1; // 다음
		int maxPage = (categoryCount / limit) + (categoryCount % limit == 0 ? 0 : 1);
		if (end > maxPage)
			end = maxPage; // 페이지가 없면 작동 안함
		/*
		 * 1P 2P 3 -- 페이지 보여줄 부분 수정
		 */

		// 페이지 카운트
		int categoryNum = categoryCount - (pageInt - 1) * limit;
		// ----------------------------------페이지

		m.addAttribute("pageInt", pageInt);
		m.addAttribute("list", list);
		// m.addAttribute("boardName", boardName);
		m.addAttribute("categoryCount", categoryCount);
		m.addAttribute("categoryNum", categoryNum);
		m.addAttribute("start", start);
		m.addAttribute("end", end);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("maxPage", maxPage);

		return "category/categoryList";

	}
	

	@RequestMapping("categoryInfo")
	public String categoryInfo(int cnum, Category category) throws Exception {
		m.addAttribute("category", category);
		return "category/categoryInfo";
	}
	
	@RequestMapping("categoryUpdateForm")
	   public String categoryUpdateForm(int cnum, Category category) throws Exception {
    	   
	  	m.addAttribute("category", category);
	      return "category/categoryUpdateForm";
	   }

	   @RequestMapping("categoryUpdatePro")
	   public String boardUpdatePro(Category category) throws Exception {

	 
	      String msg = "";
	      String url = "";
	      
	      	
	   
	         // 수정하기
	         if (bd.categoryUpdate(category) > 0) {
	            msg = "수정 완료";
	            url = "/category/categoryInfo?cnum="+category.getCnum();
	         } else {
	            msg = "수정 실패";
	         
	      }
	   
	      m.addAttribute("msg", msg);
	      m.addAttribute("url", url);
	      return "alert";
	   }


		
		
	   @RequestMapping("categoryDeletePro")
	   public String categoryDeletePro(int cnum) {
	       
		 
	      String msg = "";
	      String url = "";
	    		/*  "/board/boardDeleteForm?cnum=" + cnum;*/
	      
	         // 수정하기
	         if (bd.categoryDelete(cnum) > 0) {
	            msg = "게시글이 삭제 되었습니다";
	            url = "/category/categoryList";
	         } else {
	            msg = " 게시글 삭제를 실패 하였습니다.";
	         
	      }
	      m.addAttribute("msg", msg);
	      m.addAttribute("url", url);
	      return "alert";

	   }
	

	@RequestMapping("pictureimgForm")
	public String pictureimgForm() throws Exception {

		return "category/pictureimgForm";
	}

	@RequestMapping("picturePro")
	public String picturePro(@RequestParam("cpicture") MultipartFile multipartFile) throws Exception {

		String path = request.getServletContext().getRealPath("/") + "view/category/img/";
		String filename = null;

		if (!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename());
			multipartFile.transferTo(file);
			filename = multipartFile.getOriginalFilename();
		}

		m.addAttribute("filename", filename);

		return "category/picturePro";
	}
	
	@RequestMapping("categoryQtySelectOne")
	@ResponseBody
	public String categoryQtySelectOne(String dnum) throws Exception {
		System.out.println(dnum);
		String dqty = bd.categoryQtySelectOne(dnum);
//		System.out.println("dqty : " + dqty);

		return dqty;
	}

	
}

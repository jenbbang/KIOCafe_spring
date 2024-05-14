package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Category;


@Repository
public class CategoryMybatisDao {
   
   @Autowired
   SqlSessionTemplate session;
   
   private static final String ns = "category."; 
   private Map map = new HashMap();
   public int categoryCount(String cid) {
      
      int num = session.selectOne(ns+"categoryCount", cid);
      return num;
   }
   
   public List<Category> categoryList(int pageInt, int limit, String cid){
      
      map.clear();
      map.put("cid", cid);
      map.put("start", (pageInt-1)*limit+1);
      map.put("end", (pageInt*limit));
      System.out.println(map);
      List<Category> list = session.selectList(ns+"categoryList",map);
      System.out.println(list);
      return list;
   }
   
	public List<Category> menuList(String cmenu){
	      
	      map.clear();
	      map.put("cmenu", cmenu);
			
	      List<Category> list = session.selectList(ns+"menuList",map);
	      System.out.println(list);
	      return list;
	   }

public int insertCategory(Category category) {
   System.out.println(category);
   int num = session.insert(ns+"insertCategory", category);
   
   
   return num;
}
 
   public Category categoryOne(int cnum) {
      
      Category category = session.selectOne(ns+"categoryOne", cnum);
      
      return category;
   }
   
   
   public String categoryQtySelectOne(String dnum) {
	   System.out.println("categoryQtySelectOne ");
	  String cqty = session.selectOne(ns+"categoryQtySelectOne", dnum);
	  
	  System.out.println("cqty : " + cqty);
	   
	   return cqty;
   }
   
   
   

public int categoryUpdate(Category category) {
   
   int num = session.update(ns+"categoryUpdate", category);
   
   
   return num;
}
public int categoryDelete(int cnum) {
   
   int c = session.delete(ns+"categoryDelete", cnum);
   
   
   return c;
}

}   //end class
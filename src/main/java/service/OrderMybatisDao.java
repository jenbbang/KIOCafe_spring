package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Cart;
import model.Order;

@Repository
public class OrderMybatisDao {

	@Autowired
	SqlSessionTemplate session;

	private static final String ns = "order.";
	private Map map = new HashMap<>();
	private HashMap hashMap = new HashMap<>();

	public int orderInsert(String[] dnum, String[] dname, String[] dqty, String[] dprice, String[] dtotal, Order order,
			String userId) {
		System.out.println(order.getDaddress());
		for (int i = 0; i < dnum.length; i++) {
			map.clear();
			map.put("dnum", dnum[i]);
			map.put("dname", dname[i]);
			map.put("dqty", dqty[i]);
			map.put("dprice", dprice[i]);
			map.put("dtotal", dtotal[i]);
			map.put("did", userId);
			map.put("daddress", order.getDaddress());
			map.put("dpaym", order.getDpaym());
			int num = session.insert(ns + "orderInsert", map);
		}

		return 0;
	}

	public int modifyDqty(String userId, String[] dnums, String[] dqty) {
		map.clear();
		map.put("userid", userId);
		for (int i = 0; i < dnums.length; i++) {
			map.put("dnum", dnums[i]);
			map.put("dqty", dqty[i]);
			session.update(ns + "modifyDqty", map);
		}

		return 1;
	}

	public int deleteCart(String userId, String[] dnums) {

		map.put("userid", userId);
		map.put("dnums", dnums);
		for (String string : dnums) {
		}
		int confirm = session.update(ns + "deleteCart", map);
		return confirm;
	}

	public List<Order> orderList(String did) {
		map.put("did", did);
		List<Order> list = session.selectList(ns + "orderList", map);
		return list;
	}

	public List<Object> myOrderListInfo(String did) {
		map.put("did", did);
		List<Object> list = session.selectList(ns + "myOrderListInfo", map);

		return list;
	}

	public List<Order> myOrderDetailList(String did, String orderId) {
		hashMap.put("did", did);
		hashMap.put("orderId", orderId);
		List<Order> list = session.selectList(ns + "myOrderDetailList", hashMap);
		return list;
	}

	public void selectOrderId() {
		int orderId = session.selectOne(ns + "selectOrderId");
	}

} // end class
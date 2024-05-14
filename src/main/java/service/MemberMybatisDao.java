package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Member;

@Repository
public class MemberMybatisDao {

	private static final String NS = "member.";
	
	@Autowired
	private SqlSessionTemplate session;

	

	public int insertMember(Member mem) {
		int num = session.insert(NS + "insertMember", mem);
		return num;
	}

	public Member selectOne(String id) {
		Member member = session.selectOne(NS + "selectOne", id);
		return member;
	}

	public int updateMember(Member mem) {
		int num = session.update(NS + "updateMember", mem);
		return num;
	}

	public int deleteMember(String id) {
		int num = session.insert(NS + "deleteMember", id);
		return num;
	}


	public int changePass(String id, String pass) {
		Map map = new HashMap();
		map.put("id", id);
		map.put("pass", pass);
		int num = session.update(NS + "changePass", map);
		return num;
	}

	public List<Member> memberList() {
		List<Member> list = session.selectList(NS + "memberList");
		
		return list;
	}
	

	
}
// end member
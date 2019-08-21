package com.java.web.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao implements BoardDaoInterface {

	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insert(HashMap<String, Object> resultMap) {
		System.out.println("resultMap:"+resultMap);
		return sqlSession.insert("board.insert", resultMap);
	}

	@Override
	public List<HashMap<String,Object>> select() {
		List<HashMap<String,Object>> selectlist = new ArrayList<>();
			selectlist =	sqlSession.selectList("board.select");
			return selectlist;
	}

	@Override
	public int delete(HashMap<String, Object> data) {
		return sqlSession.update("board.delete", data);
	}

	@Override
	public int update(HashMap<String, Object> data) {
		return sqlSession.update("board.update", data);
	}
	
	
	
	
}

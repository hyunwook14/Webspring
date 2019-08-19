package com.java.web.dao;

import java.util.HashMap;

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
	
	
}

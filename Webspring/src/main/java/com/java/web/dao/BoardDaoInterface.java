package com.java.web.dao;

import java.util.HashMap;
import java.util.List;

public interface BoardDaoInterface {
	public int insert(HashMap<String, Object> resultMap);
	public List<HashMap<String,Object>> select();
	public int delete(HashMap<String, Object> data);
	public int update(HashMap<String, Object> data);
}

package com.java.web.service;

import java.util.HashMap;
import java.util.List;

public interface BoardServiceInterface {
	
	public void insertservice(HashMap<String , Object> dataMap);
	public List<HashMap<String, Object>> selectservice();
	public void deleteservice(HashMap<String, Object> data);
	public void updateservice(HashMap<String, Object> data);
}

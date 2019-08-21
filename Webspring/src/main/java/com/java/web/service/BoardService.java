package com.java.web.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.web.dao.BoardDao;
import com.java.web.dao.BoardDaoInterface;

@Service
public class BoardService implements BoardServiceInterface {

	@Autowired
	BoardDaoInterface bdi;
	
	@Override
	public void insertservice(HashMap<String , Object> dataMap) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		System.out.println("dataMap"+dataMap.get("no")+", "+dataMap.get("text"));
		
		int number =bdi.insert(dataMap);
		
		System.out.println(number);
	}

	@Override
	public List<HashMap<String, Object>> selectservice() {
		return bdi.select();
	}

	@Override
	public void deleteservice(HashMap<String, Object> data) {
		int number =bdi.delete(data);
	}

	@Override
	public void updateservice(HashMap<String, Object> data) {
		bdi.update(data);
	}
	
}

package com.java.web.service;

import java.util.HashMap;

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
	
}

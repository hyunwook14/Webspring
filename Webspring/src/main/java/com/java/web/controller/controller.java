package com.java.web.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.web.service.BoardServiceInterface;

@Controller
public class controller {
	
	@Autowired
	BoardServiceInterface bsi;
	
	@RequestMapping ("/")
	public String Home() {
		return "20190725";
	}
	
	
	@RequestMapping (value="/setData", method=RequestMethod.POST)
	public void setData(HttpServletRequest req, HttpServletResponse res) {
		String text = req.getParameter("text");
		String no = req.getParameter("no");
		HashMap<String, Object> sendData = new HashMap<>();
		sendData.put("text", text);
		sendData.put("no",no);
		
		bsi.insertservice(sendData);
		
		
		
	}
}

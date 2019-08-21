package com.java.web.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.web.service.BoardServiceInterface;

import net.sf.json.JSONObject;

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
		HashMap<String, Object> sendData = new HashMap<>();
		sendData.put("text", text);
		bsi.insertservice(sendData);
		
	}
	
	@RequestMapping(value="/getData", method=RequestMethod.POST)
	public void getData(HttpServletResponse res) {
		HashMap<String, Object> selectdata = new HashMap();
		selectdata.put("result", bsi.selectservice());
		
		JSONObject jobj = new JSONObject();
		jobj.put("data", selectdata);
		
		res.setContentType("text/html; charset=utf-8");
		try {
			res.getWriter().write(jobj.toString());
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping (value="/deleteData", method=RequestMethod.POST)
	public String deleteData(HttpServletRequest req) {
		String no = req.getParameter("no");
		HashMap<String, Object> data = new HashMap<>();
		data.put("no", no);
		bsi.deleteservice(data);
		
		return "20190725";
	}
	
	@RequestMapping (value="/updateData", method=RequestMethod.POST)
	public String updateData(HttpServletRequest req) {
		HashMap<String, Object> data = new HashMap<>();
		
		String no = req.getParameter("no");
		String comment = req.getParameter("comment");
		data.put("no", no);
		data.put("comment",comment);
		
		bsi.updateservice(data);
		
		return "20190725";
	}
	
	
}

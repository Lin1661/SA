package com.lgw.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lgw.dao.BarDao;

public class JsoService extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setCharacterEncoding("utf-8");
//		resp.setContentType("application/x-json;charset=utf-8");
		
//		String obj=req.getParameter("user");
//		
//		System.out.println(obj);
		
//		Gson gson=new Gson();
//		Bar bar=gson.fromJson(obj, Bar.class);
//		System.out.println(bar.getName());
		
		String sno=req.getParameter("sno");
		String age=req.getParameter("age");
		//		System.out.println(name+num+"!!!!!");
//		
		BarDao bDao=new BarDao();
		bDao.update(sno, Integer.parseInt(age));
		
		resp.sendRedirect("test.jsp");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}

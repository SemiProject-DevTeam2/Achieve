package edu.kh.Achieve.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import edu.kh.Achieve.member.model.service.MemberService;
import edu.kh.Achieve.member.model.vo.Member;

@WebServlet("/member/selectAll")	
public class SelectAllServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			MemberService service = new MemberService();
			
			List<Member> list = service.selectAll();
			
			// Gson 라이브러리를 이용해서 JSON 형태로 변환 후 응답
			new Gson().toJson( list, resp.getWriter() );
		
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

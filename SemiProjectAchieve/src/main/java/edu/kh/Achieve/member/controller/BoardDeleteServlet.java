package edu.kh.Achieve.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import edu.kh.Achieve.member.model.service.CheckBoardService;

@WebServlet("/boardList/delete")
public class BoardDeleteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int type =  Integer.parseInt(req.getParameter("type"));
			int boardNo = Integer.parseInt(req.getParameter("no"));
			
			int result = new CheckBoardService().deleteBoard(boardNo);
			
			HttpSession session = req.getSession();
			
			String path = null;
			String message = null;
			
			if(result > 0) { // 성공
				
				message = "게시글이 삭제 되었습니다.";
				path = "list?type=" + type ; //해당 게시판 목록 1페이지로 이동
				// /board/list?type=1
				
			}else { // 실패
				message = "게시글 삭제에 실패했습니다.";
				path = req.getHeader("referer"); // 이전 요청 페이지 주소 == 상세페이지 == referer
			}
			
			session.setAttribute("message", message);
			
			resp.sendRedirect(path);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}
		
}

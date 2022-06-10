package edu.kh.Achieve.member.model.service;

import static edu.kh.Achieve.common.JDBCTemplate.*;

import java.sql.Connection;

import edu.kh.Achieve.member.model.dao.MemberDAO;
import edu.kh.Achieve.member.model.vo.Member;

public class MemberService {
	
	private MemberDAO dao = new MemberDAO();
	
	
	/**
	 * 로그인 Service
	 * @param mem
	 * @return loginMember
	 * @throws Exception
	 */
	public Member login(Member mem) throws Exception {
		
		Connection conn = getConnection();
		Member loginMember = dao.login(conn, mem);
		close(conn);
		return loginMember;
	}
	

	/**
	 * 회원 정보 수정
	 * @param mem
	 * @return result
	 * @throws Exception
	 */
	public int updateMember(Member mem) throws Exception{
		
		Connection conn = getConnection();
		int result = dao.updateMember(conn, mem);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);

		return result;
	}


	/**
	 * 비밀번호 변경 Service
	 * @param currentPw
	 * @param newPw
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public int changePw(String currentPw, String newPw, int memberNo) throws Exception {
		Connection conn = getConnection();
		
		int result = dao.changePw(conn, currentPw, newPw, memberNo);
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}


	/**
	 * 회원 탈퇴 Service
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public int secession(int memberNo) throws Exception {
		Connection conn = getConnection();
		int result = dao.secession(conn, memberNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);	
		return result;
	}


	/**
	 * 프로필 이미지 변경 Service
	 * @param memberNo
	 * @param profileImage
	 * @return result
	 * @throws Exception
	 */
	public int updateProfileImage(int memberNo, String profileImage) throws Exception {
		Connection conn = getConnection();
		
		int result = dao.updateProfileImage(conn, memberNo, profileImage);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}




}

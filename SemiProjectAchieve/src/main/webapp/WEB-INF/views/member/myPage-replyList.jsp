<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:set var = "replyList" value="${map2.replyList}"/>
<c:set var = "listReplyCount" value="${map2.listReplyCount}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>댓글 조회</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/myPage-inquire-main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/myPage-reply.css">
</head>
<body>
    <main>
        <header>
            <!-- 클릭 시 메인페이지로 이동하는 로고 -->
            <section>
                <a href="${contextPath}">
                    <img src="${contextPath}/resources/images/Achieve_logo.png" id="home-logo">
                </a>
            </section>

            <section>
                <!-- form 내부 input태그 값을 서버 또는 페이지로 전달 -->
                <div id="team_name">팀 프로젝트 명</div>
            </section>

            <section>
                <div>
                    <a href="#">
                        <img src="${contextPath}/resources/images/favorit.png" id="fav-logo">
                    </a>
                </div>
                <div>
                    <a href="#">
                        <img src="${contextPath}/resources/images/note.png" id="note-logo">
                    </a>
                </div>
            </section>
    
        </header>
        <!-- 마이페이지- 내정보 -->
        <section class="myPage-content">
            <!-- 왼쪽 사이드 메뉴 -->
        
            <section class="left-side">

                <h1>마이페이지</h1>

                <ul class="list-group">
                    <li> <a href="#">회원정보 수정 </a> </li>
                    <li> <a href="#">비밀번호 변경 </a> </li>
                    <li> <a href="#">내가 쓴 글 보기 </a> </li>
                    <li> <a href="#">내가 쓴 댓글 보기 </a> </li>
                    <li> <a href="#">회원 탈퇴 </a> </li>
                </ul>

            </section>
            
            <!-- 오른쪽 마이페이지 주요 내용 부분 -->
            <section class="myPage-main">
                <div class="myPage-first">
                    <a href="#"><img src="${contextPath}/resources/images/user.png" id="profile-logo"></a>
                </div>

                <div class="myPage-second">
                    <span class="myPage-nickname">닉네임</span>
                    <span class="myPage-grade">등급 :</span>
                    <div class="myPage-info">
                        <span class="myPage-visit">방문 :</span>
                        <span class="myPage-words">작성 글 :</span>
                        <span class="myPage-reply">작성 댓글 :</span>
                    </div>
                </div>  

                <div class="myPage-third">
                    <a href="#">작성글</a>
                    <a href="#">작성댓글</a>
                    <a href="#">가입한 프로젝트 보기</a>
                </div>      

                <div class="list-wrapper">
                    <table class="list-table">
                        <thead>
                            <tr>
                                <th></th>
                                <th id="head-content">댓글</th>
                            </tr>
                        </thead>
    
                        <tbody class="reply-list">
                            <c:choose>
                                <c:when test="${empty replyList}">
                                <!-- 작성글 목록 조회 결과가 비어있다면 -->
                                    <tr>
                                        <th colspan="5">작성 댓글이 존재하지 않습니다.</th>
                                    </tr>
                                </c:when>

                                <c:otherwise>
                                <!-- 작성글 목록 조회 결과가 비어있지않다면 -->
                                    <!-- 향상된 for문 처럼 사용 -->
                                    <c:forEach var ="reply" items="{$replyList}">
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td>${reply.replyNo}</td>
                                            <td>
                                                <a href="#">${reply.replyContent}</a>
                                            </td>
                                            <td>${reply.replyDate}</td>
                                            <td></td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>

                        </tbody>
    
                    </table>
    
                </div>
    
                <div class="btn-area">
                    <div id="checkAll">
                        <input type="checkbox" >전체선택
                    </div>
                    <div>
                    <a class="insertBtn">삭제</a>
                    <a class="insertBtn">글쓰기</a>
                    </div>
                </div>
    
                <div class="pagination-area">
                    <ul class="pagination">
                        <!-- li*10>a{$} -->
                        <li><a class="current">1</a></li>
                        
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>

                    </ul>
                </div>
            </section>
        </section>
    </main>

    <footer>
       
       
        <article>
            <a href="#">FAQ</a>
            <span>|</span>
            <a href="#">1:1문의</a>
            <span>|</span>
            <a href="#">이용약관</a>
            <span>|</span>
            <a href="#">개인정보취급방침</a>
        </article>
         <pre>서울특별시 중구 남대문로 120 대일빌딩 A강의장</pre>
         <pre>KH A-class 개발2팀</pre>
        
    </footer>
    
<script>
const contextPath = "${contextPath}";
const boardNo = "${detail.boardNo}";
const loginMemberNo = "${loginMember.memberNo}";
// -> 로그인 o -> "10";
// -> 로그인 x -> "";
</script>

    
</body>
</html>
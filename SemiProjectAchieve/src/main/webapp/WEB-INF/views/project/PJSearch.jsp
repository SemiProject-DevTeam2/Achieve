<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로젝트 찾기</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/header-footer.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/index.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/project-search.css">

    <script src="https://kit.fontawesome.com/35f111b89d.js" crossorigin="anonymous"></script>

</head>
<body>

    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />
        
        <!-- 왼쪽 사이드 메뉴 -->
        <section class="content">

            <section class="content-1">
        
                <c:choose>

                    <c:when test="${empty sessionScope.loginMember}">

                        <form action="member/login" method="post" name="login-form" onsubmit="return loginValidate()">
                        
                            <!-- 아이디(이메일)/비밀번호/로그인 -->
                            <fieldset id="id-pw-area">
                                
                                <section>
                                    <input type="text" name="inputEmail" placeholder="아이디(이메일)" value="${cookie.saveId.value}">
                                    <input type="password" name="inputPw" placeholder="비밀번호">
                                </section>
                                
                                <section>
                                    
                                    <button type="submit">로그인</button>
                                    
                                </section>
                                
                            </fieldset>

                            <!-- 쿠키에 saveId가 있는 경우 -->
                            <c:if test="${!empty cookie.saveId.value}">
                                
                                <!-- chk변수 생성(page scope) -->
                                <c:set var="chk" value="checked"/>
                            
                            
                            </c:if>
                                                    
                            <label for="saveId">
                                <input type="checkbox" name="saveId" ${chk} id="saveId"> 아이디 저장
                            </label>
                
                
                            <!-- 회원가입/ID,PW찾기 -->
                            <article id="signup-find-area">
                                
                                <button type="button"><a href="${contextPath}/member/signUp" id="main-singUp">회원가입</a></button>
                                <button type="button"><a href="#" id="main-find">ID/PW 찾기</a></button>
                                
                            </article>
                            
                        </form>
                                
                    </c:when>

                    <c:otherwise>

                        <article class="login-area">
                        
                            <!-- 회원 프로필 이미지 -->
                            <a href="${contextPath}/member/myPage/profile">
                                <!-- 프로필 이미지 변경하는 페이지 생기면 그쪽으로 -->

                                <c:if test="${empty loginMember.profileImage}">
                                    <img src="${contextPath}/resources/images/user.png" id="member-profile">
                                </c:if>

                                <c:if test="${!empty loginMember.profileImage}">
                                    <img src="${contextPath}${loginMember.profileImage}" id="member-profile">
                                </c:if>

                            </a>
                        
                            <!-- 회원 정보 + 로그아웃 버튼 -->
                            <div class="my-info">
                                <div>
                                    <a href="${contextPath}/member/myPage/info" id="nickname">${loginMember.memberNickname}</a>
                                    
                                    <a href="member/logout" id="logout-btn">&times;</a>
                                
                                </div>
                                
                                <p>
                                    ${loginMember.memberEmail}
                                </p>
                                
                            </div>
                        
                        </article>            
            
                        <!-- 마이페이지 -->
                        <article id="signup-find-area">
                            
                            <button id="myPageBtn"><a href="${contextPath}/member/myPage/info">마이페이지</a></button>
                            
                        </article>

                    </c:otherwise>



                </c:choose> 
                

                <article id="main-project-area">
                    
                    <!-- 요청주소 확인 반드시 필요 -->
                    <button type="button"><a href="${contextPath}/project/PJ/create">프로젝트 만들기</a></button><br>
                    <button type="button"><a href="${contextPath}/project/PJ/PJSearch">프로젝트 찾기</a></button>


                </article>
            
            </section>

        
    
        
            
        
    
            <!-- 우측 프로젝트 목록 검색부분-->
            <section class="content-2">
                
                <div id="project-area">
            
                    <h1 class="project-name">프로젝트 찾기</h1>
                    
                    <div class="btn-area">
                        <button id="insertBtn">프로젝트 만들기</button>
                    </div>

                    <div class="list-wrapper">
                        <table class="list-table">
        
                            <thead>
                                <tr>                                    
                                    <th>프로젝트</th>
                                    <th>관리자</th>
                                    <th>참여자 수</th>
                                    <th>프로젝트 설명</th>
                                </tr>
                            </thead>
        
                            <tbody>
                                <tr>                                    
                                    <td>
                                        <a href="#">프로젝트명은12자까지한줄</a>
                                    </td>
                                    <td>유저일</td>
                                    <td>8</td>
                                    <td>홈페이지를 제작하는 프로젝트입니다.</td>
                                </tr>
                                                                                                
                            </tbody>
                        </table>
                    </div>
        
        

                    <div class="pagination-area">
                        <ul class="pagination">
                            <li><a href="#">&lt;&lt;</a></li>
                            <li><a href="#">&lt;</a></li>
        
                            <li><a class="current">1</a></li>
        
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">6</a></li>
                            <li><a href="#">7</a></li>
                            <li><a href="#">8</a></li>
                            <li><a href="#">9</a></li>
                            <li><a href="#">10</a></li>
        
                            <li><a href="#">&gt;</a></li>
                            <li><a href="#">&gt;&gt;</a></li>
                        </ul>
                    </div>

                            
                </div>  



                <form action="#" method="get" id="projectSearch">

                    <select name="key">
                        <option value="t">프로젝트명</option>
                        <option value="c">관리자</option>
                    </select>

                    <input type="text" name="query" placeholder="검색어를 입력해주세요.">

                    <button>검색</button>

                </form>

            </section>
        

        </section>

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
</body>
</html>
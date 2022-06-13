<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>project-settings</title>

    
    <link rel="stylesheet" href="../resources/css/project-settings.css">


    </style>

</head>
<body>
    <main>  
        <jsp:include page="/WEB-INF/views/common/header.jsp" />


		<jsp:include page="/WEB-INF/views/common/sideMenu.jsp"/>

        <div class="body">
            <form action="PJSettings.jsp" method="POST" name="PJSettings-form">
                <div class="setting-main">

                    <div name="setting-header" id="infor-first">
                        프로젝트 설정 
                    </div>

                    <div name="setting-body" class="setting-body">
                        참여자 관리 (차단, 탈퇴) <button id="member-control">변경</button>
                    </div>

                    <div name="setting-body" class="setting-body">
                        프로젝트 공개

                        <select name="project-public" id="project-public" onchange="showValue(this)">
                            <option value="공개">공개</option>
                            <option value="클래스명 공개">클래스명 공개</option>
                            <option value="비공개">비공개</option>

                        </select>
                            
                    </div>

                    <div name="setting-body" class="setting-body">
                            

                        클래스 이름 변경 <button id="nameChangeBtn">변경</button>
                        <input type="text" id="PJNameChange" name="PJNameChange"
                        placeholder="기존 프로젝트 이름" maxlength="20" autocomplete="off">
                    </div>

                    <div name="setting-body" class="setting-body">
                        과제 관리 <button id="homework-control">변경</button>
                    </div>

                    <div name="setting-body" class="setting-body">
                        전체 쪽지 발송 <button id="text-all">발송</button>
                        
                    </div>
                    <textarea placeholder="전체 쪽지는 여기에 작성하세요." id="sendAll-text"></textarea>


                    <div name="setting-body" class="setting-body">
                        소개 수정 <button id="intro-edit">수정</button>
                        
                    </div>
                    <textarea placeholder="바꿀 소개를 작성하세요." id="intro-text">개발2팀입니당</textarea>

                    <div name="setting-body" class="setting-body">
                        공지 작성 <button id="write-notice">작성</button>
                    </div>
                    



                </div>
            </form>
        </div>

        

    </main>




    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <script src="../resources/js/project-settings.js"></script>


    
</body>
</html>
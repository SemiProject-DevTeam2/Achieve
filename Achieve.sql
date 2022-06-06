﻿
-- 회원 ㅇ
DROP TABLE "MEMBER";

CREATE TABLE "MEMBER" (
	"MEMBER_NO"	NUMBER PRIMARY KEY,
	"MEMBER_EMAIL"	VARCHAR2(50) NOT NULL,
	"MEMBER_PW"	VARCHAR2(30) NOT NULL,
	"MEMBER_NM"	VARCHAR2(30) NOT NULL,
	"MEMBER_NICK" VARCHAR2(30) NOT NULL,
	"MEMBER_BIRTH" DATE NOT NULL,
	"MEMBER_TEL" CHAR(11) NULL,
	"SECESSION_FL" CHAR(1)	DEFAULT 'N'	NOT NULL,
	"SUSPENSION_FL" CHAR(1)	DEFAULT 'N'	NOT NULL,
	"MEMBER_PROFILE" VARCHAR2(200) NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '이메일(아이디)';

COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '회원 비밀번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_NM" IS '회원 이름';

COMMENT ON COLUMN "MEMBER"."MEMBER_NICK" IS '회원 닉네임';

COMMENT ON COLUMN "MEMBER"."MEMBER_BIRTH" IS '회원 생년월일';

COMMENT ON COLUMN "MEMBER"."MEMBER_TEL" IS '회원 전화번호(- 미포함)';

COMMENT ON COLUMN "MEMBER"."SECESSION_FL" IS '탈퇴 여부(Y/N)';

COMMENT ON COLUMN "MEMBER"."SUSPENSION_FL" IS '정지 여부(Y/N)';

COMMENT ON COLUMN "MEMBER"."MEMBER_PROFILE" IS '프로필 사진';

-- 회원 번호 시퀀스
CREATE SEQUENCE SEQ_MEMBER_NO;


-- 게시판 ㅇ
DROP TABLE "BOARD";

CREATE TABLE "BOARD" (
	"BOARD_NO" NUMBER PRIMARY KEY,
	"BOARD_TITLE" VARCHAR2(100) NOT NULL,
	"BOARD_CONTENT" VARCHAR2(4000) NOT NULL,
	"CREATE_DT" DATE DEFAULT SYSDATE NOT NULL,
	"UPDATE_DT" DATE DEFAULT SYSDATE NOT NULL,
	"READ_COUNT" NUMBER DEFAULT 0 NOT NULL,
	"BOARD_ST" CHAR(1) DEFAULT 'N' NOT NULL,
	"MEMBER_NO" NUMBER REFERENCES MEMBER,
	"BOARD_CD" NUMBER REFERENCES BOARD_TYPE
);

COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시글 번호';

COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '게시글 제목';

COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '게시글 내용';

COMMENT ON COLUMN "BOARD"."CREATE_DT" IS '작성일';

COMMENT ON COLUMN "BOARD"."UPDATE_DT" IS '마지막 수정일';

COMMENT ON COLUMN "BOARD"."READ_COUNT" IS '조회수';

COMMENT ON COLUMN "BOARD"."BOARD_ST" IS '게시글 상태(삭제여부)';

COMMENT ON COLUMN "BOARD"."MEMBER_NO" IS '작성자 회원 번호';

COMMENT ON COLUMN "BOARD"."BOARD_CD" IS '게시판 코드';


-- 게시판 종류 ㅇ
DROP TABLE "BOARD_TYPE";

CREATE TABLE "BOARD_TYPE" (
	"BOARD_CD" NUMBER PRIMARY KEY,
	"BOARD_NM" VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_CD" IS '게시판 코드';

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_NM" IS '게시판 이름';


-- 게시판 이미지 ㅇ
DROP TABLE "BOARD_IMG";

CREATE TABLE "BOARD_IMG" (
	"IMG_NO" NUMBER PRIMARY KEY,
	"IMG_RENAME" VARCHAR2(500) NOT NULL,
	"IMG_ORIGINAL" VARCHAR2(500) NOT NULL,
	"IMG_LEVEL" NUMBER NOT NULL,
	"BOARD_NO" NUMBER REFERENCES BOARD
);

COMMENT ON COLUMN "BOARD_IMG"."IMG_NO" IS '이미지 번호';

COMMENT ON COLUMN "BOARD_IMG"."IMG_RENAME" IS '이미지 저장 경로 + 변경명';

COMMENT ON COLUMN "BOARD_IMG"."IMG_ORIGINAL" IS '이미지 원본명';

COMMENT ON COLUMN "BOARD_IMG"."IMG_LEVEL" IS '이미지 위치 지정 번호';

COMMENT ON COLUMN "BOARD_IMG"."BOARD_NO" IS '게시글 번호';




-- 댓글 ㅇ
DROP TABLE "REPLY";

CREATE TABLE "REPLY" (
	"REPLY_NO" NUMBER PRIMARY KEY,
	"REPLY_CONTENT" VARCHAR2(1000) NOT NULL,
	"REPLY_DT" DATE DEFAULT SYSDATE NOT NULL,
	"REPLY_ST" CHAR(1) DEFAULT 'N' NOT NULL,
	"BOARD_NO" NUMBER REFERENCES BOARD,
	"MEMBER_NO" NUMBER REFERENCES MEMBER
);

COMMENT ON COLUMN "REPLY"."REPLY_NO" IS '댓글 번호';

COMMENT ON COLUMN "REPLY"."REPLY_CONTENT" IS '댓글 내용';

COMMENT ON COLUMN "REPLY"."REPLY_DT" IS '작성일';

COMMENT ON COLUMN "REPLY"."REPLY_ST" IS '댓글 상태(삭제여부)';

COMMENT ON COLUMN "REPLY"."BOARD_NO" IS '게시글 번호';

COMMENT ON COLUMN "REPLY"."MEMBER_NO" IS '작성자 회원 번호';



-- 프로젝트 ㅇ
DROP TABLE "PROJECT";

CREATE TABLE "PROJECT" (
	"PROJECT_NO" NUMBER PRIMARY KEY,
	"PROJECT_NM" VARCHAR2(50) NOT NULL,
	"PROJECT_PM" NUMBER NOT NULL,
	"PROJECT_QUOTA" NUMBER NOT NULL,
	"OPEN_ST" CHAR(1) DEFAULT 'Y' NOT NULL,
	"PROJECT_INTRO" VARCHAR2(4000) NOT NULL,
	"MEMBER_NO" NUMBER REFERENCES MEMBER
);

COMMENT ON COLUMN "PROJECT"."PROJECT_NO" IS '프로젝트 번호';

COMMENT ON COLUMN "PROJECT"."PROJECT_NM" IS '프로젝트 이름';

COMMENT ON COLUMN "PROJECT"."PROJECT_PM" IS '생성자 회원 번호';

COMMENT ON COLUMN "PROJECT"."PROJECT_QUOTA" IS '가입 정원(MAX 10)';

COMMENT ON COLUMN "PROJECT"."OPEN_ST" IS '공개여부(Y/N)';

COMMENT ON COLUMN "PROJECT"."PROJECT_INTRO" IS '프로젝트 소개';

COMMENT ON COLUMN "PROJECT"."MEMBER_NO" IS '프로젝트 생성자 회원번호';


-- 프로젝트별 참여 회원 --> 복합키로 PK설정...?????? 설정은 했는데 추후 논의 혹은 선생님께 질문!! 
DROP TABLE "PROJECT_MEMBER";

CREATE TABLE "PROJECT_MEMBER" (
	"PROJECT_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "PROJECT_MEMBER"."PROJECT_NO" IS '프로젝트 번호';

COMMENT ON COLUMN "PROJECT_MEMBER"."MEMBER_NO" IS '회원번호(모든 참여자)';

-- PK 설정
ALTER TABLE "PROJECT_MEMBER" ADD CONSTRAINT "PK_PROJECT_MEMBER" PRIMARY KEY (
	"PROJECT_NO",
	"MEMBER_NO"
);

-- FK 설정
ALTER TABLE "PROJECT_MEMBER" ADD CONSTRAINT "FK_PROJECT" FOREIGN KEY (
	"PROJECT_NO"
)
REFERENCES "PROJECT" (
	"PROJECT_NO"
);

ALTER TABLE "PROJECT_MEMBER" ADD CONSTRAINT "FK_MEMBER" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);



-- 과제 ㅇ
DROP TABLE "TASK";

CREATE TABLE "TASK" (
	"TASK_NUMBER" NUMBER PRIMARY KEY,
	"SUBMISSION_NO" NUMBER NOT NULL,
	"CLOSING_ST" CHAR(1) NOT NULL,
	"CLOSING_DT" DATE NOT NULL
);

COMMENT ON COLUMN "TASK"."TASK_NUMBER" IS '과제 번호';

COMMENT ON COLUMN "TASK"."SUBMISSION_NO" IS '과제 체출 인원';

COMMENT ON COLUMN "TASK"."CLOSING_ST" IS '과제 마감 여부';

COMMENT ON COLUMN "TASK"."CLOSING_DT" IS '과제 마감 일자';



-- 과제 제출자 --> 복합키로 PK설정...?????? 설정은 했는데 추후 논의 혹은 선생님께 질문!! 
DROP TABLE "TASK_SUBMITTER";

CREATE TABLE "TASK_SUBMITTER" (
	"TASK_NUMBER"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"SUBMISSION_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"SUBMISSION_ST"	CHAR(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "TASK_SUBMITTER"."TASK_NUMBER" IS '과제 번호';

COMMENT ON COLUMN "TASK_SUBMITTER"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "TASK_SUBMITTER"."SUBMISSION_DT" IS '과제 제출일자';

COMMENT ON COLUMN "TASK_SUBMITTER"."SUBMISSION_ST" IS '과제 제출여부';

-- PK 설정
ALTER TABLE "TASK_SUBMITTER" ADD CONSTRAINT "PK_TASK_SUBMITTER" PRIMARY KEY (
	"TASK_NUMBER",
	"MEMBER_NO"
);

-- FK 설정
ALTER TABLE "TASK_SUBMITTER" ADD CONSTRAINT "FK_TASK" FOREIGN KEY (
	"TASK_NUMBER"
)
REFERENCES "TASK" (
	"TASK_NUMBER"
);

ALTER TABLE "TASK_SUBMITTER" ADD CONSTRAINT "FK_MEMBER" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);




-- 쪽지 ㅇ
DROP TABLE "NOTE";

CREATE TABLE "NOTE" (
	"NOTE_NO" NUMBER PRIMARY KEY,
	"NOTE_CONTENT" VARCHAR2(1000) NOT NULL,
	"NOTE_DT" DATE DEFAULT SYSDATE NOT NULL,
	"SENDER_NO" NUMBER REFERENCES MEMBER,
	"RECEIVER_NO" NUMBER REFERENCES MEMBER
);

COMMENT ON COLUMN "NOTE"."NOTE_NO" IS '쪽지 고유 번호';

COMMENT ON COLUMN "NOTE"."NOTE_CONTENT" IS '쪽지 내용';

COMMENT ON COLUMN "NOTE"."NOTE_DT" IS '쪽지 발신일(시간)';

COMMENT ON COLUMN "NOTE"."SENDER_NO" IS '발신 회원번호';

COMMENT ON COLUMN "NOTE"."RECEIVER_NO" IS '수신 회원번호';





-- 카테고리 ㅇ
DROP TABLE "CATEGORY";

CREATE TABLE "CATEGORY" (
	"CATEGORY_NO" NUMBER PRIMARY KEY,
	"CATEGORY_NM" VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN "CATEGORY"."CATEGORY_NO" IS '카테고리 번호';

COMMENT ON COLUMN "CATEGORY"."CATEGORY_NM" IS '카테고리 이름';


-- 카테고리 별 프로젝트 --> 복합키로 PK설정...?????? 설정은 했는데 추후 논의 혹은 선생님께 질문!! 
DROP TABLE "PROJECT_CATEGORY";

CREATE TABLE "PROJECT_CATEGORY" (
	"PROJECT_NO"	NUMBER		NOT NULL,
	"CATEGORY_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "PROJECT_CATEGORY"."PROJECT_NO" IS '프로젝트 번호';

COMMENT ON COLUMN "PROJECT_CATEGORY"."CATEGORY_NO" IS '카테고리 번호';

-- PK 설정
ALTER TABLE "PROJECT_CATEGORY" ADD CONSTRAINT "PK_PROJECT_CATEGORY" PRIMARY KEY (
	"PROJECT_NO",
	"CATEGORY_NO"
);

-- FK 설정
ALTER TABLE "PROJECT_CATEGORY" ADD "FK_PROJECT" FOREIGN KEY (
	"PROJECT_NO"
)
REFERENCES "PROJECT" (
	"PROJECT_NO"
);

ALTER TABLE "PROJECT_CATEGORY" ADD CONSTRAINT "FK_CATEGORY" FOREIGN KEY (
	"CATEGORY_NO"
)
REFERENCES "CATEGORY" (
	"CATEGORY_NO"
);


-- MEMBER 테이블 샘플 데이터 삽입
INSERT INTO MEMBER 
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user01@achieve.co.kr', 'pass01!', '유저일', '초코칩', SYSDATE, '01017171717', 
DEFAULT, DEFAULT, NULL);

SELECT * FROM MEMBER;

-- 로그인 
SELECT MEMBER_NO, MEMBER_EMAIL, MEMBER_NM, MEMBER_NICK, 
TO_CHAR(MEMBER_BIRTH, 'YYYY-MM-DD') AS MEMBER_BIRTH,
MEMBER_TEL, MEMBER_PROFILE
FROM MEMBER
WHERE MEMBER_EMAIL = 'user01@achieve.co.kr'
AND MEMBER_PW = 'pass01!'
AND SECESSION_FL = 'N';

-- 비밀번호 변경
UPDATE MEMBER SET
MEMBER_PW = 'pass01@'
WHERE MEMBER_NO = 1
AND MEMBER_PW = 'pass01!';
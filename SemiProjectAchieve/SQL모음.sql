ALTER TABLE table_name

COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시글 번호(시퀀스)';
COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '게시글 제목';
COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '게시글 내용';
COMMENT ON COLUMN "BOARD"."CREATE_DT" IS '게시글 작성일';
COMMENT ON COLUMN "BOARD"."UPDATE_DT" IS '마지막 수정일';
COMMENT ON COLUMN "BOARD"."READ_COUNT" IS '조회수';
COMMENT ON COLUMN "BOARD"."BOARD_ST" IS '게시글 상태(정상N, 삭제Y)';
COMMENT ON COLUMN "BOARD"."MEMBER_NO" IS '작성자 회원번호';
COMMENT ON COLUMN "BOARD"."BOARD_CD" IS '게시판 코드';

-- BOARD 테이블 제약조건 추가
ALTER TABLE BOARD
ADD PRIMARY KEY (BOARD_NO); -- 제약 조건명 생략(SYS_XXX)

ALTER TABLE BOARD
ADD CONSTRAINT FK_BOARD_CD  -- 제약 조건명 지정
FOREIGN KEY (BOARD_CD)  -- BOARD의 BOARD_CODE 컬럼에 FK 지정
REFERENCES "BOARD_TYPE"; -- 참조할 테이블

ALTER TABLE BOARD
ADD CONSTRAINT "CHK_BOARD_ST"
CHECK ("BOARD_ST" IN ('N','Y'));

ALTER TABLE BOARD
MODIFY "UPDATE_DT" NULL;

-- BOARD_NO 시퀀스
CREATE SEQUENCE SEQ_REPLY_NO;

-- BOARD_TYPE 데이터 삽입
INSERT INTO BOARD_TYPE VALUES(1, '공지사항');
INSERT INTO BOARD_TYPE VALUES(2, '자유 게시판');
INSERT INTO BOARD_TYPE VALUES(3, '과제');

SELECT * FROM BOARD_TYPE;
SELECT * FROM BOARD;


-- BOARD 테이블 샘플 데이터 삽입(PL/ SQL)
 BEGIN
     FOR I IN 60.. 80 LOOP

         INSERT INTO BOARD
         VALUES(SEQ_BOARD_NO.NEXTVAL, 
                 SEQ_BOARD_NO.CURRVAL || '번째 게시글',
                 SEQ_BOARD_NO.CURRVAL || '번째 게시글 내용 입니다.',
                 DEFAULT, DEFAULT, DEFAULT, DEFAULT,1,2, 1
         );
    END LOOP;
 END;

COMMIT;

REPLY 테이블 샘플 데이터 삽입
INSERT INTO REPLY
         VALUES(SEQ_REPLY_NO.NEXTVAL, 
                 SEQ_REPLY_NO.CURRVAL || '번째 댓글',
                 DEFAULT, DEFAULT,2,1);

INSERT INTO REPLY
	VALUES(SEQ_BOARD_NO.NEXTVAL, 
			SEQ_BOARD_NO.CURRVAL || '번째 댓글',
			DEFAULT, DEFAULT,2,1);

-- 게시판이름조회
-- SELECT BOARD_NM FROM BOARD_TYPE
-- WHERE BOARD_CD=2;

--PW 변경
-- ALTER TABLE MEMBER MODIFY "MEMBER_PW" VARCHAR2(100);

INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL, '댓글 샘플2', SYSDATE, DEFAULT, 8, 1);


-- user01 PW 변경
UPDATE MEMBER SET 
MEMBER_PW = 'aBN5hiegXlvAovJLipPoPd5LB+xjPrAeu1tcAVg0p5MKGocvo6l825SD+ZMCOcHBFeGB7MnzH31SAnDzYYsSdg==' 
WHERE MEMBER_NO = 1;

-- 게시판 글 수 조회
SELECT COUNT(*) FROM BOARD
WHERE BOARD_ST = 'N'
AND MEMBER_NO=1;

-- 작성글 첫 페이지
SELECT * FROM(
    SELECT ROWNUM RNUM, A.* FROM (
        SELECT BOARD_NO, BOARD_TITLE,
        TO_CHAR(CREATE_DT, 'YYYY-MM-DD') AS CREATE_DT, 
        READ_COUNT
        FROM BOARD
        WHERE MEMBER_NO=1
        AND BOARD_ST = 'N') A
        ORDER BY BOARD_NO DESC
    )
WHERE RNUM BETWEEN 1 AND 10;

-- 작성글 조회 페이지
SELECT * FROM(
		    SELECT ROWNUM RNUM, A.* FROM (
		        SELECT BOARD_NO, BOARD_TITLE,
		        TO_CHAR(CREATE_DT, 'YYYY-MM-DD') AS CREATE_DT, 
		        READ_COUNT
		        FROM BOARD
		        WHERE MEMBER_NO = 1
		        AND BOARD_ST = 'N') A
		        ORDER BY BOARD_NO DESC
		    )
		WHERE RNUM BETWEEN 1 AND 70;

-- Reply 목록 조회
SELECT * FROM(
	SELECT ROWNUM RNUM, A.* FROM (
		SELECT REPLY_NO, REPLY_CONTENT,
		TO_CHAR(REPLY_DT, 'YYYY-MM-DD') AS REPLY_DT
		FROM REPLY
		WHERE MEMBER_NO = 1
		AND REPLY_ST = 'N') A
		ORDER BY REPLY_NO DESC
	)
WHERE RNUM BETWEEN 1 AND 2;

-- REPLY COUNT
SELECT COUNT(*) FROM REPLY
		WHERE REPLY_ST = 'N'
		AND MEMBER_NO=1;

-- 회원 닉네임, 회원 프로필 사진 조회
SELECT MEMBER_NICK , MEMBER_PROFILE
FROM MEMBER
WHERE MEMBER_NO = 1;

SELECT PROJECT_NM
FROM PROJECT
WHERE MEMBER_NO =1;


-- 작성글 제목 조회 (작성댓글에서)
SELECT * FROM(
	SELECT ROWNUM RNUM, A.* FROM (
		SELECT REPLY_NO, REPLY_CONTENT, BOARD_TITLE,
		TO_CHAR(REPLY_DT, 'YYYY-MM-DD') AS REPLY_DT
		FROM REPLY
		JOIN BOARD USING(BOARD_NO)
		WHERE REPLY.MEMBER_NO = 1
		AND REPLY_ST = 'N') A
		ORDER BY REPLY_NO DESC
	)
WHERE RNUM BETWEEN 1 AND 10	;


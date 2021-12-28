SELECT *
FROM ADMIN;

SELECT *
FROM NOTICE_SORT;

SELECT USER
FROM DUAL;
--==>> TEAM_SEOLO

-- 리스트 조회
-- 순번   공지 분류   제목   작성자   날짜
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE;

--공지사항 시퀸스
CREATE SEQUENCE NOTICESEQ
NOCACHE;

SELECT *
FROM USER SEQUENCES;

SELECT * FROM USER_SEQUENCES;   

--공지사항 분류 정렬
-- 공지사항
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE
WHERE NOTICESORT_NO=1;
-- 점검
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE
WHERE NOTICESORT_NO=2;



INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin1', 2, '2021-10-15 점검 예정 알림', '2021-10-15 1:00 - 3:00 점검 예정입니다. 회원 여러분의 양해를 부탁드립니다.', TO_DATE('2021-10-10', 'YYYY-MM-DD')); 

INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin2', 2, '2021-11-20 점검 예정 알림', '2021-11-20 2:00 - 3:00 점검 예정입니다. 회원 여러분의 양해를 부탁드립니다.', TO_DATE('2021-11-15', 'YYYY-MM-DD')); 

INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin2', 2, '2021-12-25 점검 예정 알림', '2021-11-20 2:00 - 3:00 점검 예정입니다. 회원 여러분의 양해를 부탁드립니다.', TO_DATE('2021-12-20', 'YYYY-MM-DD')); 

commit;

select *
from notice;


--○ 공지사항 관련
SELECT USER
FROM DUAL;
--==>> TEAM_SEOLO

-- 리스트 조회
-- 순번   공지 분류   제목   작성자   날짜
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE;

--공지사항 시퀸스
CREATE SEQUENCE NOTICESEQ
NOCACHE;

SELECT *
FROM USER SEQUENCES;

SELECT * FROM USER_SEQUENCES;   

--공지사항 분류 정렬
-- 공지사항
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE
WHERE NOTICESORT_NO=1;
-- 점검
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE
WHERE NOTICESORT_NO=2;



INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin1', 1, '2021년 09월 이벤트', '새롭게 시작하는 저희 페이지 많은 관심 부탁드립니다.', SYSDATE); 
INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin2', 1, '개인정보처리방침 변경 안내', '제3조(개인정보 보호 원칙) 이 바뀜에 따라 변경 사항을 적용할 예정입니다.', SYSDATE); 
INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin1', 1, '2021년 10월 이벤트', '지속적으로 성장하는 저희 페이지를 사랑해주셔서 감사합니다.', SYSDATE); 

----->>
SELECT *
FROM NOTICE;

UPDATE NOTICE
SET
CONTENT = '지속적으로 성장하는 저희 페이지를 사랑해주셔서 감사합니다.'
WHERE
NO_NO = 5;

COMMIT;
SELECT * FROM COLS WHERE TABLE_NAME = 'NOTICE'
----------------------------------------------------------------공지사항 끝-----

-- 공지사항 생성
INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin1', 1, '2021년 09월 이벤트', '새롭게 시작하는 저희 페이지 많은 관심 부탁드립니다.', SYSDATE); 

-- 공지사항 수정
UPDATE NOTICE
SET TITLE = '올해의 베스트 추천'
   ,CONTENT = '여기 저기 다 좋아요. 베스트 입니다~!'
   ,NOS_NO = 1
WHERE NO_NO=6;


-------------------------------------------------------------공지사항 수정 끝 --

--공지사항 삭제
DELETE
FROM NOTICE
WHERE NO_NO=6;

--------------------------------------------------------------공지사항 삭제 끝--




--○ 자주 묻는 질문
--VIEW_WITHDRAWAL
--자주 묻는 질문 조회, 생성, 수정, 삭제, 카테고리별 정렬

--1. 자주 묻는 질문 조회
/*
CREATE OR REPLACE VIEW VIEW_FAQ
AS
SELECT F.FAQ_NO "FAQ_NO", F.TITLE "FAQ_TITLE", F.CONTENT "FAQ_CONTENT", F.QS_NO "FAQSORT_NO", FS.NAME "FAQSORT_NAME"
FROM FAQ F JOIN FAQ_SORT FS
ON F.QS_NO = FS.QS_NO;
*/
--○ 자주 묻는 질문 조회 코드
SELECT FAQ_NO, FAQSORT_NO, FAQSORT_NAME, FAQ_TITLE, FAQ_CONTENT
FROM VIEW_FAQ;

--2. 자주 묻는 질문 생성
SELECT *
FROM FAQ;

SELECT *
FROM ADMIN;

SELECT *
FROM FAQ_SORT;

--○ 자주 묻는 질문 생성 코드
INSERT INTO FAQ(FAQ_NO, AD_ID, QS_NO, TITLE, CONTENT)
VALUES(FAQESEQ.NEXTVAL, 'admin1', 1, '스티커 기능은 뭔가요?', '내가 북마크 해 놓은 체크리스트에 내가 표시하고 싶은 단어를 스티커처럼 붙일 수 있습니다. 한 번 만들어 놓은 스티커는 내 체크리스트에서 확인 가능하며, 다른 북마크한 체크리스트에 사용 할 수 있습니다. 또한, 내 체크리스트에서 특정 스티커가 사용 된 체크리스트들을 확인할 수 있습니다.');

INSERT INTO FAQ(FAQ_NO, AD_ID, QS_NO, TITLE, CONTENT)
VALUES(FAQESEQ.NEXTVAL, 'admin2', 3, '탈퇴는 어떻게 하나요?', '마이 페이지에서 탈퇴를 진행할 수 있습니다.');

INSERT INTO FAQ(FAQ_NO, AD_ID, QS_NO, TITLE, CONTENT)
VALUES(FAQESEQ.NEXTVAL, 'admin2', 1, '북마크는 어떻게 하나요?', '내가 북마크 하고 싶은 체크리스트를 클릭한 후, 해당 체크리스트의 템플릿에서 북마크를 하실 수 있습니다. 북마크한 체크리스트는 내 체크리스트에서 확인 가능합니다.');

--COMMIT;
--ROLLBACK;
--2. 자주 묻는 질문 수정
--○ 자주 묻는 질문 수정 코드
UPDATE FAQ
SET QS_NO = 3
    , TITLE = '수정 테스트'
    , CONTENT = '수정 테스트임'
WHERE FAQ_NO = 3;

--3. 자주 묻는 질문 삭제
--○ 자주 묻는 질문 삭제 코드
DELETE
FROM FAQ
WHERE FAQ_NO = 3;

--4. 자주 묻는 질문 카테고리별 정렬
--○ 자주 묻는 질문 카테고리별 정렬 코드
SELECT FAQ_NO, FAQSORT_NO, FAQSORT_NAME, FAQ_TITLE, FAQ_CONTENT 
FROM VIEW_FAQ
WHERE FAQSORT_NO=1;

--5. 자주 묻는 질문 카테고리 명 / 번호 조회


----- 12/20 --------------------------------------------------------------------
SELECT USER
FROM DUAL;
--==>> TEAM_SEOLO

-- 리스트 조회
-- 순번   공지 분류   제목   작성자   날짜
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE;

--공지사항 시퀸스
CREATE SEQUENCE NOTICESEQ
NOCACHE;

SELECT *
FROM USER SEQUENCES;

SELECT * FROM USER_SEQUENCES;   

--공지사항 분류 정렬
-- 공지사항
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE
WHERE NOTICESORT_NO=1;
-- 점검
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE
WHERE NOTICESORT_NO=2;



INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin1', 1, '2021년 09월 이벤트', '새롭게 시작하는 저희 페이지 많은 관심 부탁드립니다.', SYSDATE); 
INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin2', 1, '개인정보처리방침 변경 안내', '제3조(개인정보 보호 원칙) 이 바뀜에 따라 변경 사항을 적용할 예정입니다.', SYSDATE); 
INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin1', 1, '2021년 10월 이벤트', '지속적으로 성장하는 저희 페이지를 사랑해주셔서 감사합니다.', SYSDATE); 

----->>
SELECT *
FROM NOTICE;

UPDATE NOTICE
SET
CONTENT = '지속적으로 성장하는 저희 페이지를 사랑해주셔서 감사합니다.'
WHERE
NO_NO = 5;

COMMIT;
SELECT * FROM COLS WHERE TABLE_NAME = 'NOTICE';
----------------------------------------------------------------공지사항 끝-----

-- 공지사항 생성
INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin1', 1, '2021년 09월 이벤트', '새롭게 시작하는 저희 페이지 많은 관심 부탁드립니다.', SYSDATE); 

-- 공지사항 수정
UPDATE NOTICE
SET TITLE = '올해의 베스트 추천'
   ,CONTENT = '여기 저기 다 좋아요. 베스트 입니다~!'
   ,NOS_NO = 1
WHERE NO_NO=6;


-------------------------------------------------------------공지사항 수정 끝 --

--공지사항 삭제
DELETE
FROM NOTICE
WHERE NO_NO=6;

COMMIT;
--------------------------------------------------------------공지사항 삭제 끝--
-- 서비스 소개 페이지 (조회, 수정)
-- 서비스 INTRODUCTION 조회
SELECT IN_NO, AD_ID, CONTENT
FROM INTRODUCTION;

-- 서비스 INTRODUCTION 수정
UPDATE INTRODUCTION
SET CONTENT = '어서오세요~ 서로입니다. 저희 서비스는 정말 좋구요 써보면 좋아하실 거에요'
WHERE IN_NO=1;

-- ** 삽입 -> 데이터 확인차 삽입 구문 예시로 하나 넣음
INSERT INTO INTRODUCTION (IN_NO, AD_ID, CONTENT) VALUES (1, 'admin1', '어서오세요~ 서로입니다.');


COMMIT;
--==>> 커밋 완료

--============회원목록/ 탈퇴회원 목록=====================================
-- 회원목록 -> 조회
SELECT PE_ID, NICKNAME, NAME, EMAIL, PEDATE, AC_NO
FROM PERSONAL;

-- 회원목록 -> 총 회원 수
SELECT COUNT(PE_ID) AS COUNT
FROM PERSONAL;
--==>> 32


CREATE OR REPLACE VIEW VIEW_WITHDRAWALACCOUNTS
AS
SELECT W.ID 'ID', W.NAME 'NAME', W.TEL 'TEL', W.WIDATE 'WIDATE', WW.WHY 'WHY', W.WIR_NO 'WIR_NO', W.TEL'TEL'
FROM WITHDRAWAL W JOIN WITHDRAWAL_WHY WW
ON W.WI_NO = WW.WIR_NO(+);



-- 탈퇴회원목록 조회
SELECT WITHDRAWAL_ID, WITHDRAWAL_NAME, WITHDRAWAL_TEL, WITHDRAWAL_DATE, WITHDRAWAL_NO, REASON
FROM VIEW_WITHDRAWAL;

SELECT *
FROM VIEW_WITHDRAWAL;

-- 탈퇴회원목록 -> 총 회원 수
SELECT COUNT(WI_NO) AS COUNT
FROM WITHDRAWAL;
--==>> 2

COMMIT;


--------------------------------------------------------------------------------
--○ 공지사항 조회 페이징 처리 부분 추가본

SELECT *
FROM NOTICE;


--○ 공지사항 게시물 번호의 최대값을 얻어내는 쿼리문 구성
/*
SELECT NVL(MAX(NUM), 0) AS MAXNUM
FROM TBL_BOARD; 
--> 한 줄 구성
SELECT NVL(MAX(NUM), 0) AS MAXNUM FROM TBL_BOARD
; 
*/

SELECT NVL(MAX(NO_NO), 0) AS MAXNUM
FROM NOTICE;
--> 한 줄 구성

SELECT NVL(MAX(NO_NO), 0) AS MAXNUM
FROM NOTICE
;

--○ DB 레코드의 갯수를 가져오는 쿼리문 구성
--@ 한 페이지에 몇개씩 보여줄건지 랜더링.... 그래서 전체 게시물이 몇 개다 가 필요함.
/*
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_BOARD
;
*/

SELECT COUNT(*) AS COUNT
FROM NOTICE;
-- 한 줄 구성
SELECT COUNT(*) AS COUNT FROM NOTICE
;


--                  1      10  → (1~10) / (11~20) / (21~30) / 
--○ 특정 영역의(시작번호-끝번호) 게시물의 목록을 읽어오는 쿼리문 구성
--   번호, 작성자, 제목, 조회수, 작성일
/*
SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
FROM TBL_BOARD
WHERE NUM >= 1 AND NUM <= 10
ORDER BY NUM DESC;

SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (
        SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
        FROM TBL_BOARD
        ORDER BY NUM DESC
    ) DATA
)
WHERE RNUM >=1 AND RNUM <= 10;
*/

/*
CREATE OR REPLACE VIEW VIEW_NOTICE
AS 
SELECT NO.NO_NO"NOTICE_NO", NO.TITLE"NOTICE_TITLE", NO.NOS_NO "NOTICESORT_NO", NAME"NOTICESORT_NAME"
     ,NO.CONTENT"NOTICE_CONTENT", NO.NODATE"NOTICE_DATE"
FROM NOTICE NO LEFT JOIN NOTICE_SORT NOSO  
ON NO.NOS_NO = NOSO.NOS_NO;
--==>> View VIEW_NOTICE이(가) 생성되었습니다.

COMMIT;
*/
SELECT *
FROM VIEW_NOTICE;

SELECT NOTICE_NO, NOTICESORT_NAME, NOTICE_TITLE, NOTICE_DATE
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (
        SELECT NOTICE_NO, NOTICE_TITLE, NOTICESORT_NAME, TO_CHAR(NOTICE_DATE, 'YYYY-MM-DD') AS NOTICE_DATE
        FROM VIEW_NOTICE
        ORDER BY NOTICE_NO DESC
    ) DATA
)
WHERE RNUM >=1 AND RNUM <= 10;


--○ 이름 수정본
SELECT *
FROM VIEW_NOTICE;

SELECT NO_NO, NOS_NAME, TITLE, NODATE
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (
        SELECT NOTICE_NO "NO_NO", NOTICE_TITLE "TITLE", NOTICESORT_NAME "NOS_NAME", TO_CHAR(NOTICE_DATE, 'YYYY-MM-DD') AS NODATE
        FROM VIEW_NOTICE
        ORDER BY NOTICE_NO DESC
    ) DATA
)
WHERE RNUM >=1 AND RNUM <= 10;

--○ 카테고리 출력본
SELECT NAME
FROM NOTICE_SORT;

SELECT NOS_NAME
    FROM
    (
     SELECT NAME "NOS_NAME"
     FROM NOTICE_SORT
    );




--○ 특정 게시물의 내용을 읽어오는 쿼리문 구성
--   (NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
/*
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT
    , TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED
FROM TBL_BOARD
WHERE NUM=3;
--> 한 줄 구성
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED FROM TBL_BOARD WHERE NUM=3
;
*/

--번호 제목 작성일시 내용
--○ VIEW_WITHDRAWAL 칼럼명 조회
SELECT * FROM COLS WHERE TABLE_NAME = 'VIEW_NOTICE';

SELECT NOTICE_NO, NOTICE_TITLE, NOTICESORT_NAME, NOTICE_DATE, NOTICE_CONTENT 
FROM VIEW_NOTICE
WHERE NOTICE_NO=5;

/*
SELECT NVL(MIN(NUM), -1) AS NEXTNUM
FROM TBL_BOARD
WHERE NUM>209; 
--> 한 줄 구성
SELECT NVL(MIN(NUM), -1) AS NEXTNUM FROM TBL_BOARD WHERE NUM>209
; 
*/
--○ 특정 게시물의 이전 번호 읽어오는 쿼리문 구성
SELECT NVL(MIN(NO_NO), -1) AS NEXTNUM
FROM NOTICE
WHERE NO_NO>3;



--○ 특정 게시물의 다음 번호 읽어오는 쿼리문 구성 -- 7, 207, 208, 209
/*
SELECT NVL(MAX(NUM), -1) AS BEFORENUM
FROM TBL_BOARD
WHERE NUM<9; 
--> 한 줄 구성
SELECT NVL(MAX(NUM), -1) AS BEFORENUM FROM TBL_BOARD WHERE NUM<9
; 
*/

SELECT NVL(MAX(NO_NO), -1) AS BEFORENUM
FROM NOTICE
WHERE NO_NO<10;


SELECT NO_NO, AD_ID, NOS_NO, TITLE, NODATE
FROM NOTICE;

--------------------------------------------------------------------------------

--○ 공지사항 게시물 출력 뷰
SELECT NO_NO, NOS_NAME, TITLE, NODATE, CONTENT
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (
        SELECT NOTICE_NO "NO_NO", NOTICE_TITLE "TITLE", NOTICESORT_NAME "NOS_NAME", TO_CHAR(NOTICE_DATE, 'YYYY-MM-DD') AS NODATE
        , NOTICE_CONTENT "CONTENT"
        FROM VIEW_NOTICE
        ORDER BY NOTICE_NO DESC
    ) DATA
)
WHERE NO_NO=1;

--------------------------------------------------------------------------------
--○ 체크리스트 신고 게시판

--○ 신고 게시판 조회 뷰
--○ 다른거들이랑 DTO를 따로 만들까봄... 칼럼명 주의
SELECT *
FROM VIEW_REPORT;


SELECT NOTICE_NO, NOTICESORT_NAME, NOTICE_TITLE, NOTICE_DATE
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (
        SELECT NOTICE_NO, NOTICE_TITLE, NOTICESORT_NAME, TO_CHAR(NOTICE_DATE, 'YYYY-MM-DD') AS NOTICE_DATE
        FROM VIEW_NOTICE
        ORDER BY NOTICE_NO DESC
    ) DATA
)
WHERE RNUM >=1 AND RNUM <= 10;


CREATE OR REPLACE VIEW VIEW_REPORT
AS
SELECT ROWNUM AS RNUM, TITLE, STATUSNAME, REPORTDATE, REPORTERNO, REPORTERNAME, WRITERNO, WRITERNAME, RPCHECK_NO, WHY
FROM
(
    SELECT W.TITLE AS TITLE, S.STATUSNAME AS STATUSNAME, R.REPORTDATE AS REPORTDATE
    , R.AC_NO AS REPORTERNO, P.PE_ID AS REPORTERNAME, C.AC_NO AS WRITERNO, PP.PE_ID AS WRITERNAME, R.RPCHECK_NO AS RPCHECK_NO, R.WHY AS WHY
    FROM REPORT_CHECK R, REPORT_WHY W, REPORT_STATUS S, CHECKLIST C, PERSONAL P, PERSONAL PP
    WHERE R.WHY_NO = W.WHY_NO(+)
      AND R.STATUS_NO = S.STATUS_NO(+)
      AND R.CHECK_NO = C.CHECK_NO(+)
      AND R.AC_NO = P.AC_NO(+)
      AND C.AC_NO = PP.AC_NO(+)
);


--○ 신고 게시물 조회 뷰
--○ 내용의 신고당한 곳 주소는 추후 추가! 앞은 고정/ 뒤만 숫자 나오게..해주면 될듯
CREATE OR REPLACE VIEW VIEW_REPORTSEE
AS
SELECT ROWNUM AS RNUM, RPCHECK_NO, TITLE, REPORTDATE, REPORTERNAME, WRITERNAME, CHECK_NO, WHY
FROM
(
    SELECT W.TITLE AS TITLE, S.STATUSNAME AS STATUSNAME, R.REPORTDATE AS REPORTDATE, R.CHECK_NO AS CHECK_NO
    , R.AC_NO AS REPORTERNO, P.PE_ID AS REPORTERNAME, C.AC_NO AS WRITERNO, PP.PE_ID AS WRITERNAME, R.RPCHECK_NO AS RPCHECK_NO, R.WHY AS WHY
    FROM REPORT_CHECK R, REPORT_WHY W, REPORT_STATUS S, CHECKLIST C, PERSONAL P, PERSONAL PP
    WHERE R.WHY_NO = W.WHY_NO(+)
      AND R.STATUS_NO = S.STATUS_NO(+)
      AND R.CHECK_NO = C.CHECK_NO(+)
      AND R.AC_NO = P.AC_NO(+)
      AND C.AC_NO = PP.AC_NO(+)
);

SELECT *
FROM VIEW_REPORTSEE;

--○ 신고 처리(업데이트)
-- 관리자가 신고 글 들어가서 승인/허위신고/반려 버튼 눌렀을 때...
-- 승인 : 신고글 상태 해결 완료+신고 대상자에게 경고 1회 추가
-- 허위신고 : 신고글 상태 해결 완료 + 신고작성자에게 경고 1회 추가
-- 반려 : 신고글 상태 해결 완료

SELECT *
FROM REPORT_CHECK;

COMMIT;
ROLLBACK;

--@ SET은 상태값 바꿔주는거라 고정!
--@ WHERE은 바꿔주세용
--@ 경고도 걍.. 카운트 해주는거로했나? 따로 넣는거 없는 듯

-- 승인 처리
UPDATE REPORT_CHECK
SET STATUS_NO=1
WHERE RPCHECK_NO=1;

-- 허위신고 처리
UPDATE REPORT_CHECK
SET STATUS_NO=3
WHERE RPCHECK_NO=1;

-- 반려 처리
UPDATE REPORT_CHECK
SET STATUS_NO=2
WHERE RPCHECK_NO=1;


--○ 게시물 목록을 읽어오는 쿼리문(이전, 다음 번호)
--○ 특정 게시물의 이전 번호 읽어오는 쿼리문 구성
SELECT NVL(MIN(RPCHECK_NO), -1) AS NEXTNUM
FROM REPORT_CHECK
WHERE RPCHECK_NO>1;

--○ 특정 게시물의 다음 번호 읽어오는 쿼리문 구성 -- 7, 207, 208, 209
SELECT NVL(MAX(RPCHECK_NO), -1) AS BEFORENUM
FROM REPORT_CHECK
WHERE RPCHECK_NO<2;

SELECT *
FROM NOTICE_SORT;

COMMIT;

SELECT *
FROM NOTICE;

ROLLBACK;

INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE)
		VALUES(NOTICESEQ.NEXTVAL, 'admin2', 2, 'test', 'test', SYSDATE);

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------12/ 21-----------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
--◈ 페이징 처리

--① 자주묻는질문 FAQ  
--○ 게시물 번호의 최대값을 얻어내는 쿼리문 구성
SELECT NVL(MAX(FAQ_NO), 0) AS MAXNUM
FROM FAQ;
-->> 3

/*
--수 확인 차 조회
SELECT *
FROM FAQ;
-->> 3 
*/
--○ DB 레코드의 갯수를 가져오는 쿼리문 구성
--@ 한 페이지에 몇개씩 보여줄건지 랜더링.... 그래서 전체 게시물이 몇 개다 가 필요함.

SELECT COUNT(*) AS COUNT
FROM FAQ;

--○ 특정 영역의(시작번호-끝번호) 게시물의 목록을 읽어오는 쿼리문 구성

/*
-- 뷰 확인차
SELECT *
FROM VIEW_FAQ;
*/

-- 보여지는 화면이라서 뷰로 구성
SELECT FAQ_NO, FAQ_TITLE, FAQ_CONTENT, FAQSORT_NO, FAQSORT_NAME
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (
        SELECT FAQ_NO, FAQ_TITLE, FAQ_CONTENT, FAQSORT_NO, FAQSORT_NAME
        FROM VIEW_FAQ
        ORDER BY FAQ_NO DESC
    ) DATA
)
WHERE RNUM >=1 AND RNUM <= 10;

--○ 특정 게시물의 내용을 읽어오는 쿼리문 구성
SELECT FAQ_NO, FAQ_TITLE, FAQ_CONTENT, FAQSORT_NO, FAQSORT_NAME
FROM VIEW_FAQ
WHERE FAQ_NO=3;

--○ 특정 게시물의 이전 번호 읽어오는 쿼리문 구성
SELECT NVL(MIN(FAQ_NO), -1) AS NEXTNUM
FROM FAQ
WHERE FAQ_NO>2;

--○ 특정 게시물의 다음 번호 읽어오는 쿼리문 구성 // 이건 10까지만 나오게 하는거
SELECT NVL(MAX(FAQ_NO), -1) AS BEFORENUM
FROM FAQ
WHERE FAQ_NO<10;

                         
--② 회원목록                ---------------------------------------------------
/*
--○ 칼럼명 조회
SELECT * FROM COLS WHERE TABLE_NAME = 'PERSONAL';
*/

--○ 게시물 번호의 최대값을 얻어내는 쿼리문 구성
SELECT NVL(MAX(AC_NO), 0) AS MAXNUM
FROM PERSONAL;
-->> 38

/
--수 확인 차 조회
SELECT *
FROM PERSONAL;
-->> 3 
*/
--○ DB 레코드의 갯수를 가져오는 쿼리문 구성
--@ 한 페이지에 몇개씩 보여줄건지 랜더링.... 그래서 전체 게시물이 몇 개다 가 필요함.

SELECT COUNT(*) AS COUNT
FROM PERSONAL;
-->> 33

--○ 특정 영역의(시작번호-끝번호) 게시물의 목록을 읽어오는 쿼리문 구성
/*
SELECT * FROM COLS WHERE TABLE_NAME = 'PERSONAL';
*/
-- 아이디, 닉네임, 이름, 이메일, 가입일, 계정번호
SELECT PE_ID, NICKNAME, NAME, EMAIL, PEDATE, AC_NO
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (
        SELECT PE_ID, NICKNAME, NAME, EMAIL,TO_CHAR(PEDATE, 'YYYY-MM-DD') AS PEDATE, AC_NO
        FROM PERSONAL
        ORDER BY AC_NO DESC
    ) DATA
)
WHERE RNUM >=1 AND RNUM <= 10;

--○ 특정 게시물의 내용을 읽어오는 쿼리문 구성
SELECT PE_ID, NICKNAME, NAME, EMAIL, PEDATE, AC_NO
FROM PERSONAL
WHERE AC_NO=31;

--○ 특정 게시물의 이전 번호 읽어오는 쿼리문 구성
SELECT NVL(MIN(AC_NO), -1) AS NEXTNUM
FROM PERSONAL
WHERE AC_NO>12;


--○ 특정 게시물의 다음 번호 읽어오는 쿼리문 구성 // 이건 10까지만 나오게 하는거
SELECT NVL(MAX(AC_NO), -1) AS BEFORENUM
FROM PERSONAL
WHERE AC_NO<10;


--③ 탈퇴회원목록    WITHDRAWAL    -------------------------------------------------
/*
--○ 칼럼명 조회
SELECT * FROM COLS WHERE TABLE_NAME = 'VIEW_WITHDRAWAL';
*/

--○ 게시물 번호의 최대값을 얻어내는 쿼리문 구성
SELECT NVL(MAX(WIR_NO), 0) AS MAXNUM
FROM WITHDRAWAL;
-->> 5

/*
--수 확인 차 조회
SELECT *
FROM WITHDRAWAL;
-->> 2
*/
--○ DB 레코드의 갯수를 가져오는 쿼리문 구성
--@ 한 페이지에 몇개씩 보여줄건지 랜더링.... 그래서 전체 게시물이 몇 개다 가 필요함.

SELECT COUNT(*) AS COUNT
FROM WITHDRAWAL;

--○ 특정 영역의(시작번호-끝번호) 게시물의 목록을 읽어오는 쿼리문 구성

/*
-- 뷰 확인차
SELECT *
FROM VIEW_WITHDRAWAL;
*/
/*
SELECT * FROM COLS WHERE TABLE_NAME = 'VIEW_WITHDRAWAL';
*/
-- 보여지는 화면이라서 뷰로 구성

SELECT WITHDRAWAL_ID, NICKNAME, WITHDRAWAL_NAME, WITHDRAWAL_EMAIL, WITHDRAWAL_DATE, REASON, WITHDRAWAL_NO
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (   SELECT WITHDRAWAL_ID, NICKNAME, WITHDRAWAL_NAME, WITHDRAWAL_EMAIL, TO_CHAR(WITHDRAWAL_DATE, 'YYYY-MM-DD') AS WITHDRAWAL_DATE, REASON, WITHDRAWAL_NO
        FROM VIEW_WITHDRAWAL
        ORDER BY WITHDRAWAL_NO DESC
    ) DATA
)
WHERE RNUM >=1 AND RNUM <= 10;


SELECT ID, NAME, TEL, WIDATE, 탈퇴사유, WI_NO
FROM WITHDRWAL;

CREATE OR REPLACE
AS




--○ 특정 게시물의 내용을 읽어오는 쿼리문 구성 @@@@@ 일단 햇는데 .,, 필요할련지,,
SELECT WITHDRAWAL_ID, NICKNAME, WITHDRAWAL_NAME, WITHDRAWAL_EMAIL, WITHDRAWAL_DATE, REASON, WITHDRAWAL_NO
FROM WITHDRAWAL
WHERE WITHDRAWAL_NO=1;

--○ 특정 게시물의 이전 번호 읽어오는 쿼리문 구성
SELECT NVL(MIN(WI_NO), -1) AS NEXTNUM
FROM WITHDRAWAL
WHERE WI_NO>1;

--○ 특정 게시물의 다음 번호 읽어오는 쿼리문 구성 // 이건 10까지만 나오게 하는거
SELECT NVL(MAX(WI_NO), -1) AS BEFORENUM
FROM WITHDRAWAL
WHERE WI_NO<2;

--④ 신고처리            -------------------------------------------------------

--○ 칼럼명 조회
SELECT * FROM COLS WHERE TABLE_NAME = 'REPORT_CHECK';

SELECT * FROM COLS WHERE TABLE_NAME = 'VIEW_REPORT';

-- 확인차
/*
SELECT *
FROM REPORT_CHECK;
*/

--○ 게시물 번호의 최대값을 얻어내는 쿼리문 구성
SELECT NVL(MAX(RPCHECK_NO), 0) AS MAXNUM
FROM REPORT_CHECK;
-->> 2

--○ DB 레코드의 갯수를 가져오는 쿼리문 구성
--@ 한 페이지에 몇개씩 보여줄건지 랜더링.... 그래서 전체 게시물이 몇 개다 가 필요함.

SELECT COUNT(*) AS COUNT
FROM REPORT_CHECK;

--○ 특정 영역의(시작번호-끝번호) 게시물의 목록을 읽어오는 쿼리문 구성

/
-- 뷰 확인차
SELECT *
FROM VIEW_REPORT;
*/
-- 여기에 SYSDATE 인지  REPORTDATE 인지!! @@@@@
TO_CHAR(REPORTDATE, 'YYYY-MM-DD') AS DATE
TO_CHAR(SYSDATE, 'YYYY-MM-DD') AS 
-- 보여지는 화면이라서 뷰로 구성
--    순번     상태        사유     날짜   시간
SELECT RNUM, STATUSNAME, TITLE, REPORTDATE, REPORTDATE
FROM
(
    SELECT ROWNUM RONUM, DATA.*
    FROM
    (
        RNUM, STATUSNAME, TITLE, TO_CHAR(REPORTDATE, 'YYYY-MM-DD') AS DATE, TO_CHAR(REPORTDATE, 'HH:MI:SS') AS TIME 
        FROM VIEW_REPORT
        ORDER BY RNUM DESC
    ) DATA
)
WHERE RONUM >=1 AND RONUM <= 10;

--○ 특정 게시물의 내용을 읽어오는 쿼리문 구성@@@@@ ReportSee 인가?
-- 신고번호, 신고카테고리, 신고자. 원글작성자, 작성일시, 작성시간, 내용, 상세사유
SELECT ,WHY

RPCHECK_NO, TITLE, REPORTDATE
REPORTERNO
REPORTERNAME
WRITERNO
WRITERNAME
RPCHECK_NO
WHY
FROM VIEW_REPORT
WHERE RNUM=1;

--○ 특정 게시물의 이전 번호 읽어오는 쿼리문 구성
SELECT NVL(MIN(RPCHECK_NO), -1) AS NEXTNUM
FROM REPORT_CHECK
WHERE RPCHECK_NO>1;

--○ 특정 게시물의 다음 번호 읽어오는 쿼리문 구성 // 이건 10까지만 나오게 하는거
SELECT NVL(MAX(RPCHECK_NO), -1) AS BEFORENUM
FROM REPORT_CHECK
WHERE RPCHECK_NO<2;



SELECT NO_NO, TITLE, CONTENT, TO_CHAR(NODATE, 'YYYY-MM-DD') AS NODATE
FROM NOTICE
WHERE NO_NO = 1;

COMMIT;
ROLLBACK;

SELECT *
FROM NOTICE;

UPDATE NOTICE
SET TITLE = '올해의 베스트 추천'
   ,CONTENT = '여기 저기 다 좋아요. 베스트 입니다~!'
   ,NOS_NO = 1
WHERE NO_NO=13;

----------------------------------------------------------------------
SELECT WITHDRAWAL_ID, WITHDRAWAL_NAME, WITHDRAWAL_DATE, REASON, WITHDRAWAL_NO
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (   SELECT WITHDRAWAL_ID, WITHDRAWAL_NAME, TO_CHAR(WITHDRAWAL_DATE, 'YYYY-MM-DD') AS WITHDRAWAL_DATE, REASON, WITHDRAWAL_NO
        FROM VIEW_WITHDRAWAL
        ORDER BY WITHDRAWAL_NO DESC
    ) DATA
)
WHERE RNUM >=1 AND RNUM <= 10;
----------------------------------------------------------------------

--○ 회원 리스트 페이징 처리용 사용할 자료 

--○ 한 페이지에 출력될 회원 리스트(10개)
SELECT PE_ID, NICKNAME, NAME, EMAIL, PEDATE, AC_NO
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (
        SELECT PE_ID, NICKNAME, NAME, EMAIL,TO_CHAR(PEDATE, 'YYYY-MM-DD') AS PEDATE, AC_NO
        FROM PERSONAL
        ORDER BY AC_NO DESC
    ) DATA
)
WHERE RNUM >=1 AND RNUM <= 10;

--○ 페이징에 출력할 번호를 계산하기 위한 게시물의 총 갯수
SELECT COUNT(PE_ID) AS COUNT
FROM PERSONAL;



COMMIT;

ALTER TABLE INTRODUCTION MODIFY CONTENT VARCHAR2(1000);

COMMIT;


--○ 페이징용 쿼리문 수정 1
SELECT RNUM, NO_NO, NOS_NAME, TITLE, NODATE
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (
        SELECT NOTICE_NO "NO_NO", NOTICE_TITLE "TITLE", NOTICESORT_NAME "NOS_NAME", TO_CHAR(NOTICE_DATE, 'YYYY-MM-DD') AS NODATE
        FROM VIEW_NOTICE
        ORDER BY NOTICE_NO DESC
    ) DATA
);

--○ 페이징용 쿼리문 수정 2
SELECT RNUM, NO_NO, NOS_NAME, TITLE, NODATE
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (
        SELECT NOTICE_NO "NO_NO", NOTICE_TITLE "TITLE", NOTICESORT_NAME "NOS_NAME", TO_CHAR(NOTICE_DATE, 'YYYY-MM-DD') AS NODATE
        FROM VIEW_NOTICE
        ORDER BY NOTICE_NO
    ) DATA
)
WHERE RNUM >=1 AND RNUM <= 10
ORDER BY NO_NO DESC;
SELECT USER
FROM DUAL;

SELECT *
FROM TBL_JINHA;

-- 예시

-- JOB_HISTORY03 테이블 생성
/*
CREATE TABLE JOB_HISTORY03
( EMPLOYEE_ID   NUMBER(6)       CONSTRAINT JHIST03_EMPLOYEE_NN NOT NULL
, START_DATE    DATE            CONSTRAINT JHIST03_START_DATE_NN NOT NULL
, END_DATE      DATE            CONSTRAINT JHIST03_END_DATE_NN NOT NULL
, JOB_ID        VARCHAR2(10)    CONSTRAINT JHIST03_JOB_NN NOT NULL
, DEPARTMENT_ID NUMBER(4)
, CONSTRAINT JHIST03_EMP_ID_ST_DATE_PK PRIMARY KEY(EMPLOYEE_ID, START_DATE)
, CONSTRAINT JHIST03_DATE_INTERVAL CHECK(end_date > start_date)
, CONSTRAINT JHIST03_EMP_FK FOREIGN KEY(EMPLOYEE_ID)
             REFERENCES EMPLOYEES03(EMPLOYEE_ID)
, CONSTRAINT JHIST03_JOB_FK FOREIGN KEY(JOB_ID)
             REFERENCES JOBS03(JOB_ID)
, CONSTRAINT JHIST03_DEPT_FK FOREIGN KEY(DEPARTMENT_ID)
             REFERENCES DEPARTMENTS03(DEPARTMENT_ID)
);

CREATE TABLE DEPARTMENTS03
( DEPARTMENT_NAME  VARCHAR2(30)     CONSTRAINT DEPT03_NAME_NN NOT NULL
, DEPARTMENT_ID    NUMBER(4)
, LOCATION_ID      NUMBER(4)
, MANAGER_ID       NUMBER(6)
, CONSTRAINT DEPT03_ID_PK PRIMARY KEY(DEPARTMENT_ID)     
, CONSTRAINT DEPT03_LOC_FK FOREIGN KEY(LOCATION_ID)
             REFERENCES LOCATIONS03(LOCATION_ID)
);
*/
-- NOT NULL 따로..없는듯 제약조건 붙이지 말기
-- NOT NULL 따로 이름 붙이지 말기

CREATE TABLE LOCALTAG
( LO_TAG_NO NUMBER  
, LO_B_NO   NUMBER  NOT NULL
, STIKER_NO NUMBER  NOT NULL
, CONSTRAINT LOCALTAG_LO_TAG_NO_PK PRIMARY KEY(LO_TAG_NO)
, CONSTRAINT LOCALTAG_LO_B_NO_FK FOREIGN KEY(LO_B_NO)  
             REFERENCES LOCAL_BOOKMARK(LO_B_NO)
);

CREATE TABLE LOCAL_BOOKMARK
( LO_B_NO   NUMBER
, DONG_NO   NUMBER  NOT NULL 
, AC_NO     NUMBER  NOT NULL
, MARKDATE  DATE    NOT NULL
, CONSTRAINT LOCALMARK_LO_B_NO_PK PRIMARY KEY(LO_B_NO)
, CONSTRAINT LOCALMARK_DONG_NO_FK FOREIGN KEY(DONG_NO)
             REFERENCES DONG(DONG_NO)
, CONSTRAINT LOCALMARK_AC_NO_FK FOREIGN KEY(AC_NO)
             REFERENCES ACCOUNT(AC_NO)
, CONSTRAINT LOCALMARK_DONGAC_UK UNIQUE(DONG_NO, AC_NO)
);

CREATE TABLE CHECKSTICKER
( CSTICKER_NO   NUMBER
, AC_NO         NUMBER          NOT NULL 
, CONTENT       VARCHAR2(30)
, CONSTRAINT CHECKSTICKER_NO_PK PRIMARY KEY(CSTICKER_NO)
, CONSTRAINT CHECKSTICKER_AC_NO_FK FOREIGN KEY(AC_NO)
             REFERENCES ACCOUNT(AC_NO)
);

CREATE TABLE CHECKTAG
( CH_TAG_NO     NUMBER
, CH_B_NO       NUMBER  NOT NULL
, CSTICKER_NO   NUMBER  NOT NULL
, CONSTRAINT CHECKTAG_NO_PK PRIMARY KEY(CH_TAG_NO)
, CONSTRAINT CHECKTAG_CH_B_NO_FK FOREIGN KEY(CH_B_NO)
             REFERENCES CHECK_BOOKMARK(CH_B_NO)
, CONSTRAINT CHECKTAG_STICKER_NO_FK FOREIGN KEY(CSTICKER_NO)
             REFERENCES CHECKSTICKER(CSTICKER_NO)           
);
--, CONSTRAINT (제약조건이름) FOREIGN KEY(해당 키를 설정할 지금 테이블의 해당 컬럼명)
--              REFERENCES 해당 키를 받아올 테이블명(해당 테이블의 해당 컬럼명) 

CREATE TABLE CHECK_BOOKMARK
( CH_B_NO   NUMBER
, CHECK_NO  NUMBER          NOT NULL
, TITLE     VARCHAR2(30)
, AC_NO     NUMBER          NOT NULL
, MARKDATE  DATE            NOT NULL
, CONSTRAINT CBOOKMARK_CH_B_NO_FK PRIMARY KEY(CH_B_NO)
, CONSTRAINT CBOOKMARK_AC_NO_FK FOREIGN KEY(AC_NO)
             REFERENCES ACCOUNT(AC_NO)
, CONSTRAINT CBOOKMARK_CHECK_NO_FK FOREIGN KEY(CHECK_NO)
             REFERENCES CHECKLIST(CHECK_NO)
, CONSTRAINT CBOOKMARK_CHECKAC_UK UNIQUE(CHECK_NO, AC_NO)
);

--탈퇴사유
CREATE TABLE WITHDRAWAL_WHY
( WIR_NO    NUMBER
, WHY       VARCHAR2(50)    
, CONSTRAINT WITHDRAWAL_WHY_NO PRIMARY KEY(WIR_NO)
);




INSERT INTO WITHDRAWAL_WHY(WIR_NO, WHY) VALUES(1, '콘텐츠 내용 부족');
INSERT INTO WITHDRAWAL_WHY(WIR_NO, WHY) VALUES(2, '서비스 이용 불편');
INSERT INTO WITHDRAWAL_WHY(WIR_NO, WHY) VALUES(3, '시스템 장애');
INSERT INTO WITHDRAWAL_WHY(WIR_NO, WHY) VALUES(4, '개인정보 노출 우려');
INSERT INTO WITHDRAWAL_WHY(WIR_NO, WHY) VALUES(5, '기타');

SELECT *
FROM WITHDRAWAL_WHY;

COMMIT;


-- 테이블명+seq
-- NOTICESEQ

/*
-- 과정 시퀀스 생성
CREATE SEQUENCE SEQ_CURRICULUM   -- 시퀀스 생성 기본 구문
START WITH 1                -- 시작값
INCREMENT BY 1              -- 증가값
NOMAXVALUE                  -- 최대값 제한 안둠
NOCACHE;                    -- 캐시 사용 안함(없음)
*/



INSERT INTO REPORT_STATUS(STATUS_NO, STATUSNAME)
VALUES(1, '승인');

INSERT INTO REPORT_STATUS(STATUS_NO, STATUSNAME)
VALUES(2, '반려');

INSERT INTO REPORT_STATUS(STATUS_NO, STATUSNAME)
VALUES(3, '허위신고');

SELECT *
FROM REPORT_STATUS;

-- 지역정보 부착 스티커 시퀸스
CREATE SEQUENCE LOCALTAGSEQ   
START WITH 1             
INCREMENT BY 1              
NOMAXVALUE                 
NOCACHE;                    

-- 북마크(지역정보) 시퀸스
CREATE SEQUENCE LOCAL_BOOKMARKSEQ
START WITH 1               
INCREMENT BY 1             
NOMAXVALUE                  
NOCACHE;         

-- 북마크 스티커 시퀸스
CREATE SEQUENCE CHECKSTICKERSEQ
START WITH 1               
INCREMENT BY 1             
NOMAXVALUE                  
NOCACHE;       

-- 체크리스트 부착 스티커 시퀸스
CREATE SEQUENCE CHECKTAGSEQ   
START WITH 1             
INCREMENT BY 1              
NOMAXVALUE                 
NOCACHE;                    

-- 북마크(체크리스트) 시퀸스
CREATE SEQUENCE CHECK_BOOKMARKSEQ  
START WITH 1             
INCREMENT BY 1              
NOMAXVALUE                 
NOCACHE;      

-- 탈퇴회원 시퀸스
CREATE SEQUENCE WITHDRAWALSEQ  
START WITH 1             
INCREMENT BY 1              
NOMAXVALUE                 
NOCACHE;      

--(이미 작성)
-- 탈퇴사유 


-- 지역정보 평균 계산 뷰: 다영
/*
-- 1. 교수자 정보 출력 VIEW
CREATE OR REPLACE VIEW VIEW_PROFESSOR
AS
SELECT P.PRO_NAME "교수자명", S.SUB_NAME "배정된과목명", SL.SUB_STARTDATE "과목시작일"
    , SL.SUB_ENDDATE "과목종료일", B.BOOK_NAME "교재명", R.ROOM_NO "강의실명"
    , CASE WHEN SYSDATE - SL.SUB_STARTDATE < 0 THEN '강의 예정'
           WHEN SYSDATE - SL.SUB_ENDDATE <= 0 THEN '강의 중'
           WHEN SYSDATE - SL.SUB_ENDDATE > 0 THEN '강의 종료'
           ELSE '알 수 없음'
       END "강의진행여부"
FROM PROFESSOR P JOIN SUB_LIST SL
ON P.PRO_ID = SL.PRO_ID
    JOIN SUBJECT S
    ON SL.SUB_NO = S.SUB_NO
        JOIN BOOK B
        ON S.BOOK_NO = B.BOOK_NO
            JOIN CURRICULUM C
            ON SL.CUR_NO = C.CUR_NO
                JOIN ROOM R
                ON C.ROOM_NO = R.ROOM_NO;
                
SELECT *
FROM VIEW_PROFESSOR;
*/
/*

-- 5. 성적 정보 출력 VIEW
--학생 이름, 과정명, 과목명, 교육 기간(시작 연월일, 끝 연월일), 교재 명,
--출결, 실기, 필기, 총점, 등수
CREATE OR REPLACE VIEW VIEW_SUNGJUK
AS
SELECT T.*, RANK() OVER(PARTITION BY T.과정명, T.과목시작일 ORDER BY T.총점 DESC) "등수"
FROM
(
    SELECT SL.PRO_ID "교수아이디", ST.STU_ID "학생아이디", ST.STU_NAME "학생이름", C.CUR_NAME "과정명"
    , SJ.SUB_NAME "과목명", SL.SUB_STARTDATE "과목시작일"
        , SL.SUB_ENDDATE "과목종료일", B.BOOK_NAME "교재명", (SC.ATTEND_SCORE * SL.ATTEND_DIV)/100 "출결"
        , (SC.PRAC_SCORE * SL.PRAC_DIV)/100 "실기", (SC.WRITE_SCORE * SL.WRITE_DIV)/100 "필기"
        , FN_SCORESUM(SL.LIST_NO, SC.ATTEND_SCORE, SC.PRAC_SCORE, SC.WRITE_SCORE) "총점"
    FROM CURRICULUM C JOIN SUB_LIST SL  
            ON C.CUR_NO = SL.CUR_NO
                JOIN SUBJECT SJ
                ON SL.SUB_NO = SJ.SUB_NO
                    JOIN SCORE SC
                    ON SL.LIST_NO = SC.LIST_NO
                        JOIN REGISTRATION R
                        ON R.REG_NO =SC.REG_NO
                            JOIN STUDENT ST
                            ON ST.STU_ID = R.STU_ID
                                JOIN BOOK B
                                ON B.BOOK_NO = SJ.BOOK_NO
) T;

SELECT *
FROM VIEW_SUNGJUK;
*/

--○ 지역정보 평균 계산 뷰: **다영**
-- ㅇㅇ구 ㅁㅁ동 선택시 출력되는 뷰
-- 구/동 선택했을 때 보이는 지역정보 정보 평균 계산 뷰 하나 만들고 
-- WHERE 로 구만/구.동 선택했을 떄 다 보일수 있도록...
-- WHERE 조건까지 아직 짤 필요는 없고 전체 정보가 출력되는 뷰 하나 만들면 됨
--@ 이름 테이블이름+VIEW

--○ 지역정보 평균 계산 뷰 조회
SELECT *
FROM LOCALINFOVIEW;


/*
CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
-- SELECT (구, 동, 주거비(월세-월세),주거비(월세-보증금), 주거비(전세), 주거비(매매), 치안, 대중교통, 교통혼잡도)
--        각각의 평균(각각 칼럼의 총합 / 각각 구와 동에서 입력된 체크리스트 칼럼의 총 개수)
FROM
-- 어쩌고..조인..해야댐
*/


--○ 지역정보 평균 계산 뷰 조회

SELECT *
FROM LOCALINFOVIEW;

SELECT *
FROM GU;

-- SELECT "구이름", "동이름", "평균월세-월세", "평균월세-보증금", "평균전세", 
--       "평균매매", "평균치안", "평균대중교통","평균교통혼잡도", "평균생활편의시설", "평균반려동물"
CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GUNAME "구이름", D.DONGNAME "동이름"
FROM GU G JOIN DONG D
ON G.GU_NO = D.GU_NO;

/*
FROM PROFESSOR P JOIN SUB_LIST SL
ON P.PRO_ID = SL.PRO_ID
    JOIN SUBJECT S
    ON SL.SUB_NO = S.SUB_NO
        JOIN BOOK B
        ON S.BOOK_NO = B.BOOK_NO
            JOIN CURRICULUM C
            ON SL.CUR_NO = C.CUR_NO
                JOIN ROOM R
                ON C.ROOM_NO = R.ROOM_NO;
*/

SELECT *
FROM LOCALINFOVIEW;

-- 일단... 월세.전세 등등 다 데리고온담에 평균 내볼까?
-- SELECT "구이름", "동이름", "평균월세-월세", "평균월세-보증금", "평균전세", 
--       "평균매매", "평균치안", "평균대중교통","평균교통혼잡도", "평균생활편의시설", "평균반려동물"
CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GUNAME "구이름", D.DONGNAME "동이름", C.CHECK_NO "체크리스트 고유번호" 
       , W.MWOLSE "월세-월세", W.DEPOSIT "월세-보증금"
FROM GU G JOIN DONG D
ON G.GU_NO = D.GU_NO
    JOIN CHECKLIST C
    ON D.DONG_NO = C.DONG_NO
        JOIN WOLSE W
        ON C.CHECK_NO = W.CHECK_NO;

/*        
CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GUNAME "구이름", D.DONGNAME "동이름", C.CHECK_NO "체크리스트 고유번호" 
       , SUM(W.MWOLSE) "월세-월세", W.DEPOSIT "월세-보증금"
FROM GU G JOIN DONG D
ON G.GU_NO = D.GU_NO
    JOIN CHECKLIST C
    ON D.DONG_NO = C.DONG_NO
        JOIN WOLSE W
        ON C.CHECK_NO = W.CHECK_NO;
*/        

SELECT *
FROM LOCALINFOVIEW;

-- 일단... 월세.전세 등등 다 데리고온담에 평균 내볼까?
-- SELECT "구이름", "동이름", "평균월세-월세", "평균월세-보증금", "평균전세", "평균매매"
--      , "평균생활편의시설"
--      , "평균반려동물", "평균치안", "평균대중교통","평균교통혼잡도"
--      , 각 총 체크리스트의 개수? - 이걸 카운트를 어케하짘,,, 어차피 WHERE조건 늘거니까
-- 걍 체크리스트 고유번호 개수를 가져와서 이걸로 나눈다고 하면 될까?    

/*        
JOIN PET P
ON C.CHECK_NO = P.CHECK_NO
JOIN SCORE S
ON P.SCORENO = S.SCORENO;
*/


-- 우와........... 반려동물~교통혼잡도
-- 평균생활 편의시설은 저거 다가져와서 ㅠ^ㅠ 점수내야할거같은디용 어쩌죠
CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GUNAME "구이름", D.DONGNAME "동이름", C.CHECK_NO "체크리스트 고유번호" 
       , W.MWOLSE "월세-월세", W.DEPOSIT "월세-보증금", J.MJEONSE "전세", M.MMAEMAE "매매"
       , ((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK)/6) "생활편의시설1개평균"
       , SP.SCORENAME "반려동물", SS.SCORENAME "치안", ST.SCORENAME "대중교통", SH.SCORENAME "교통혼잡도"
FROM GU G JOIN DONG D
ON G.GU_NO = D.GU_NO
    JOIN CHECKLIST C
    ON D.DONG_NO = C.DONG_NO
        JOIN WOLSE W
        ON C.CHECK_NO = W.CHECK_NO
        JOIN JEONSE J
        ON C.CHECK_NO = J.CHECK_NO
        JOIN MAEMAE M
        ON C.CHECK_NO = M.CHECK_NO
        JOIN CONVENIENCE CN
        ON C.CHECK_NO = CN.CHECK_NO
        JOIN PET P
        ON C.CHECK_NO = P.CHECK_NO
            JOIN SCORE SP
            ON P.SCORENO = SP.SCORENO
        JOIN SECURITY S
        ON C.CHECK_NO = S.CHECK_NO
            JOIN SCORE SS
            ON S.SCORENO = SS.SCORENO
        JOIN TRANSPORT T
        ON C.CHECK_NO = T.CHECK_NO
            JOIN SCORE ST
            ON T.SCORENO = ST.SCORENO
        JOIN HONJAP H
        ON C.CHECK_NO = H.CHECK_NO
            JOIN SCORE SH
            ON H.SCORENO = SH.SCORENO;        

/*
CREATE OR REPLACE VIEW VIEW_SUNGJUK
AS
SELECT T.*, RANK() OVER(PARTITION BY T.과정명, T.과목시작일 ORDER BY T.총점 DESC) "등수"
FROM
(
    SELECT SL.PRO_ID "교수아이디", ST.STU_ID "학생아이디", ST.STU_NAME "학생이름", C.CUR_NAME "과정명"
    , SJ.SUB_NAME "과목명", SL.SUB_STARTDATE "과목시작일"
        , SL.SUB_ENDDATE "과목종료일", B.BOOK_NAME "교재명", (SC.ATTEND_SCORE * SL.ATTEND_DIV)/100 "출결"
        , (SC.PRAC_SCORE * SL.PRAC_DIV)/100 "실기", (SC.WRITE_SCORE * SL.WRITE_DIV)/100 "필기"
        , FN_SCORESUM(SL.LIST_NO, SC.ATTEND_SCORE, SC.PRAC_SCORE, SC.WRITE_SCORE) "총점"
    FROM CURRICULUM C JOIN SUB_LIST SL  
            ON C.CUR_NO = SL.CUR_NO
                JOIN SUBJECT SJ
                ON SL.SUB_NO = SJ.SUB_NO
                    JOIN SCORE SC
                    ON SL.LIST_NO = SC.LIST_NO
                        JOIN REGISTRATION R
                        ON R.REG_NO =SC.REG_NO
                            JOIN STUDENT ST
                            ON ST.STU_ID = R.STU_ID
                                JOIN BOOK B
                                ON B.BOOK_NO = SJ.BOOK_NO
) T;

SELECT *
FROM VIEW_SUNGJUK;
*/        

SELECT *
FROM LOCALINFOVIEW;

CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT L.구이름, L.동이름, AVG(L.월세)
FROM
(
    SELECT G.GU_NO "구고유번호", D.DONG_NO "동고유번호"
           , G.GUNAME "구이름", D.DONGNAME "동이름", C.CHECK_NO "체크리스트 고유번호" 
           , W.MWOLSE "월세", W.DEPOSIT "월세보증금", J.MJEONSE "전세", M.MMAEMAE "매매"
           , ((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK)/6) "생활편의시설1개평균"
           , SP.SCORENAME "반려동물", SS.SCORENAME "치안", ST.SCORENAME "대중교통", SH.SCORENAME "교통혼잡도"
    FROM GU G JOIN DONG D
    ON G.GU_NO = D.GU_NO
        JOIN CHECKLIST C
        ON D.DONG_NO = C.DONG_NO
            JOIN WOLSE W
            ON C.CHECK_NO = W.CHECK_NO
            JOIN JEONSE J
            ON C.CHECK_NO = J.CHECK_NO
            JOIN MAEMAE M
            ON C.CHECK_NO = M.CHECK_NO
            JOIN CONVENIENCE CN
            ON C.CHECK_NO = CN.CHECK_NO
            JOIN PET P
            ON C.CHECK_NO = P.CHECK_NO
                JOIN SCORE SP
                ON P.SCORENO = SP.SCORENO
            JOIN SECURITY S
            ON C.CHECK_NO = S.CHECK_NO
                JOIN SCORE SS
                ON S.SCORENO = SS.SCORENO
            JOIN TRANSPORT T
            ON C.CHECK_NO = T.CHECK_NO
                JOIN SCORE ST
                ON T.SCORENO = ST.SCORENO
            JOIN HONJAP H
            ON C.CHECK_NO = H.CHECK_NO
                JOIN SCORE SH
                ON H.SCORENO = SH.SCORENO
    GROUP BY G.GU_NO, D.DONG_NO
           , G.GUNAME, D.DONGNAME, C.CHECK_NO
           , W.MWOLSE, W.DEPOSIT, J.MJEONSE, M.MMAEMAE
           , ((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK)/6)
           , SP.SCORENAME, SS.SCORENAME, ST.SCORENAME, SH.SCORENAME
) L
WHERE L.구고유번호='1';


CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GUNAME "구이름", D.DONGNAME "동이름", C.CHECK_NO "체크리스트 고유번호" 
       , W.MWOLSE "월세-월세", W.DEPOSIT "월세-보증금", J.MJEONSE "전세", M.MMAEMAE "매매"
       , ((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK)/6) "생활편의시설1개평균"
       , SP.SCORENAME "반려동물", SS.SCORENAME "치안", ST.SCORENAME "대중교통", SH.SCORENAME "교통혼잡도"
FROM GU G JOIN DONG D
ON G.GU_NO = D.GU_NO
    JOIN CHECKLIST C
    ON D.DONG_NO = C.DONG_NO
        JOIN WOLSE W
        ON C.CHECK_NO = W.CHECK_NO
        JOIN JEONSE J
        ON C.CHECK_NO = J.CHECK_NO
        JOIN MAEMAE M
        ON C.CHECK_NO = M.CHECK_NO
        JOIN CONVENIENCE CN
        ON C.CHECK_NO = CN.CHECK_NO
        JOIN PET P
        ON C.CHECK_NO = P.CHECK_NO
            JOIN SCORE SP
            ON P.SCORENO = SP.SCORENO
        JOIN SECURITY S
        ON C.CHECK_NO = S.CHECK_NO
            JOIN SCORE SS
            ON S.SCORENO = SS.SCORENO
        JOIN TRANSPORT T
        ON C.CHECK_NO = T.CHECK_NO
            JOIN SCORE ST
            ON T.SCORENO = ST.SCORENO
        JOIN HONJAP H
        ON C.CHECK_NO = H.CHECK_NO
            JOIN SCORE SH
            ON H.SCORENO = SH.SCORENO
GROUP BY G.GUNAME, D.DONGNAME, C.CHECK_NO
       , W.MWOLSE, W.DEPOSIT, J.MJEONSE, M.MMAEMAE
       , ((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK)/6)
       , SP.SCORENAME, SS.SCORENAME, ST.SCORENAME, SH.SCORENAME;   

/*
select dname, avg_sal
from 
(select dno, avg(salary) as avg_sal 
from employee 
group by dno) as s, department d 
where s.dno = d.dno;

*/

--○ 순서체크 전 버전 백업
CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GUNAME "구이름", D.DONGNAME "동이름"
       , (SUM(W.MWOLSE)/COUNT(C.CHECK_NO)) "평균월세", (SUM(W.DEPOSIT)/COUNT(C.CHECK_NO)) "평균월세보증금"
       , (SUM(J.MJEONSE)/COUNT(C.CHECK_NO)) "평균전세", (SUM(M.MMAEMAE)/COUNT(C.CHECK_NO)) "평균매매"
       , (((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK)/6)/COUNT(C.CHECK_NO)) "평균생활편의시설점수"
       , (SUM(SP.SCORENAME)/COUNT(C.CHECK_NO)) "평균반려동물점수", (SUM(SS.SCORENAME)/COUNT(C.CHECK_NO)) "평균치안점수"
       , (SUM(ST.SCORENAME)/COUNT(C.CHECK_NO)) "평균대중교통점수", (SUM(SH.SCORENAME)/COUNT(C.CHECK_NO)) "평균교통혼잡도점수"
FROM GU G JOIN DONG D
ON G.GU_NO = D.GU_NO
    JOIN CHECKLIST C
    ON D.DONG_NO = C.DONG_NO
        JOIN WOLSE W
        ON C.CHECK_NO = W.CHECK_NO
        JOIN JEONSE J
        ON C.CHECK_NO = J.CHECK_NO
        JOIN MAEMAE M
        ON C.CHECK_NO = M.CHECK_NO
        JOIN CONVENIENCE CN
        ON C.CHECK_NO = CN.CHECK_NO
        JOIN PET P
        ON C.CHECK_NO = P.CHECK_NO
            JOIN SCORE SP
            ON P.SCORENO = SP.SCORENO
        JOIN SECURITY S
        ON C.CHECK_NO = S.CHECK_NO
            JOIN SCORE SS
            ON S.SCORENO = SS.SCORENO
        JOIN TRANSPORT T
        ON C.CHECK_NO = T.CHECK_NO
            JOIN SCORE ST
            ON T.SCORENO = ST.SCORENO
        JOIN HONJAP H
        ON C.CHECK_NO = H.CHECK_NO
            JOIN SCORE SH
            ON H.SCORENO = SH.SCORENO
WHERE G.GU_NO=1 AND D.DONG_NO=1
GROUP BY G.GUNAME, D.DONGNAME
       , W.MWOLSE, W.DEPOSIT, J.MJEONSE, M.MMAEMAE
       , ((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK)/6)
       , SP.SCORENAME, SS.SCORENAME, ST.SCORENAME, SH.SCORENAME
ORDER BY G.GUNAME, D.DONGNAME ASC;

--==>> View LOCALINFOVIEW이(가) 생성되었습니다.

--○ 순서체크 + GROUP BY 전체 컬럼 별 백업
CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GUNAME "구이름", D.DONGNAME "동이름"
       , (SUM(W.MWOLSE)/COUNT(C.CHECK_NO)) "평균월세", (SUM(W.DEPOSIT)/COUNT(C.CHECK_NO)) "평균월세보증금"
       , (SUM(J.MJEONSE)/COUNT(C.CHECK_NO)) "평균전세", (SUM(M.MMAEMAE)/COUNT(C.CHECK_NO)) "평균매매"
       , (SUM(SS.SCORENAME)/COUNT(C.CHECK_NO)) "평균치안점수", (SUM(ST.SCORENAME)/COUNT(C.CHECK_NO)) "평균대중교통점수"
       , (SUM(SH.SCORENAME)/COUNT(C.CHECK_NO)) "평균교통혼잡도점수"
       , (SUM(((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK))/6)/COUNT(C.CHECK_NO)) "평균생활편의시설점수"
       , (SUM(SP.SCORENAME)/COUNT(C.CHECK_NO)) "평균반려동물점수"
FROM GU G JOIN DONG D
ON G.GU_NO = D.GU_NO
    JOIN CHECKLIST C
    ON D.DONG_NO = C.DONG_NO
        JOIN WOLSE W
        ON C.CHECK_NO = W.CHECK_NO
        JOIN JEONSE J
        ON C.CHECK_NO = J.CHECK_NO
        JOIN MAEMAE M
        ON C.CHECK_NO = M.CHECK_NO
        JOIN SECURITY S
        ON C.CHECK_NO = S.CHECK_NO
            JOIN SCORE SS
            ON S.SCORENO = SS.SCORENO
        JOIN TRANSPORT T
        ON C.CHECK_NO = T.CHECK_NO
            JOIN SCORE ST
            ON T.SCORENO = ST.SCORENO
        JOIN HONJAP H
        ON C.CHECK_NO = H.CHECK_NO
            JOIN SCORE SH
            ON H.SCORENO = SH.SCORENO
        JOIN CONVENIENCE CN
        ON C.CHECK_NO = CN.CHECK_NO
        JOIN PET P
        ON C.CHECK_NO = P.CHECK_NO
            JOIN SCORE SP
            ON P.SCORENO = SP.SCORENO
WHERE G.GU_NO=1 AND D.DONG_NO=1
GROUP BY G.GUNAME, D.DONGNAME
       , W.MWOLSE, W.DEPOSIT, J.MJEONSE, M.MMAEMAE
       , ((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK)/6)
       , SP.SCORENAME, SS.SCORENAME, ST.SCORENAME, SH.SCORENAME
ORDER BY G.GUNAME ASC, D.DONGNAME ASC;





--○ 지역정보 평균 계산 뷰 참고
-- 노션 지역정보 스토리+요구분석서
-- https://www.notion.so/e4951d0031ae4e3eb013fed3b30f0698
-- SELECT "구이름", "동이름", 
--        "평균월세", "평균월세보증금", "평균전세", "평균매매"
--      , "평균생활편의시설점수", "평균반려동물점수", "평균치안점수", "평균대중교통점수","평균교통혼잡도점수" 
-- (SUM(컬럼명) / COUNT(C.CHECK_NO)) = 컬럼 총합 / 체크리스트 총 개수 = 컬럼 평균값

--○ 지역정보 평균 계산 뷰 조회
SELECT *
FROM LOCALINFOVIEW;

--○ 지역정보 평균 계산 뷰 최종 완성본
CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GUNAME "구이름", D.DONGNAME "동이름"
       , (SUM(W.MWOLSE)/COUNT(C.CHECK_NO)) "평균월세", (SUM(W.DEPOSIT)/COUNT(C.CHECK_NO)) "평균월세보증금"
       , (SUM(J.MJEONSE)/COUNT(C.CHECK_NO)) "평균전세", (SUM(M.MMAEMAE)/COUNT(C.CHECK_NO)) "평균매매"
       , (SUM(SS.SCORENAME)/COUNT(C.CHECK_NO)) "평균치안점수", (SUM(ST.SCORENAME)/COUNT(C.CHECK_NO)) "평균대중교통점수"
       , (SUM(SH.SCORENAME)/COUNT(C.CHECK_NO)) "평균교통혼잡도점수"
       , (SUM(((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK))/6)/COUNT(C.CHECK_NO)) "평균생활편의시설점수"
       , (SUM(SP.SCORENAME)/COUNT(C.CHECK_NO)) "평균반려동물점수"
FROM GU G JOIN DONG D
ON G.GU_NO = D.GU_NO
    JOIN CHECKLIST C
    ON D.DONG_NO = C.DONG_NO
        JOIN WOLSE W
        ON C.CHECK_NO = W.CHECK_NO
        JOIN JEONSE J
        ON C.CHECK_NO = J.CHECK_NO
        JOIN MAEMAE M
        ON C.CHECK_NO = M.CHECK_NO
        JOIN SECURITY S
        ON C.CHECK_NO = S.CHECK_NO
            JOIN SCORE SS
            ON S.SCORENO = SS.SCORENO
        JOIN TRANSPORT T
        ON C.CHECK_NO = T.CHECK_NO
            JOIN SCORE ST
            ON T.SCORENO = ST.SCORENO
        JOIN HONJAP H
        ON C.CHECK_NO = H.CHECK_NO
            JOIN SCORE SH
            ON H.SCORENO = SH.SCORENO
        JOIN CONVENIENCE CN
        ON C.CHECK_NO = CN.CHECK_NO
        JOIN PET P
        ON C.CHECK_NO = P.CHECK_NO
            JOIN SCORE SP
            ON P.SCORENO = SP.SCORENO
WHERE G.GU_NO=1 AND D.DONG_NO=1
GROUP BY G.GUNAME, D.DONGNAME
ORDER BY G.GUNAME ASC, D.DONGNAME ASC;
--==>> View LOCALINFOVIEW이(가) 생성되었습니다.

--○ 커밋
COMMIT;
--==>> 커밋 완료.
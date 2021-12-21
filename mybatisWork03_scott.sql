SELECT USER
FROM DUAL;
--==>> SCOTT

--○ 테이블 구성
CREATE TABLE TBL_STUDENT
(SID    NUMBER
, NAME  VARCHAR2(30)
, TEL VARCHAR2(40)
, CONSTRAINT STUDENT_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_STUDENT이(가) 생성되었습니다.

CREATE TABLE TBL_GRADE
(SID    NUMBER
, SUB1  NUMBER(3)
, SUB2  NUMBER(3)
, SUB3  NUMBER(3)
, CONSTRAINT GRADE_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_GRADE이(가) 생성되었습니다.

--○ 뷰 구성

/*
SELECT R.REGIONID, R.REGIONNAME
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE REGIONID=R.REGIONID) AS DELCHECK
FROM REGION R;
*/
--○ STUDENTVIEW 생성
CREATE OR REPLACE VIEW STUDENTVIEW
AS 
SELECT S.SID, S.NAME, S.TEL
    , (SELECT COUNT(*)
       FROM EMPLOYEE
       WHERE S.SID=G.SID) AS SUB
FROM TBL_STUDENT S JOIN TBL_GRADE G
ON S.SID=G.SID;
--==>> View STUDENTVIEW이(가) 생성되었습니다.


/*
-- 2. 과정 정보 출력 VIEW 생성
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

--○ 입력, 출력까지...


--○ GRADEVIEW 생성
CREATE OR REPLACE VIEW GRADEVIEW
AS
SELECT SID, NAME, SUB1, SUB2, SUB3, (SUB1+SUB2+SUB3) "TOT", (SUB1+SUB2+SUB3)/3 "AVG"
     , CASE WHEN (SUB1<60) OR (SUB2<60) OR (SUB3<60) THEN '과락'
            WHEN (SUB1+SUB2+SUB3)/3 < 60 THEN '불합격' 
            WHEN (SUB1+SUB2+SUB3)/3 >= 60 THEN '합격'
            ELSE '알 수 없음'
        END CH
FROM TBL_GRADE G JOIN TBL_STUDENT s
ON G.SID = S.SID;





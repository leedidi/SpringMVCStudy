SELECT USER
FROM DUAL;

SELECT *
FROM TBL_JINHA;

-- ����

-- JOB_HISTORY03 ���̺� ����
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
-- NOT NULL ����..���µ� �������� ������ ����
-- NOT NULL ���� �̸� ������ ����

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
--, CONSTRAINT (���������̸�) FOREIGN KEY(�ش� Ű�� ������ ���� ���̺��� �ش� �÷���)
--              REFERENCES �ش� Ű�� �޾ƿ� ���̺��(�ش� ���̺��� �ش� �÷���) 

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

--Ż�����
CREATE TABLE WITHDRAWAL_WHY
( WIR_NO    NUMBER
, WHY       VARCHAR2(50)    
, CONSTRAINT WITHDRAWAL_WHY_NO PRIMARY KEY(WIR_NO)
);




INSERT INTO WITHDRAWAL_WHY(WIR_NO, WHY) VALUES(1, '������ ���� ����');
INSERT INTO WITHDRAWAL_WHY(WIR_NO, WHY) VALUES(2, '���� �̿� ����');
INSERT INTO WITHDRAWAL_WHY(WIR_NO, WHY) VALUES(3, '�ý��� ���');
INSERT INTO WITHDRAWAL_WHY(WIR_NO, WHY) VALUES(4, '�������� ���� ���');
INSERT INTO WITHDRAWAL_WHY(WIR_NO, WHY) VALUES(5, '��Ÿ');

SELECT *
FROM WITHDRAWAL_WHY;

COMMIT;


-- ���̺��+seq
-- NOTICESEQ

/*
-- ���� ������ ����
CREATE SEQUENCE SEQ_CURRICULUM   -- ������ ���� �⺻ ����
START WITH 1                -- ���۰�
INCREMENT BY 1              -- ������
NOMAXVALUE                  -- �ִ밪 ���� �ȵ�
NOCACHE;                    -- ĳ�� ��� ����(����)
*/



INSERT INTO REPORT_STATUS(STATUS_NO, STATUSNAME)
VALUES(1, '����');

INSERT INTO REPORT_STATUS(STATUS_NO, STATUSNAME)
VALUES(2, '�ݷ�');

INSERT INTO REPORT_STATUS(STATUS_NO, STATUSNAME)
VALUES(3, '�����Ű�');

SELECT *
FROM REPORT_STATUS;

-- �������� ���� ��ƼĿ ������
CREATE SEQUENCE LOCALTAGSEQ   
START WITH 1             
INCREMENT BY 1              
NOMAXVALUE                 
NOCACHE;                    

-- �ϸ�ũ(��������) ������
CREATE SEQUENCE LOCAL_BOOKMARKSEQ
START WITH 1               
INCREMENT BY 1             
NOMAXVALUE                  
NOCACHE;         

-- �ϸ�ũ ��ƼĿ ������
CREATE SEQUENCE CHECKSTICKERSEQ
START WITH 1               
INCREMENT BY 1             
NOMAXVALUE                  
NOCACHE;       

-- üũ����Ʈ ���� ��ƼĿ ������
CREATE SEQUENCE CHECKTAGSEQ   
START WITH 1             
INCREMENT BY 1              
NOMAXVALUE                 
NOCACHE;                    

-- �ϸ�ũ(üũ����Ʈ) ������
CREATE SEQUENCE CHECK_BOOKMARKSEQ  
START WITH 1             
INCREMENT BY 1              
NOMAXVALUE                 
NOCACHE;      

-- Ż��ȸ�� ������
CREATE SEQUENCE WITHDRAWALSEQ  
START WITH 1             
INCREMENT BY 1              
NOMAXVALUE                 
NOCACHE;      

--(�̹� �ۼ�)
-- Ż����� 


-- �������� ��� ��� ��: �ٿ�
/*
-- 1. ������ ���� ��� VIEW
CREATE OR REPLACE VIEW VIEW_PROFESSOR
AS
SELECT P.PRO_NAME "�����ڸ�", S.SUB_NAME "�����Ȱ����", SL.SUB_STARTDATE "���������"
    , SL.SUB_ENDDATE "����������", B.BOOK_NAME "�����", R.ROOM_NO "���ǽǸ�"
    , CASE WHEN SYSDATE - SL.SUB_STARTDATE < 0 THEN '���� ����'
           WHEN SYSDATE - SL.SUB_ENDDATE <= 0 THEN '���� ��'
           WHEN SYSDATE - SL.SUB_ENDDATE > 0 THEN '���� ����'
           ELSE '�� �� ����'
       END "�������࿩��"
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

-- 5. ���� ���� ��� VIEW
--�л� �̸�, ������, �����, ���� �Ⱓ(���� ������, �� ������), ���� ��,
--���, �Ǳ�, �ʱ�, ����, ���
CREATE OR REPLACE VIEW VIEW_SUNGJUK
AS
SELECT T.*, RANK() OVER(PARTITION BY T.������, T.��������� ORDER BY T.���� DESC) "���"
FROM
(
    SELECT SL.PRO_ID "�������̵�", ST.STU_ID "�л����̵�", ST.STU_NAME "�л��̸�", C.CUR_NAME "������"
    , SJ.SUB_NAME "�����", SL.SUB_STARTDATE "���������"
        , SL.SUB_ENDDATE "����������", B.BOOK_NAME "�����", (SC.ATTEND_SCORE * SL.ATTEND_DIV)/100 "���"
        , (SC.PRAC_SCORE * SL.PRAC_DIV)/100 "�Ǳ�", (SC.WRITE_SCORE * SL.WRITE_DIV)/100 "�ʱ�"
        , FN_SCORESUM(SL.LIST_NO, SC.ATTEND_SCORE, SC.PRAC_SCORE, SC.WRITE_SCORE) "����"
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

--�� �������� ��� ��� ��: **�ٿ�**
-- ������ ������ ���ý� ��µǴ� ��
-- ��/�� �������� �� ���̴� �������� ���� ��� ��� �� �ϳ� ����� 
-- WHERE �� ����/��.�� �������� �� �� ���ϼ� �ֵ���...
-- WHERE ���Ǳ��� ���� © �ʿ�� ���� ��ü ������ ��µǴ� �� �ϳ� ����� ��
--@ �̸� ���̺��̸�+VIEW

--�� �������� ��� ��� �� ��ȸ
SELECT *
FROM LOCALINFOVIEW;


/*
CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
-- SELECT (��, ��, �ְź�(����-����),�ְź�(����-������), �ְź�(����), �ְź�(�Ÿ�), ġ��, ���߱���, ����ȥ�⵵)
--        ������ ���(���� Į���� ���� / ���� ���� ������ �Էµ� üũ����Ʈ Į���� �� ����)
FROM
-- ��¼��..����..�ؾߴ�
*/


--�� �������� ��� ��� �� ��ȸ

SELECT *
FROM LOCALINFOVIEW;

SELECT *
FROM GU;

-- SELECT "���̸�", "���̸�", "��տ���-����", "��տ���-������", "�������", 
--       "��ոŸ�", "���ġ��", "��մ��߱���","��ձ���ȥ�⵵", "��ջ�Ȱ���ǽü�", "��չݷ�����"
CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GUNAME "���̸�", D.DONGNAME "���̸�"
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

-- �ϴ�... ����.���� ��� �� ������´㿡 ��� ������?
-- SELECT "���̸�", "���̸�", "��տ���-����", "��տ���-������", "�������", 
--       "��ոŸ�", "���ġ��", "��մ��߱���","��ձ���ȥ�⵵", "��ջ�Ȱ���ǽü�", "��չݷ�����"
CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GUNAME "���̸�", D.DONGNAME "���̸�", C.CHECK_NO "üũ����Ʈ ������ȣ" 
       , W.MWOLSE "����-����", W.DEPOSIT "����-������"
FROM GU G JOIN DONG D
ON G.GU_NO = D.GU_NO
    JOIN CHECKLIST C
    ON D.DONG_NO = C.DONG_NO
        JOIN WOLSE W
        ON C.CHECK_NO = W.CHECK_NO;

/*        
CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GUNAME "���̸�", D.DONGNAME "���̸�", C.CHECK_NO "üũ����Ʈ ������ȣ" 
       , SUM(W.MWOLSE) "����-����", W.DEPOSIT "����-������"
FROM GU G JOIN DONG D
ON G.GU_NO = D.GU_NO
    JOIN CHECKLIST C
    ON D.DONG_NO = C.DONG_NO
        JOIN WOLSE W
        ON C.CHECK_NO = W.CHECK_NO;
*/        

SELECT *
FROM LOCALINFOVIEW;

-- �ϴ�... ����.���� ��� �� ������´㿡 ��� ������?
-- SELECT "���̸�", "���̸�", "��տ���-����", "��տ���-������", "�������", "��ոŸ�"
--      , "��ջ�Ȱ���ǽü�"
--      , "��չݷ�����", "���ġ��", "��մ��߱���","��ձ���ȥ�⵵"
--      , �� �� üũ����Ʈ�� ����? - �̰� ī��Ʈ�� �����ϣ�,,, ������ WHERE���� �ðŴϱ�
-- �� üũ����Ʈ ������ȣ ������ �����ͼ� �̰ɷ� �����ٰ� �ϸ� �ɱ�?    

/*        
JOIN PET P
ON C.CHECK_NO = P.CHECK_NO
JOIN SCORE S
ON P.SCORENO = S.SCORENO;
*/


-- ���........... �ݷ�����~����ȥ�⵵
-- ��ջ�Ȱ ���ǽü��� ���� �ٰ����ͼ� ��^�� ���������ҰŰ������ ��¼��
CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GUNAME "���̸�", D.DONGNAME "���̸�", C.CHECK_NO "üũ����Ʈ ������ȣ" 
       , W.MWOLSE "����-����", W.DEPOSIT "����-������", J.MJEONSE "����", M.MMAEMAE "�Ÿ�"
       , ((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK)/6) "��Ȱ���ǽü�1�����"
       , SP.SCORENAME "�ݷ�����", SS.SCORENAME "ġ��", ST.SCORENAME "���߱���", SH.SCORENAME "����ȥ�⵵"
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
SELECT T.*, RANK() OVER(PARTITION BY T.������, T.��������� ORDER BY T.���� DESC) "���"
FROM
(
    SELECT SL.PRO_ID "�������̵�", ST.STU_ID "�л����̵�", ST.STU_NAME "�л��̸�", C.CUR_NAME "������"
    , SJ.SUB_NAME "�����", SL.SUB_STARTDATE "���������"
        , SL.SUB_ENDDATE "����������", B.BOOK_NAME "�����", (SC.ATTEND_SCORE * SL.ATTEND_DIV)/100 "���"
        , (SC.PRAC_SCORE * SL.PRAC_DIV)/100 "�Ǳ�", (SC.WRITE_SCORE * SL.WRITE_DIV)/100 "�ʱ�"
        , FN_SCORESUM(SL.LIST_NO, SC.ATTEND_SCORE, SC.PRAC_SCORE, SC.WRITE_SCORE) "����"
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
SELECT L.���̸�, L.���̸�, AVG(L.����)
FROM
(
    SELECT G.GU_NO "��������ȣ", D.DONG_NO "��������ȣ"
           , G.GUNAME "���̸�", D.DONGNAME "���̸�", C.CHECK_NO "üũ����Ʈ ������ȣ" 
           , W.MWOLSE "����", W.DEPOSIT "����������", J.MJEONSE "����", M.MMAEMAE "�Ÿ�"
           , ((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK)/6) "��Ȱ���ǽü�1�����"
           , SP.SCORENAME "�ݷ�����", SS.SCORENAME "ġ��", ST.SCORENAME "���߱���", SH.SCORENAME "����ȥ�⵵"
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
WHERE L.��������ȣ='1';


CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GUNAME "���̸�", D.DONGNAME "���̸�", C.CHECK_NO "üũ����Ʈ ������ȣ" 
       , W.MWOLSE "����-����", W.DEPOSIT "����-������", J.MJEONSE "����", M.MMAEMAE "�Ÿ�"
       , ((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK)/6) "��Ȱ���ǽü�1�����"
       , SP.SCORENAME "�ݷ�����", SS.SCORENAME "ġ��", ST.SCORENAME "���߱���", SH.SCORENAME "����ȥ�⵵"
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

--�� ����üũ �� ���� ���
CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GUNAME "���̸�", D.DONGNAME "���̸�"
       , (SUM(W.MWOLSE)/COUNT(C.CHECK_NO)) "��տ���", (SUM(W.DEPOSIT)/COUNT(C.CHECK_NO)) "��տ���������"
       , (SUM(J.MJEONSE)/COUNT(C.CHECK_NO)) "�������", (SUM(M.MMAEMAE)/COUNT(C.CHECK_NO)) "��ոŸ�"
       , (((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK)/6)/COUNT(C.CHECK_NO)) "��ջ�Ȱ���ǽü�����"
       , (SUM(SP.SCORENAME)/COUNT(C.CHECK_NO)) "��չݷ���������", (SUM(SS.SCORENAME)/COUNT(C.CHECK_NO)) "���ġ������"
       , (SUM(ST.SCORENAME)/COUNT(C.CHECK_NO)) "��մ��߱�������", (SUM(SH.SCORENAME)/COUNT(C.CHECK_NO)) "��ձ���ȥ�⵵����"
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

--==>> View LOCALINFOVIEW��(��) �����Ǿ����ϴ�.

--�� ����üũ + GROUP BY ��ü �÷� �� ���
CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GUNAME "���̸�", D.DONGNAME "���̸�"
       , (SUM(W.MWOLSE)/COUNT(C.CHECK_NO)) "��տ���", (SUM(W.DEPOSIT)/COUNT(C.CHECK_NO)) "��տ���������"
       , (SUM(J.MJEONSE)/COUNT(C.CHECK_NO)) "�������", (SUM(M.MMAEMAE)/COUNT(C.CHECK_NO)) "��ոŸ�"
       , (SUM(SS.SCORENAME)/COUNT(C.CHECK_NO)) "���ġ������", (SUM(ST.SCORENAME)/COUNT(C.CHECK_NO)) "��մ��߱�������"
       , (SUM(SH.SCORENAME)/COUNT(C.CHECK_NO)) "��ձ���ȥ�⵵����"
       , (SUM(((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK))/6)/COUNT(C.CHECK_NO)) "��ջ�Ȱ���ǽü�����"
       , (SUM(SP.SCORENAME)/COUNT(C.CHECK_NO)) "��չݷ���������"
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





--�� �������� ��� ��� �� ����
-- ��� �������� ���丮+�䱸�м���
-- https://www.notion.so/e4951d0031ae4e3eb013fed3b30f0698
-- SELECT "���̸�", "���̸�", 
--        "��տ���", "��տ���������", "�������", "��ոŸ�"
--      , "��ջ�Ȱ���ǽü�����", "��չݷ���������", "���ġ������", "��մ��߱�������","��ձ���ȥ�⵵����" 
-- (SUM(�÷���) / COUNT(C.CHECK_NO)) = �÷� ���� / üũ����Ʈ �� ���� = �÷� ��հ�

--�� �������� ��� ��� �� ��ȸ
SELECT *
FROM LOCALINFOVIEW;

--�� �������� ��� ��� �� ���� �ϼ���
CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GUNAME "���̸�", D.DONGNAME "���̸�"
       , (SUM(W.MWOLSE)/COUNT(C.CHECK_NO)) "��տ���", (SUM(W.DEPOSIT)/COUNT(C.CHECK_NO)) "��տ���������"
       , (SUM(J.MJEONSE)/COUNT(C.CHECK_NO)) "�������", (SUM(M.MMAEMAE)/COUNT(C.CHECK_NO)) "��ոŸ�"
       , (SUM(SS.SCORENAME)/COUNT(C.CHECK_NO)) "���ġ������", (SUM(ST.SCORENAME)/COUNT(C.CHECK_NO)) "��մ��߱�������"
       , (SUM(SH.SCORENAME)/COUNT(C.CHECK_NO)) "��ձ���ȥ�⵵����"
       , (SUM(((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK))/6)/COUNT(C.CHECK_NO)) "��ջ�Ȱ���ǽü�����"
       , (SUM(SP.SCORENAME)/COUNT(C.CHECK_NO)) "��չݷ���������"
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
--==>> View LOCALINFOVIEW��(��) �����Ǿ����ϴ�.

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.
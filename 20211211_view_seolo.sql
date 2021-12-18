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

--�� �������� ��� ��� �� �� �ϼ���
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

--�� �������� ��� ��� �� ���� �ϼ��� ���� �Ϸ� ������
--�� �� "������" ����� �ϱ�! 
--�� �ƴ� �����غ��ϱ� �̰� ��ü�� üũ����Ʈ �ѹ��� ������ �ȵ� �� �׸��� �Ⱦ�����鵵 ������ �����ϱ�...
CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GUNAME "GUNAME", D.DONGNAME "DONGNAME"
       , (SUM(W.MWOLSE)/COUNT(W.CHECK_NO)) "WOLSEAVG", (SUM(W.DEPOSIT)/COUNT(W.CHECK_NO)) "WOLSEDEPOSITAVG"
       , (SUM(J.MJEONSE)/COUNT(J.CHECK_NO)) "JEONSEAVG", (SUM(M.MMAEMAE)/COUNT(M.CHECK_NO)) "MAEMAEAVG"
       , (SUM(SS.SCORENAME)/COUNT(S.CHECK_NO)) "SECURITYAVG", (SUM(ST.SCORENAME)/COUNT(T.CHECK_NO)) "TRANSPORTAVG"
       , (SUM(SH.SCORENAME)/COUNT(H.CHECK_NO)) "HONJAPAVG"
       , (SUM(((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK))/6)/COUNT(CN.CHECK_NO)) "CONVENIENCEAVG"
       , (SUM(SP.SCORENAME)/COUNT(P.CHECK_NO)) "PETAVG"
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


CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GUNAME "���̸�", D.DONGNAME "���̸�"
       , W.MWOLSE "����", W.DEPOSIT "����������"
       , J.MJEONSE "����", M.MMAEMAE "�Ÿ�"
       , SS.SCORENAME "ġ������", ST.SCORENAME "���߱�������"
       , SH.SCORENAME "����ȥ�⵵����"
       , ((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK)/6) "��Ȱ���ǽü�����1��"
       , SP.SCORENAME "�ݷ���������"
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
            ON P.SCORENO = SP.SCORENO;

/*
CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT L.���̸�, L.���̸�, L.����/L.��������
FROM
(
    SELECT G.GUNAME "���̸�", D.DONGNAME "���̸�"
           , W.MWOLSE "����", W.DEPOSIT "����������", COUNT(W.CHECK_NO) "��������"
           , J.MJEONSE "����", M.MMAEMAE "�Ÿ�"
           , SS.SCORENAME "ġ������", ST.SCORENAME "���߱�������"
           , SH.SCORENAME "����ȥ�⵵����"
           , ((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK)/6) "��Ȱ���ǽü�����1��"
           , SP.SCORENAME "�ݷ���������"
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
          GROUP BY G.GUNAME, D.DONGNAME, W.MWOLSE, W.DEPOSIT, J.MJEONSE, 
          M.MMAEMAE, SS.SCORENAME, ST.SCORENAME, SH.SCORENAME, 
          ((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK)/6), SP.SCORENAME
) L
GROUP BY L.���̸�, L.���̸�;
--WHERE L.��������ȣ='1';
*/
--> ���� ��� �������� ������,,, �н�!^��^


--�� �ٿ� : �������� ��� ��� ��
-- Ȯ���ؾ� �� ���� : ���̸�, ���̸�, ��տ���, ��տ���������, �������, ��ոŸ�
--                  , ���ġ������, ��մ��߱�������, ��ձ���ȥ�⵵����, ��ջ�Ȱ���ǽü�����, ��չݷ���������
-- SELECT "���̸�", "���̸�", 
--        "��տ���", "��տ���������"
--      , "�������", "��ոŸ�"
--      , "���ġ������", "��մ��߱�������"
--      , "��ձ���ȥ�⵵����" 
--      , "��ջ�Ȱ���ǽü�����", 
--      , "��չݷ���������"
-- SUM(�÷���) / COUNT(*.CHECK_NO) = 
-- �÷� ���� / �� ���̺�(����,����, �Ÿ�...)�� üũ����Ʈ ������ȣ �� ���� = �� �÷��� ��հ�

--�� �������� ��� ��� �� ��ȸ
SELECT *
FROM LOCALINFOVIEW;

--�� �������� ��� ��� �� ���� �ϼ���
CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GUNAME "GUNAME", D.DONGNAME "DONGNAME"
       , (SUM(W.MWOLSE)/COUNT(W.CHECK_NO)) "WOLSEAVG", (SUM(W.DEPOSIT)/COUNT(W.CHECK_NO)) "WOLSEDEPOSITAVG"
       , (SUM(J.MJEONSE)/COUNT(J.CHECK_NO)) "JEONSEAVG", (SUM(M.MMAEMAE)/COUNT(M.CHECK_NO)) "MAEMAEAVG"
       , (SUM(SS.SCORENAME)/COUNT(S.CHECK_NO)) "SECURITYAVG", (SUM(ST.SCORENAME)/COUNT(T.CHECK_NO)) "TRANSPORTAVG"
       , (SUM(SH.SCORENAME)/COUNT(H.CHECK_NO)) "HONJAPAVG"
       , (SUM(((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK))/6)/COUNT(CN.CHECK_NO)) "CONVENIENCEAVG"
       , (SUM(SP.SCORENAME)/COUNT(P.CHECK_NO)) "PETAVG"
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
--* �� ���� �� Ŀ�� �س����ϴ�!

/*
--23. �л� ���� ���� ���ν��� (Ȯ��)
CREATE OR REPLACE PROCEDURE PRC_STU_INSERT
( V_ID          IN STUDENT.STU_ID%TYPE 
, V_NAME        IN STUDENT.STU_NAME%TYPE
, V_FIRSTSSN    IN STUDENT.STU_FIRSTSSN%TYPE
, V_LASTSSN     IN STUDENT.STU_LASTSSN%TYPE
)
IS  
    TEMP_ID  NUMBER;
    TEMP_NUM NUMBER;
    
    ID_ERROR EXCEPTION;
    SSN_ERROR EXCEPTION;
    SSN_NUM_ERROR EXCEPTION;
    
BEGIN
    --�ߺ�ID   
    SELECT COUNT(*) INTO TEMP_ID
    FROM STUDENT
    WHERE STU_ID = V_ID;

    IF (TEMP_ID != 0)
        THEN RAISE ID_ERROR;
    END IF;
    
    --�ߺ� �ֹι�ȣ
    SELECT COUNT(*) INTO TEMP_NUM
    FROM STUDENT
    WHERE STU_FIRSTSSN = V_FIRSTSSN
      AND STU_LASTSSN = V_LASTSSN;
    
    IF (TEMP_NUM != 0)
        THEN RAISE SSN_ERROR;
    END IF;
    
    --�ֹι�ȣ �ڸ��� ���� �� ���ڸ� ù����(1~6)
    --5,6 �ܱ��ι�ȣ
    IF (LENGTH(V_FIRSTSSN) != 6 OR LENGTH(V_LASTSSN) != 7
        OR SUBSTR(V_LASTSSN, 1, 1) NOT IN ('1', '2', '3', '4', '5', '6'))
        THEN RAISE SSN_NUM_ERROR;
    END IF;
    
    
    --INSERT
    INSERT INTO STUDENT(STU_ID, STU_NAME, STU_FIRSTSSN, STU_LASTSSN)
    VALUES(V_ID, V_NAME, V_FIRSTSSN, V_LASTSSN);
    
    COMMIT;
    
    
    --����ó��
    EXCEPTION
        WHEN ID_ERROR
            THEN RAISE_APPLICATION_ERROR(-20018, '�̹� ��ϵ� ID�Դϴ�.');
                ROLLBACK;
        WHEN SSN_ERROR
            THEN RAISE_APPLICATION_ERROR(-20017, '�̹� ��ϵ� �л��Դϴ�.');
                ROLLBACK;  
        WHEN SSN_NUM_ERROR       
            THEN RAISE_APPLICATION_ERROR(-20002, '�Է��� �ֹι�ȣ�� ��ġ���� �ʽ��ϴ�.');
                ROLLBACK;
        WHEN OTHERS THEN ROLLBACK;
            
END;
--==>> Procedure PRC_STU_INSERT��(��) �����ϵǾ����ϴ�.
*/
        
        
        
--�� �������� ��� ��� �� ��ȸ
SELECT *
FROM LOCALINFOVIEW
WHERE DONGNO=1111011900;

--�� �������� ��� ��� �� ���� �ϼ��� ������...
CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GU_NO "GUNO", D.DONG_NO "DONGNO", G.GUNAME "GUNAME", D.DONGNAME "DONGNAME"
       , (SUM(W.MWOLSE)/COUNT(W.CHECK_NO)) "WOLSEAVG", (SUM(W.DEPOSIT)/COUNT(W.CHECK_NO)) "WOLSEDEPOSITAVG"
       , (SUM(J.MJEONSE)/COUNT(J.CHECK_NO)) "JEONSEAVG", (SUM(M.MMAEMAE)/COUNT(M.CHECK_NO)) "MAEMAEAVG"
       , (SUM(SS.SCORENAME)/COUNT(S.CHECK_NO)) "SECURITYAVG", (SUM(ST.SCORENAME)/COUNT(T.CHECK_NO)) "TRANSPORTAVG"
       , (SUM(SH.SCORENAME)/COUNT(H.CHECK_NO)) "HONJAPAVG"
       , (SUM(((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK))/6)/COUNT(CN.CHECK_NO)) "CONVENIENCEAVG"
       , (SUM(SP.SCORENAME)/COUNT(P.CHECK_NO)) "PETAVG"
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
GROUP BY G.GU_NO, D.DONG_NO, G.GUNAME, D.DONGNAME
ORDER BY G.GUNAME ASC, D.DONGNAME ASC;
--==>> View LOCALINFOVIEW��(��) �����Ǿ����ϴ�.
--* �� ���� �� Ŀ�� �س����ϴ�!

--WHERE D.DONG_NO=1111011900
--��հ� ����� ������ ������
SELECT * FROM VIEW_CHECKLIST;

/*select * from �ϰ������ where check_no=1 and ac_no=2*/

SELECT *
FROM WOLSE;

SELECT SUM(MWOLSE)/COUNT(CHECK_NO)
FROM WOLSE;

SELECT * FROM VIEW_CHECKLIST;

SELECT *
FROM LOCALINFOVIEW
WHERE DONGNO=1111011900
ORDER BY GUNAME ASC, DONGNAME ASC;
-- �̰� 40�ΰ� ��������... �ڿ��� NULL�̶� �� �����µ� ^��^

CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GU_NO "GUNO", D.DONG_NO "DONGNO", SUM(W.MWOLSE) "��������", COUNT(W.CHECK_NO) "�ѹ��Ѽ�"
FROM GU G JOIN DONG D
ON G.GU_NO = D.GU_NO
    JOIN CHECKLIST C
    ON D.DONG_NO = C.DONG_NO
        JOIN WOLSE W
        ON C.CHECK_NO = W.CHECK_NO
GROUP BY G.GU_NO, D.DONG_NO, G.GUNAME, D.DONGNAME
ORDER BY G.GUNAME ASC, D.DONGNAME ASC;
-- �̰� 40�ΰ� ��������... �ڿ��� NULL�̶� �� �����µ� ^��^ �̷����ϸ� ���� ����!
-- �ڰ� NULL �̶� ���� �� �ֵ���.... �����...�ҵ�....

SELECT *
FROM PERSONAL;


CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GU_NO "GUNO", D.DONG_NO "DONGNO", G.GUNAME "GUNAME", D.DONGNAME "DONGNAME"
       , (SUM(W.MWOLSE)/COUNT(W.CHECK_NO)) "WOLSEAVG", (SUM(W.DEPOSIT)/COUNT(W.CHECK_NO)) "WOLSEDEPOSITAVG"
       , (SUM(J.MJEONSE)/COUNT(J.CHECK_NO)) "JEONSEAVG", (SUM(M.MMAEMAE)/COUNT(M.CHECK_NO)) "MAEMAEAVG"
       , (SUM(SS.SCORENAME)/COUNT(S.CHECK_NO)) "SECURITYAVG", (SUM(ST.SCORENAME)/COUNT(T.CHECK_NO)) "TRANSPORTAVG"
       , (SUM(SH.SCORENAME)/COUNT(H.CHECK_NO)) "HONJAPAVG"
       , (SUM((((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK))/6)*5)/COUNT(CN.CHECK_NO)) "CONVENIENCEAVG"
       , (SUM(SP.SCORENAME)/COUNT(P.CHECK_NO)) "PETAVG"
FROM GU G JOIN DONG D
ON G.GU_NO = D.GU_NO
    JOIN CHECKLIST C
    ON D.DONG_NO = C.DONG_NO
        LEFT OUTER JOIN WOLSE W
        ON C.CHECK_NO = W.CHECK_NO
        LEFT OUTER JOIN JEONSE J
        ON C.CHECK_NO = J.CHECK_NO
        LEFT OUTER JOIN MAEMAE M
        ON C.CHECK_NO = M.CHECK_NO
        LEFT OUTER JOIN SECURITY S
        ON C.CHECK_NO = S.CHECK_NO
            LEFT OUTER JOIN SCORE SS
            ON S.SCORENO = SS.SCORENO
        LEFT OUTER JOIN TRANSPORT T
        ON C.CHECK_NO = T.CHECK_NO
            LEFT OUTER JOIN SCORE ST
            ON T.SCORENO = ST.SCORENO
        LEFT OUTER JOIN HONJAP H
        ON C.CHECK_NO = H.CHECK_NO
            LEFT OUTER JOIN SCORE SH
            ON H.SCORENO = SH.SCORENO
        LEFT OUTER JOIN CONVENIENCE CN
        ON C.CHECK_NO = CN.CHECK_NO
        LEFT OUTER JOIN PET P
        ON C.CHECK_NO = P.CHECK_NO
            LEFT OUTER JOIN SCORE SP
            ON P.SCORENO = SP.SCORENO
GROUP BY G.GU_NO, D.DONG_NO, G.GUNAME, D.DONGNAME;

--UNION ���...?
/*
SELECT RG.REGRADE_NO, NVL(R.COUNT, 0) AS COUNT
FROM 
(
    SELECT REGRADE_NO
    FROM REVIEWVIEW
    
    UNION 
    
    SELECT REGRADE_NO
    FROM REVIEWGRADE
) RG
FULL OUTER JOIN
(
    SELECT REGRADE_NO, COUNT(*) AS COUNT
    FROM REVIEWVIEW
    GROUP BY REGRADE_NO
) R
ON RG.REGRADE_NO = R.REGRADE_NO;
*/

--==>>
/*
      GUNO     DONGNO GUNAME                         DONGNAME                         WOLSEAVG WOLSEDEPOSITAVG  JEONSEAVG  MAEMAEAVG SECURITYAVG TRANSPORTAVG  HONJAPAVG CONVENIENCEAVG     PETAVG
---------- ---------- ------------------------------ ------------------------------ ---------- --------------- ---------- ---------- ----------- ------------ ---------- -------------- ----------
        23 1111011900 ���α�                         ������                         48.3333333      2166.66667      15500      54000        2.25          4.5        2.5     1.94444444          4
*/
SELECT *
FROM LOCALINFOVIEW
WHERE DONGNO=1111011900;

SELECT *
FROM CONVENIENCE;






/*
      GUNO     DONGNO GUNAME                         DONGNAME                         WOLSEAVG WOLSEDEPOSITAVG  JEONSEAVG  MAEMAEAVG SECURITYAVG TRANSPORTAVG  HONJAPAVG CONVENIENCEAVG     PETAVG
---------- ---------- ------------------------------ ------------------------------ ---------- --------------- ---------- ---------- ----------- ------------ ---------- -------------- ----------
        23 1111011900 ���α�                         ������                         48.3333333      2166.66667      15500      54000        2.25          4.5        2.5     1.94444444          4
*/

SELECT SUM(MWOLSE)/COUNT(CHECK_NO)
FROM WOLSE;
--==>> 48.33333333333333333333333333333333333333

SELECT SUM(DEPOSIT)/COUNT(CHECK_NO)
FROM WOLSE;
--==>> 2166.666666666666666666666666666666666667

SELECT SUM(MJEONSE)/COUNT(CHECK_NO)
FROM JEONSE;
--==>> 15500

SELECT SUM(MMAEMAE)/COUNT(CHECK_NO)
FROM MAEMAE;
--==>> 54000

SELECT SUM(SC.SCORENAME)/COUNT(SE.CHECK_NO)
FROM SECURITY SE JOIN SCORE SC
ON SE.SCORENO = SC.SCORENO;

SELECT *
FROM SECURITY;
SELECT *
FROM SCORE
WHERE SCORENO = 5 OR SCORENO= 6;
--==> 2.25 

SELECT *
FROM TRANSPORT;
SELECT *
FROM SCORE
WHERE SCORENO = 9 OR SCORENO= 11;
--==> 4,5 -> 4.5

SELECT *
FROM SCORE;



SELECT *
FROM HONJAP;
SELECT *
FROM SCORE
WHERE SCORENO = 5 OR SCORENO= 7;
--==>> 2.3 -> 2.5

SELECT *
FROM CONVENIENCE;
--==> 1.94444444

SELECT *
FROM PET;
SELECT *
FROM SCORE
WHERE SCORENO = 9 OR SCORENO= 8 OR SCORENO=10;
--==>> 4
 
SELECT *
FROM CONVENIENCE;

SELECT * FROM VIEW_CHECKLIST;


--�� ���� �Ϸẻ
--�� ��� ��꺻
--�� COUNT(�÷���)�� ����ϸ� NULL ���� �����ϰ� COUNT �մϴ�. COUNT(*)�� ����ϸ� NULL�� �����Ͽ� ���� COUNT �մϴ�.
-- ������, �� ���ڿ��� COUNT() ����� ���Ե˴ϴ�. �� ���ڿ��� COUNT() ������� ������ �� ���ڿ��� NULL�� �ٲٰ� COUNT()�� �ϸ� �˴ϴ�.

CREATE OR REPLACE VIEW LOCALINFOVIEW
AS
SELECT G.GU_NO "GUNO", D.DONG_NO "DONGNO", G.GUNAME "GUNAME", D.DONGNAME "DONGNAME"
       , (SUM(W.MWOLSE)/COUNT(W.CHECK_NO)) "WOLSEAVG", (SUM(W.DEPOSIT)/COUNT(W.CHECK_NO)) "WOLSEDEPOSITAVG"
       , (SUM(J.MJEONSE)/COUNT(J.CHECK_NO)) "JEONSEAVG", (SUM(M.MMAEMAE)/COUNT(M.CHECK_NO)) "MAEMAEAVG"
       , (SUM(SS.SCORENAME)/COUNT(S.CHECK_NO)) "SECURITYAVG", (SUM(ST.SCORENAME)/COUNT(T.CHECK_NO)) "TRANSPORTAVG"
       , (SUM(SH.SCORENAME)/COUNT(H.CHECK_NO)) "HONJAPAVG"
       , (SUM((((CN.MART+CN.LAUNDRY+CN.HOSPITAL+CN.FOOD+CN.CULTURE+CN.PARK))/6)*5)/COUNT(CN.CHECK_NO)) "CONVENIENCEAVG"
       , (SUM(SP.SCORENAME)/COUNT(P.CHECK_NO)) "PETAVG"
FROM GU G JOIN DONG D
ON G.GU_NO = D.GU_NO
    JOIN CHECKLIST C
    ON D.DONG_NO = C.DONG_NO
        LEFT OUTER JOIN WOLSE W
        ON C.CHECK_NO = W.CHECK_NO
        LEFT OUTER JOIN JEONSE J
        ON C.CHECK_NO = J.CHECK_NO
        LEFT OUTER JOIN MAEMAE M
        ON C.CHECK_NO = M.CHECK_NO
        LEFT OUTER JOIN SECURITY S
        ON C.CHECK_NO = S.CHECK_NO
            LEFT OUTER JOIN SCORE SS
            ON S.SCORENO = SS.SCORENO
        LEFT OUTER JOIN TRANSPORT T
        ON C.CHECK_NO = T.CHECK_NO
            LEFT OUTER JOIN SCORE ST
            ON T.SCORENO = ST.SCORENO
        LEFT OUTER JOIN HONJAP H
        ON C.CHECK_NO = H.CHECK_NO
            LEFT OUTER JOIN SCORE SH
            ON H.SCORENO = SH.SCORENO
        LEFT OUTER JOIN CONVENIENCE CN
        ON C.CHECK_NO = CN.CHECK_NO
        LEFT OUTER JOIN PET P
        ON C.CHECK_NO = P.CHECK_NO
            LEFT OUTER JOIN SCORE SP
            ON P.SCORENO = SP.SCORENO
GROUP BY G.GU_NO, D.DONG_NO, G.GUNAME, D.DONGNAME;


SELECT *
FROM PERSONAL;

/*
CREATE OR REPLACE PROCEDURE PRC_ACCOUNT_CREATE
( 
-- �Ű����� : �Է¹��� �ֵ� - ��������
    V_PE_ID         IN PERSONAL.PE_ID%TYPE
,   V_NAME          IN PERSONAL.NAME%TYPE
,   V_TEL           IN PERSONAL.TEL%TYPE
,   V_NICKNAME      IN PERSONAL.NICKNAME%TYPE
,   V_PW            IN PERSONAL.PW%TYPE
,   V_EMAIL         IN PERSONAL.EMAIL%TYPE
,   V_ROADADDR      IN PERSONAL.ROADADDR%TYPE
,   V_DETAILADDR    IN PERSONAL.DETAILADDR%TYPE
,   V_PROFILE       IN PERSONAL.PROFILE%TYPE
,   V_PEDATE      IN PERSONAL.PEDATE%TYPE


-- �������� �Է��� �̷������ ����������ȣ���� �߰���
)
IS  
    -- ���� ����
    V_AC_NO         NUMBER;


-- ����� �� �ʿ��� ��
-- EXCEPTION
-- �ߺ� �ȵǰ� �ؾߵǴ� �� -> ���̵�, ��ȭ��ȣ, �г���
    TEMP_ID         NUMBER;
    TEMP_TEL        NUMBER;
    TEMP_NICKNAME   VARCHAR2(30);
-- TEMP�� ���İ��°ǵ� 0�̶� 1�� �޾Ƽ�
-- ���� ���� Ȯ��
-- �ؿ� COUNT(*)�̰� 0�̳� 1

    -- ���� ����
    ID_CREATE_ERROR         EXCEPTION; 
    TEL_CREATE_ERROR        EXCEPTION;  
    NICKNAME_CREATE_ERROR   EXCEPTION;
    
BEGIN

    -- ���� �ڵ� �ڵ����� ���� ��ȸ
    SELECT NVL(MAX(AC_NO),0) INTO V_AC_NO
    FROM ACCOUNT;


    -- �ߺ� ���̵� Ȯ��
    SELECT COUNT(*) INTO TEMP_ID
    FROM PERSONAL
    WHERE PE_ID = V_PE_ID;
    -- PE_ID ����//  V_PE_ID ���� �Է��� ��
    IF (TEMP_ID != 0)
        THEN RAISE ID_CREATE_ERROR;
    END IF;
    
    -- �ߺ� ��ȭ��ȣ
    SELECT COUNT(*) INTO TEMP_TEL
    FROM PERSONAL
    WHERE TEL = V_TEL;
    IF (TEMP_TEL != 0)
        THEN RAISE TEL_CREATE_ERROR;
    END IF;
    
    -- �ߺ� �г���
    SELECT COUNT(*) INTO TEMP_NICKNAME
    FROM PERSONAL
    WHERE NICKNAME = V_NICKNAME;
    IF (TEMP_NICKNAME != 0)
        THEN RAISE NICKNAME_CREATE_ERROR;
    END IF;


    -- �������� ���̺� INSERT
    
    INSERT INTO ACCOUNT(AC_NO) VALUES(V_AC_NO);
    
    
    -- ���� ���̺� INSERT ******
    INSERT INTO PERSONAL(AC_NO, PE_ID, NAME, TEL, NICKNAME, PW, EMAIL, ROADADDR, DETAILADDR, PROFILE, PEDATE)
        VALUES(V_AC_NO+1, V_PE_ID, V_NAME, V_TEL, V_NICKNAME, V_PW, V_EMAIL, V_ROADADDR, V_DETAILADDR, V_PROFILE, V_PEDATE);
    

    -- ����ó��
    -- ���̵�, ��ȭ��ȣ, �г���
    EXCEPTION
        WHEN ID_CREATE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001,'�̹� ��ϵ� ID �Դϴ�.');
        ROLLBACK;
        WHEN TEL_CREATE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002,'�̹� ��ϵ� TEL �Դϴ�.');
        ROLLBACK;
        WHEN NICKNAME_CREATE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '�̹� ��ϵ� NICKNAME �Դϴ�.');
        ROLLBACK;  
        
        WHEN OTHERS THEN ROLLBACK;
END;


rollback;
*/
SELECT *
FROM PERSONAL;

SELECT *
FROM ACCOUNT;

DELETE
FROM ACCOUNT
WHERE AC_NO=5;

EXEC PRC_ACCOUNT_CREATE
('test001', '�׽�Ʈ', '010-1122-2233', 'tesstt','java006$','test001@test.com',
'����� ������ ������ 247-86','1��','001.jpg',TO_DATE('2021-06-01', 'YYYY-MM-DD'));
EXEC PRC_ACCOUNT_CREATE
('test001', '�׽�Ʈ', '010-1122-2233', '���۸�','java006$','test001@test.com',
'����� ������ ������ 247-86','1��','001.jpg',TO_DATE('2021-06-01', 'YYYY-MM-DD'));

COMMIT;

INSERT INTO ACCOUNT(AC_NO) VALUES(5);


-- �Ű� ��
--CREATE OR REPLACE VIEW REPORTVIEW
--AS
--SELECT RCHECK_NO
--FROM REPORT_CHECK;

CREATE OR REPLACE VIEW VIEW_REPORT
AS
SELECT ROWNUM AS RNUM, TITLE, STATUSNAME, REPORTDATE, REPORTER, WRITER, RPCHECK_NO, WHY
FROM
(
    SELECT W.TITLE AS TITLE, S.STATUSNAME AS STATUSNAME, R.REPORTDATE AS REPORTDATE
    , R.AC_NO AS REPORTER, C.AC_NO AS WRITER, R.RPCHECK_NO AS RPCHECK_NO, R.WHY AS WHY
    FROM REPORT_CHECK R, REPORT_WHY W, REPORT_STATUS S, CHECKLIST C
    WHERE R.WHY_NO = W.WHY_NO(+)
      AND R.STATUS_NO = S.STATUS_NO(+)
      AND R.CHECK_NO = C.CHECK_NO(+)
);
--==>> View VIEW_REPORT��(��) �����Ǿ����ϴ�.
-- �� ���� : �Ű����, ����, �Ű��Ͻ�, �Ű���(REPORTER), �����ۼ���(WRITER), �Ű������ȣ, �󼼻���

-- �Ű� �������� Ȯ���ϴ� �÷� : ���� ���� ���� ���� ��¥ �ð� 
-- ������ ��ġ�� �� �����ϰ� �˾�â���� Ȯ���ϴ� �÷� : �Ű��� �����ۼ��� �Ű������ȣ �󼼻���

-- �Ű���� �� �ּҴ� ���߿� �߰��ϱ�� �ؼ� �� �־���,
-- ������ ���Ϸ��� � �Ű� ���̺� ���� �Ű������� Ȯ���ؾ� �ϴµ�, 
-- �ϴ� üũ����Ʈ�� ���ؼ��� �Ű� ����� �Ŷ� 
-- ������ ���ؼ��� ��ŵ�߾�

--==>> 1	�弳/�νŰ���	����	2021-12-13	2	1	1	������ ���ڱ� ���� �߾��
-- �Ű� ���� �ּҴ� ���߿� �� ������� �ǵڿ� ���ڰ� ������... �̷��� �޾ƿ͵� �ɰŰ��� �ϴ�..
-- �ϴ� �Ű� ���� �ּҴ� �н�!

--==>> 
/*
1. ����
2. �ݷ�
3. �����Ű�

- ����ε�� �츮�� ���� �ʿ� ����!
- �Ű� ó�� ���°� null �̸� ���ذ�, ���� �ִٸ� �ذ� ����!

*/

-- �Ű���, �Ű������ ���̵� �����Ը� ������ (���� �ϼ��� �ڡڡ�)
-- �� ���� : �Ű����, ����, �Ű��Ͻ�, �Ű���(REPORTER), �Ű���ID, �����ۼ���(WRITER), �����ۼ���ID, �Ű������ȣ, �󼼻���
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

--�� ������ �� Ȯ��
SELECT *
FROM VIEW_REPORT;
------------------------------------

SELECT *
FROM PERSONAL;

SELECT *
FROM ACCOUNT;

COMMIT;

INSERT INTO PERSONAL(PE_ID, AC_NO, NAME, TEL, NICKNAME, PW, EMAIL, ROADADDR, DETAILADDR, PROFILE, PEDATE)
VALUES(union22, 2, ���Ѻ�, 010-9345-2234, �������, java006$, kimstar22@test.com, ���� ������ �Ｚ�� 150, 105�� 101ȣ, 002.jpg,SYSDATE);

INSERT INTO PERSONAL(PE_ID, AC_NO, NAME, TEL, NICKNAME, PW, EMAIL, ROADADDR, DETAILADDR, PEDATE)
VALUES('union22', 2, '���Ѻ�', '010-9345-2234', '����鰳', 'java006$', 'kimstar22@test.com', '���� ������ �Ｚ�� 150', '105�� 101ȣ', SYSDATE);

INSERT INTO PERSONAL(PE_ID, AC_NO, NAME, TEL, NICKNAME, PW, EMAIL, ROADADDR, DETAILADDR, PEDATE)
VALUES('black33', 3, '�ڼ���', '010-3332-1133', '�����Ӵ�', 'java006$', 'money31@test.com', '���� ���� ���Ϸ� 796', '306�� 1302ȣ', SYSDATE);




-- �������� ��
CREATE OR REPLACE VIEW VIEW_NOTICE
AS 
SELECT NO.NO_NO"NOTICE_NO", NO.TITLE"NOTICE_TITLE", NOSO.NOS_NO"NOTICESORT_NO"
     ,NO.CONTENT"NOTICE_CONTENT", NO.NODATE"NOTICE_DATE"
FROM NOTICE NO LEFT JOIN NOTICE_SORT NOSO  
ON NO.NOS_NO = NOSO.NOS_NO;


-- Ż��ȸ�� ��
CREATE OR REPLACE VIEW VIEW_WITHDRAWAL
AS 
SELECT WI.ID"WITHDRAWAL_ID",PE.NICKNAME"NICKNAME", WI.TEL"WITHDRAWAL_TEL", PE.EMAIL"EMAIL", WI.NAME"WITHDRAWAL_NAME"
, WI.WIDATE"WITHDRAWAL_DATE", WI.WI_NO"WITHDRAWAL_NO", WIWY.WIR_NO"REASON_NO"
FROM WITHDRAWAL WI LEFT JOIN WITHDRAWAL_WHY WIWY 
ON WI.WIR_NO = WIWY.WIR_NO
    LEFT JOIN PERSONAL PE ON PE.AC_NO=WI.AC_NO;


-- ���ֹ��� ���� ��
CREATE OR REPLACE VIEW VIEW_FAQ
AS 
SELECT FA.FAQ_NO"FAQ_NO", FA.TITLE"FAQ_TITLE", FA.CONTENT"FAQ_CONTENT"
     , FASO.QS_NO"FAQSORT_NO"
FROM FAQ FA LEFT JOIN FAQ_SORT FASO  
ON FA.QS_NO = FASO.QS_NO;





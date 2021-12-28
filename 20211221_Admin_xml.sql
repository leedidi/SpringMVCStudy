SELECT *
FROM ADMIN;

SELECT *
FROM NOTICE_SORT;

SELECT USER
FROM DUAL;
--==>> TEAM_SEOLO

-- ����Ʈ ��ȸ
-- ����   ���� �з�   ����   �ۼ���   ��¥
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE;

--�������� ������
CREATE SEQUENCE NOTICESEQ
NOCACHE;

SELECT *
FROM USER SEQUENCES;

SELECT * FROM USER_SEQUENCES;   

--�������� �з� ����
-- ��������
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE
WHERE NOTICESORT_NO=1;
-- ����
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE
WHERE NOTICESORT_NO=2;



INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin1', 2, '2021-10-15 ���� ���� �˸�', '2021-10-15 1:00 - 3:00 ���� �����Դϴ�. ȸ�� �������� ���ظ� ��Ź�帳�ϴ�.', TO_DATE('2021-10-10', 'YYYY-MM-DD')); 

INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin2', 2, '2021-11-20 ���� ���� �˸�', '2021-11-20 2:00 - 3:00 ���� �����Դϴ�. ȸ�� �������� ���ظ� ��Ź�帳�ϴ�.', TO_DATE('2021-11-15', 'YYYY-MM-DD')); 

INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin2', 2, '2021-12-25 ���� ���� �˸�', '2021-11-20 2:00 - 3:00 ���� �����Դϴ�. ȸ�� �������� ���ظ� ��Ź�帳�ϴ�.', TO_DATE('2021-12-20', 'YYYY-MM-DD')); 

commit;

select *
from notice;


--�� �������� ����
SELECT USER
FROM DUAL;
--==>> TEAM_SEOLO

-- ����Ʈ ��ȸ
-- ����   ���� �з�   ����   �ۼ���   ��¥
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE;

--�������� ������
CREATE SEQUENCE NOTICESEQ
NOCACHE;

SELECT *
FROM USER SEQUENCES;

SELECT * FROM USER_SEQUENCES;   

--�������� �з� ����
-- ��������
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE
WHERE NOTICESORT_NO=1;
-- ����
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE
WHERE NOTICESORT_NO=2;



INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin1', 1, '2021�� 09�� �̺�Ʈ', '���Ӱ� �����ϴ� ���� ������ ���� ���� ��Ź�帳�ϴ�.', SYSDATE); 
INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin2', 1, '��������ó����ħ ���� �ȳ�', '��3��(�������� ��ȣ ��Ģ) �� �ٲ� ���� ���� ������ ������ �����Դϴ�.', SYSDATE); 
INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin1', 1, '2021�� 10�� �̺�Ʈ', '���������� �����ϴ� ���� �������� ������ּż� �����մϴ�.', SYSDATE); 

----->>
SELECT *
FROM NOTICE;

UPDATE NOTICE
SET
CONTENT = '���������� �����ϴ� ���� �������� ������ּż� �����մϴ�.'
WHERE
NO_NO = 5;

COMMIT;
SELECT * FROM COLS WHERE TABLE_NAME = 'NOTICE'
----------------------------------------------------------------�������� ��-----

-- �������� ����
INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin1', 1, '2021�� 09�� �̺�Ʈ', '���Ӱ� �����ϴ� ���� ������ ���� ���� ��Ź�帳�ϴ�.', SYSDATE); 

-- �������� ����
UPDATE NOTICE
SET TITLE = '������ ����Ʈ ��õ'
   ,CONTENT = '���� ���� �� ���ƿ�. ����Ʈ �Դϴ�~!'
   ,NOS_NO = 1
WHERE NO_NO=6;


-------------------------------------------------------------�������� ���� �� --

--�������� ����
DELETE
FROM NOTICE
WHERE NO_NO=6;

--------------------------------------------------------------�������� ���� ��--




--�� ���� ���� ����
--VIEW_WITHDRAWAL
--���� ���� ���� ��ȸ, ����, ����, ����, ī�װ��� ����

--1. ���� ���� ���� ��ȸ
/*
CREATE OR REPLACE VIEW VIEW_FAQ
AS
SELECT F.FAQ_NO "FAQ_NO", F.TITLE "FAQ_TITLE", F.CONTENT "FAQ_CONTENT", F.QS_NO "FAQSORT_NO", FS.NAME "FAQSORT_NAME"
FROM FAQ F JOIN FAQ_SORT FS
ON F.QS_NO = FS.QS_NO;
*/
--�� ���� ���� ���� ��ȸ �ڵ�
SELECT FAQ_NO, FAQSORT_NO, FAQSORT_NAME, FAQ_TITLE, FAQ_CONTENT
FROM VIEW_FAQ;

--2. ���� ���� ���� ����
SELECT *
FROM FAQ;

SELECT *
FROM ADMIN;

SELECT *
FROM FAQ_SORT;

--�� ���� ���� ���� ���� �ڵ�
INSERT INTO FAQ(FAQ_NO, AD_ID, QS_NO, TITLE, CONTENT)
VALUES(FAQESEQ.NEXTVAL, 'admin1', 1, '��ƼĿ ����� ������?', '���� �ϸ�ũ �� ���� üũ����Ʈ�� ���� ǥ���ϰ� ���� �ܾ ��ƼĿó�� ���� �� �ֽ��ϴ�. �� �� ����� ���� ��ƼĿ�� �� üũ����Ʈ���� Ȯ�� �����ϸ�, �ٸ� �ϸ�ũ�� üũ����Ʈ�� ��� �� �� �ֽ��ϴ�. ����, �� üũ����Ʈ���� Ư�� ��ƼĿ�� ��� �� üũ����Ʈ���� Ȯ���� �� �ֽ��ϴ�.');

INSERT INTO FAQ(FAQ_NO, AD_ID, QS_NO, TITLE, CONTENT)
VALUES(FAQESEQ.NEXTVAL, 'admin2', 3, 'Ż��� ��� �ϳ���?', '���� ���������� Ż�� ������ �� �ֽ��ϴ�.');

INSERT INTO FAQ(FAQ_NO, AD_ID, QS_NO, TITLE, CONTENT)
VALUES(FAQESEQ.NEXTVAL, 'admin2', 1, '�ϸ�ũ�� ��� �ϳ���?', '���� �ϸ�ũ �ϰ� ���� üũ����Ʈ�� Ŭ���� ��, �ش� üũ����Ʈ�� ���ø����� �ϸ�ũ�� �Ͻ� �� �ֽ��ϴ�. �ϸ�ũ�� üũ����Ʈ�� �� üũ����Ʈ���� Ȯ�� �����մϴ�.');

--COMMIT;
--ROLLBACK;
--2. ���� ���� ���� ����
--�� ���� ���� ���� ���� �ڵ�
UPDATE FAQ
SET QS_NO = 3
    , TITLE = '���� �׽�Ʈ'
    , CONTENT = '���� �׽�Ʈ��'
WHERE FAQ_NO = 3;

--3. ���� ���� ���� ����
--�� ���� ���� ���� ���� �ڵ�
DELETE
FROM FAQ
WHERE FAQ_NO = 3;

--4. ���� ���� ���� ī�װ��� ����
--�� ���� ���� ���� ī�װ��� ���� �ڵ�
SELECT FAQ_NO, FAQSORT_NO, FAQSORT_NAME, FAQ_TITLE, FAQ_CONTENT 
FROM VIEW_FAQ
WHERE FAQSORT_NO=1;

--5. ���� ���� ���� ī�װ� �� / ��ȣ ��ȸ


----- 12/20 --------------------------------------------------------------------
SELECT USER
FROM DUAL;
--==>> TEAM_SEOLO

-- ����Ʈ ��ȸ
-- ����   ���� �з�   ����   �ۼ���   ��¥
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE;

--�������� ������
CREATE SEQUENCE NOTICESEQ
NOCACHE;

SELECT *
FROM USER SEQUENCES;

SELECT * FROM USER_SEQUENCES;   

--�������� �з� ����
-- ��������
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE
WHERE NOTICESORT_NO=1;
-- ����
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE
WHERE NOTICESORT_NO=2;



INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin1', 1, '2021�� 09�� �̺�Ʈ', '���Ӱ� �����ϴ� ���� ������ ���� ���� ��Ź�帳�ϴ�.', SYSDATE); 
INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin2', 1, '��������ó����ħ ���� �ȳ�', '��3��(�������� ��ȣ ��Ģ) �� �ٲ� ���� ���� ������ ������ �����Դϴ�.', SYSDATE); 
INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin1', 1, '2021�� 10�� �̺�Ʈ', '���������� �����ϴ� ���� �������� ������ּż� �����մϴ�.', SYSDATE); 

----->>
SELECT *
FROM NOTICE;

UPDATE NOTICE
SET
CONTENT = '���������� �����ϴ� ���� �������� ������ּż� �����մϴ�.'
WHERE
NO_NO = 5;

COMMIT;
SELECT * FROM COLS WHERE TABLE_NAME = 'NOTICE';
----------------------------------------------------------------�������� ��-----

-- �������� ����
INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin1', 1, '2021�� 09�� �̺�Ʈ', '���Ӱ� �����ϴ� ���� ������ ���� ���� ��Ź�帳�ϴ�.', SYSDATE); 

-- �������� ����
UPDATE NOTICE
SET TITLE = '������ ����Ʈ ��õ'
   ,CONTENT = '���� ���� �� ���ƿ�. ����Ʈ �Դϴ�~!'
   ,NOS_NO = 1
WHERE NO_NO=6;


-------------------------------------------------------------�������� ���� �� --

--�������� ����
DELETE
FROM NOTICE
WHERE NO_NO=6;

COMMIT;
--------------------------------------------------------------�������� ���� ��--
-- ���� �Ұ� ������ (��ȸ, ����)
-- ���� INTRODUCTION ��ȸ
SELECT IN_NO, AD_ID, CONTENT
FROM INTRODUCTION;

-- ���� INTRODUCTION ����
UPDATE INTRODUCTION
SET CONTENT = '�������~ �����Դϴ�. ���� ���񽺴� ���� ������ �Ẹ�� �����Ͻ� �ſ���'
WHERE IN_NO=1;

-- ** ���� -> ������ Ȯ���� ���� ���� ���÷� �ϳ� ����
INSERT INTO INTRODUCTION (IN_NO, AD_ID, CONTENT) VALUES (1, 'admin1', '�������~ �����Դϴ�.');


COMMIT;
--==>> Ŀ�� �Ϸ�

--============ȸ�����/ Ż��ȸ�� ���=====================================
-- ȸ����� -> ��ȸ
SELECT PE_ID, NICKNAME, NAME, EMAIL, PEDATE, AC_NO
FROM PERSONAL;

-- ȸ����� -> �� ȸ�� ��
SELECT COUNT(PE_ID) AS COUNT
FROM PERSONAL;
--==>> 32


CREATE OR REPLACE VIEW VIEW_WITHDRAWALACCOUNTS
AS
SELECT W.ID 'ID', W.NAME 'NAME', W.TEL 'TEL', W.WIDATE 'WIDATE', WW.WHY 'WHY', W.WIR_NO 'WIR_NO', W.TEL'TEL'
FROM WITHDRAWAL W JOIN WITHDRAWAL_WHY WW
ON W.WI_NO = WW.WIR_NO(+);



-- Ż��ȸ����� ��ȸ
SELECT WITHDRAWAL_ID, WITHDRAWAL_NAME, WITHDRAWAL_TEL, WITHDRAWAL_DATE, WITHDRAWAL_NO, REASON
FROM VIEW_WITHDRAWAL;

SELECT *
FROM VIEW_WITHDRAWAL;

-- Ż��ȸ����� -> �� ȸ�� ��
SELECT COUNT(WI_NO) AS COUNT
FROM WITHDRAWAL;
--==>> 2

COMMIT;


--------------------------------------------------------------------------------
--�� �������� ��ȸ ����¡ ó�� �κ� �߰���

SELECT *
FROM NOTICE;


--�� �������� �Խù� ��ȣ�� �ִ밪�� ���� ������ ����
/*
SELECT NVL(MAX(NUM), 0) AS MAXNUM
FROM TBL_BOARD; 
--> �� �� ����
SELECT NVL(MAX(NUM), 0) AS MAXNUM FROM TBL_BOARD
; 
*/

SELECT NVL(MAX(NO_NO), 0) AS MAXNUM
FROM NOTICE;
--> �� �� ����

SELECT NVL(MAX(NO_NO), 0) AS MAXNUM
FROM NOTICE
;

--�� DB ���ڵ��� ������ �������� ������ ����
--@ �� �������� ��� �����ٰ��� ������.... �׷��� ��ü �Խù��� �� ���� �� �ʿ���.
/*
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD;
--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_BOARD
;
*/

SELECT COUNT(*) AS COUNT
FROM NOTICE;
-- �� �� ����
SELECT COUNT(*) AS COUNT FROM NOTICE
;


--                  1      10  �� (1~10) / (11~20) / (21~30) / 
--�� Ư�� ������(���۹�ȣ-����ȣ) �Խù��� ����� �о���� ������ ����
--   ��ȣ, �ۼ���, ����, ��ȸ��, �ۼ���
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
--==>> View VIEW_NOTICE��(��) �����Ǿ����ϴ�.

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


--�� �̸� ������
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

--�� ī�װ� ��º�
SELECT NAME
FROM NOTICE_SORT;

SELECT NOS_NAME
    FROM
    (
     SELECT NAME "NOS_NAME"
     FROM NOTICE_SORT
    );




--�� Ư�� �Խù��� ������ �о���� ������ ����
--   (NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
/*
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT
    , TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED
FROM TBL_BOARD
WHERE NUM=3;
--> �� �� ����
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED FROM TBL_BOARD WHERE NUM=3
;
*/

--��ȣ ���� �ۼ��Ͻ� ����
--�� VIEW_WITHDRAWAL Į���� ��ȸ
SELECT * FROM COLS WHERE TABLE_NAME = 'VIEW_NOTICE';

SELECT NOTICE_NO, NOTICE_TITLE, NOTICESORT_NAME, NOTICE_DATE, NOTICE_CONTENT 
FROM VIEW_NOTICE
WHERE NOTICE_NO=5;

/*
SELECT NVL(MIN(NUM), -1) AS NEXTNUM
FROM TBL_BOARD
WHERE NUM>209; 
--> �� �� ����
SELECT NVL(MIN(NUM), -1) AS NEXTNUM FROM TBL_BOARD WHERE NUM>209
; 
*/
--�� Ư�� �Խù��� ���� ��ȣ �о���� ������ ����
SELECT NVL(MIN(NO_NO), -1) AS NEXTNUM
FROM NOTICE
WHERE NO_NO>3;



--�� Ư�� �Խù��� ���� ��ȣ �о���� ������ ���� -- 7, 207, 208, 209
/*
SELECT NVL(MAX(NUM), -1) AS BEFORENUM
FROM TBL_BOARD
WHERE NUM<9; 
--> �� �� ����
SELECT NVL(MAX(NUM), -1) AS BEFORENUM FROM TBL_BOARD WHERE NUM<9
; 
*/

SELECT NVL(MAX(NO_NO), -1) AS BEFORENUM
FROM NOTICE
WHERE NO_NO<10;


SELECT NO_NO, AD_ID, NOS_NO, TITLE, NODATE
FROM NOTICE;

--------------------------------------------------------------------------------

--�� �������� �Խù� ��� ��
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
--�� üũ����Ʈ �Ű� �Խ���

--�� �Ű� �Խ��� ��ȸ ��
--�� �ٸ��ŵ��̶� DTO�� ���� ����... Į���� ����
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


--�� �Ű� �Խù� ��ȸ ��
--�� ������ �Ű���� �� �ּҴ� ���� �߰�! ���� ����/ �ڸ� ���� ������..���ָ� �ɵ�
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

--�� �Ű� ó��(������Ʈ)
-- �����ڰ� �Ű� �� ���� ����/�����Ű�/�ݷ� ��ư ������ ��...
-- ���� : �Ű�� ���� �ذ� �Ϸ�+�Ű� ����ڿ��� ��� 1ȸ �߰�
-- �����Ű� : �Ű�� ���� �ذ� �Ϸ� + �Ű��ۼ��ڿ��� ��� 1ȸ �߰�
-- �ݷ� : �Ű�� ���� �ذ� �Ϸ�

SELECT *
FROM REPORT_CHECK;

COMMIT;
ROLLBACK;

--@ SET�� ���°� �ٲ��ִ°Ŷ� ����!
--@ WHERE�� �ٲ��ּ���
--@ ��� ��.. ī��Ʈ ���ִ°ŷ��߳�? ���� �ִ°� ���� ��

-- ���� ó��
UPDATE REPORT_CHECK
SET STATUS_NO=1
WHERE RPCHECK_NO=1;

-- �����Ű� ó��
UPDATE REPORT_CHECK
SET STATUS_NO=3
WHERE RPCHECK_NO=1;

-- �ݷ� ó��
UPDATE REPORT_CHECK
SET STATUS_NO=2
WHERE RPCHECK_NO=1;


--�� �Խù� ����� �о���� ������(����, ���� ��ȣ)
--�� Ư�� �Խù��� ���� ��ȣ �о���� ������ ����
SELECT NVL(MIN(RPCHECK_NO), -1) AS NEXTNUM
FROM REPORT_CHECK
WHERE RPCHECK_NO>1;

--�� Ư�� �Խù��� ���� ��ȣ �о���� ������ ���� -- 7, 207, 208, 209
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
--�� ����¡ ó��

--�� ���ֹ������� FAQ  
--�� �Խù� ��ȣ�� �ִ밪�� ���� ������ ����
SELECT NVL(MAX(FAQ_NO), 0) AS MAXNUM
FROM FAQ;
-->> 3

/*
--�� Ȯ�� �� ��ȸ
SELECT *
FROM FAQ;
-->> 3 
*/
--�� DB ���ڵ��� ������ �������� ������ ����
--@ �� �������� ��� �����ٰ��� ������.... �׷��� ��ü �Խù��� �� ���� �� �ʿ���.

SELECT COUNT(*) AS COUNT
FROM FAQ;

--�� Ư�� ������(���۹�ȣ-����ȣ) �Խù��� ����� �о���� ������ ����

/*
-- �� Ȯ����
SELECT *
FROM VIEW_FAQ;
*/

-- �������� ȭ���̶� ��� ����
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

--�� Ư�� �Խù��� ������ �о���� ������ ����
SELECT FAQ_NO, FAQ_TITLE, FAQ_CONTENT, FAQSORT_NO, FAQSORT_NAME
FROM VIEW_FAQ
WHERE FAQ_NO=3;

--�� Ư�� �Խù��� ���� ��ȣ �о���� ������ ����
SELECT NVL(MIN(FAQ_NO), -1) AS NEXTNUM
FROM FAQ
WHERE FAQ_NO>2;

--�� Ư�� �Խù��� ���� ��ȣ �о���� ������ ���� // �̰� 10������ ������ �ϴ°�
SELECT NVL(MAX(FAQ_NO), -1) AS BEFORENUM
FROM FAQ
WHERE FAQ_NO<10;

                         
--�� ȸ�����                ---------------------------------------------------
/*
--�� Į���� ��ȸ
SELECT * FROM COLS WHERE TABLE_NAME = 'PERSONAL';
*/

--�� �Խù� ��ȣ�� �ִ밪�� ���� ������ ����
SELECT NVL(MAX(AC_NO), 0) AS MAXNUM
FROM PERSONAL;
-->> 38

/
--�� Ȯ�� �� ��ȸ
SELECT *
FROM PERSONAL;
-->> 3 
*/
--�� DB ���ڵ��� ������ �������� ������ ����
--@ �� �������� ��� �����ٰ��� ������.... �׷��� ��ü �Խù��� �� ���� �� �ʿ���.

SELECT COUNT(*) AS COUNT
FROM PERSONAL;
-->> 33

--�� Ư�� ������(���۹�ȣ-����ȣ) �Խù��� ����� �о���� ������ ����
/*
SELECT * FROM COLS WHERE TABLE_NAME = 'PERSONAL';
*/
-- ���̵�, �г���, �̸�, �̸���, ������, ������ȣ
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

--�� Ư�� �Խù��� ������ �о���� ������ ����
SELECT PE_ID, NICKNAME, NAME, EMAIL, PEDATE, AC_NO
FROM PERSONAL
WHERE AC_NO=31;

--�� Ư�� �Խù��� ���� ��ȣ �о���� ������ ����
SELECT NVL(MIN(AC_NO), -1) AS NEXTNUM
FROM PERSONAL
WHERE AC_NO>12;


--�� Ư�� �Խù��� ���� ��ȣ �о���� ������ ���� // �̰� 10������ ������ �ϴ°�
SELECT NVL(MAX(AC_NO), -1) AS BEFORENUM
FROM PERSONAL
WHERE AC_NO<10;


--�� Ż��ȸ�����    WITHDRAWAL    -------------------------------------------------
/*
--�� Į���� ��ȸ
SELECT * FROM COLS WHERE TABLE_NAME = 'VIEW_WITHDRAWAL';
*/

--�� �Խù� ��ȣ�� �ִ밪�� ���� ������ ����
SELECT NVL(MAX(WIR_NO), 0) AS MAXNUM
FROM WITHDRAWAL;
-->> 5

/*
--�� Ȯ�� �� ��ȸ
SELECT *
FROM WITHDRAWAL;
-->> 2
*/
--�� DB ���ڵ��� ������ �������� ������ ����
--@ �� �������� ��� �����ٰ��� ������.... �׷��� ��ü �Խù��� �� ���� �� �ʿ���.

SELECT COUNT(*) AS COUNT
FROM WITHDRAWAL;

--�� Ư�� ������(���۹�ȣ-����ȣ) �Խù��� ����� �о���� ������ ����

/*
-- �� Ȯ����
SELECT *
FROM VIEW_WITHDRAWAL;
*/
/*
SELECT * FROM COLS WHERE TABLE_NAME = 'VIEW_WITHDRAWAL';
*/
-- �������� ȭ���̶� ��� ����

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


SELECT ID, NAME, TEL, WIDATE, Ż�����, WI_NO
FROM WITHDRWAL;

CREATE OR REPLACE
AS




--�� Ư�� �Խù��� ������ �о���� ������ ���� @@@@@ �ϴ� �޴µ� .,, �ʿ��ҷ���,,
SELECT WITHDRAWAL_ID, NICKNAME, WITHDRAWAL_NAME, WITHDRAWAL_EMAIL, WITHDRAWAL_DATE, REASON, WITHDRAWAL_NO
FROM WITHDRAWAL
WHERE WITHDRAWAL_NO=1;

--�� Ư�� �Խù��� ���� ��ȣ �о���� ������ ����
SELECT NVL(MIN(WI_NO), -1) AS NEXTNUM
FROM WITHDRAWAL
WHERE WI_NO>1;

--�� Ư�� �Խù��� ���� ��ȣ �о���� ������ ���� // �̰� 10������ ������ �ϴ°�
SELECT NVL(MAX(WI_NO), -1) AS BEFORENUM
FROM WITHDRAWAL
WHERE WI_NO<2;

--�� �Ű�ó��            -------------------------------------------------------

--�� Į���� ��ȸ
SELECT * FROM COLS WHERE TABLE_NAME = 'REPORT_CHECK';

SELECT * FROM COLS WHERE TABLE_NAME = 'VIEW_REPORT';

-- Ȯ����
/*
SELECT *
FROM REPORT_CHECK;
*/

--�� �Խù� ��ȣ�� �ִ밪�� ���� ������ ����
SELECT NVL(MAX(RPCHECK_NO), 0) AS MAXNUM
FROM REPORT_CHECK;
-->> 2

--�� DB ���ڵ��� ������ �������� ������ ����
--@ �� �������� ��� �����ٰ��� ������.... �׷��� ��ü �Խù��� �� ���� �� �ʿ���.

SELECT COUNT(*) AS COUNT
FROM REPORT_CHECK;

--�� Ư�� ������(���۹�ȣ-����ȣ) �Խù��� ����� �о���� ������ ����

/
-- �� Ȯ����
SELECT *
FROM VIEW_REPORT;
*/
-- ���⿡ SYSDATE ����  REPORTDATE ����!! @@@@@
TO_CHAR(REPORTDATE, 'YYYY-MM-DD') AS DATE
TO_CHAR(SYSDATE, 'YYYY-MM-DD') AS 
-- �������� ȭ���̶� ��� ����
--    ����     ����        ����     ��¥   �ð�
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

--�� Ư�� �Խù��� ������ �о���� ������ ����@@@@@ ReportSee �ΰ�?
-- �Ű��ȣ, �Ű�ī�װ�, �Ű���. �����ۼ���, �ۼ��Ͻ�, �ۼ��ð�, ����, �󼼻���
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

--�� Ư�� �Խù��� ���� ��ȣ �о���� ������ ����
SELECT NVL(MIN(RPCHECK_NO), -1) AS NEXTNUM
FROM REPORT_CHECK
WHERE RPCHECK_NO>1;

--�� Ư�� �Խù��� ���� ��ȣ �о���� ������ ���� // �̰� 10������ ������ �ϴ°�
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
SET TITLE = '������ ����Ʈ ��õ'
   ,CONTENT = '���� ���� �� ���ƿ�. ����Ʈ �Դϴ�~!'
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

--�� ȸ�� ����Ʈ ����¡ ó���� ����� �ڷ� 

--�� �� �������� ��µ� ȸ�� ����Ʈ(10��)
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

--�� ����¡�� ����� ��ȣ�� ����ϱ� ���� �Խù��� �� ����
SELECT COUNT(PE_ID) AS COUNT
FROM PERSONAL;



COMMIT;

ALTER TABLE INTRODUCTION MODIFY CONTENT VARCHAR2(1000);

COMMIT;


--�� ����¡�� ������ ���� 1
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

--�� ����¡�� ������ ���� 2
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
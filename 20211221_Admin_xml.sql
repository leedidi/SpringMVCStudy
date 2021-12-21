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

-- Ż��ȸ����� ��ȸ
SELECT WITHDRAWAL_ID, WITHDRAWAL_NAME, WITHDRAWAL_TEL, WITHDRAWAL_DATE, WITHDRAWAL_NO, REASON
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

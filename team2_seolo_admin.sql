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

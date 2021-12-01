SELECT USER
FROM DUAL;
--==>> SCOTT

--�� �ǽ� ���̺� ����(���� : REGION)
CREATE TABLE REGION
( REGIONID      NUMBER          -- ���� ���̵�    -- PK
, REGIONNAME    VARCHAR2(30)    -- ���� ��
, CONSTRAINT REGION_ID_PK PRIMARY KEY(REGIONID)
);
--==>> Table REGION��(��) �����Ǿ����ϴ�.

-- ������ ����(���� : REGIONSEQ)
CREATE SEQUENCE REGIONSEQ
NOCACHE;
--==>> Sequence REGIONSEQ��(��) �����Ǿ����ϴ�.

--�� ������ �Է�(���� ������ �Է�)
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '����');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '���');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '��õ');
--> 1 �� ��(��) ���ԵǾ����ϴ�. * 3

--�� ���� ����Ʈ Ȯ��
SELECT REGIONID, REGIONNAME
FROM REGION;
--> �� �� ����
SELECT REGIONID, REGIONNAME FROM REGION
;
--==>> 
/*
1   ����
2   ���
3   ��õ
*/


-- Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� �ǽ� ���̺� ����(���� : POSITION)
CREATE TABLE POSITION
( POSITIONID    NUMBER          -- ���� ���̵�   -- PK
, POSITIONNAME  VARCHAR2(30)    -- ���� ��
, MINBASICPAY   NUMBER          -- �ּ� �⺻��
, CONSTRAINT POSITION_ID_PK PRIMARY KEY(POSITIONID)
);
--==>> Table POSITION��(��) �����Ǿ����ϴ�.

--�� ������ ����(���� : POSITIONSEQ)
CREATE SEQUENCE POSITIONSEQ
NOCACHE;
--==>> Sequence POSITIONSEQ��(��) �����Ǿ����ϴ�.

--�� ������ �Է�(���� ������ �Է�)
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '���', 1000000);         -- �鸸
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '�븮', 2000000);         -- �̹鸸
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '����', 3000000);         -- ��鸸
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
VALUES(POSITIONSEQ.NEXTVAL, '��', 4000000);         -- ��鸸
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 4


--�� ���� ����Ʈ Ȯ��
SELECT POSITIONID, POSITIONNAME, MINBASICPAY
FROM POSITION;
--> �� �� ����
SELECT POSITIONID, POSITIONNAME, MINBASICPAY FROM POSITION
;
--==>>
/*
1	���	1000000
2	�븮	2000000
3	����	3000000
4	��	    4000000
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� �ǽ� ���̺� ����(�μ� : DEPARTMENT)
CREATE TABLE DEPARTMENT
( DEPARTMENTID      NUMBER
, DEPARTMENTNAME    VARCHAR2(30)
, CONSTRAINT DEPARTMENT_ID_PK PRIMARY KEY(DEPARTMENTID)
);
--==>> Table DEPARTMENT��(��) �����Ǿ����ϴ�.


--�� ������ ����(���� : DEPARTMENTSEQ)
CREATE SEQUENCE DEPARTMENTSEQ
NOCACHE;
--==>> Sequence DEPARTMENTSEQ��(��) �����Ǿ����ϴ�.


--�� ������ �Է�(�μ� ������ �Է�)
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME)
VALUES(DEPARTMENTSEQ.NEXTVAL, '���ߺ�');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME)
VALUES(DEPARTMENTSEQ.NEXTVAL, '��ȹ��');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME)
VALUES(DEPARTMENTSEQ.NEXTVAL, '������');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 3


--�� �μ� ����Ʈ Ȯ��
SELECT DEPARTMENTID, DEPARTMENTNAME
FROM DEPARTMENT;
--> �� �� ����
SELECT DEPARTMENTID, DEPARTMENTNAME FROM DEPARTMENT
;
--==>>
/*
1	���ߺ�
2	��ȹ��
3	������
*/


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� �ǽ� ���̺� ����(���� : EMPLOYEE)
-- �����ȣ, �����, �ֹι�ȣ, �������, ������, ��ȭ��ȣ, �μ�, ����, ����, �⺻��, ����
CREATE TABLE EMPLOYEE
( EMPLOYEEID    NUMBER                  -- ��� ��ȣ    -- PK
, NAME          VARCHAR2(30)            -- ��� ��
, SSN           VARCHAR2(20)            -- �ֹι�ȣ     -- ��ȣȭ ��� ����(TYPE CHECK~!!!)
, BIRTHDAY      DATE                    -- �������
, LUNAR         NUMBER(1) DEFAULT 0     -- ������      -- ���0, ����1
, TELEPHONE     VARCHAR2(40)            -- ��ȭ��ȣ
, DEPARTMENTID  NUMBER                  -- �μ� ���̵�
, POSITIONID    NUMBER                  -- ���� ���̵�
, REGIONID      NUMBER                  -- ���� ���̵�
, BASICPAY      NUMBER                  -- �⺻��
, EXTRAPAY      NUMBER                  -- ����
, CONSTRAINT EMPLOYEE_ID_PK PRIMARY KEY(EMPLOYEEID)
, CONSTRAINT EMPLOYEE_DEPARTMENTID_FK FOREIGN KEY(DEPARTMENTID)
             REFERENCES DEPARTMENT(DEPARTMENTID)
, CONSTRAINT EMPLOYEE_POSITIONID_FK FOREIGN KEY(POSITIONID)
             REFERENCES POSITION(POSITIONID)  
, CONSTRAINT EMPLOYEE_REGIONID_FK FOREIGN KEY(REGIONID)
             REFERENCES REGION(REGIONID)  
, CONSTRAINT EMPLOYEE_LUNAR_CK CHECK(LUNAR=0 OR LUNAR=1)            
);
--==>> Table EMPLOYEE��(��) �����Ǿ����ϴ�.

--�� ������ ����(���� : EMPLOYEESEQ)
CREATE SEQUENCE EMPLOYEESEQ
NOCACHE;
--==>> Sequence EMPLOYEESEQ��(��) �����Ǿ����ϴ�.


--�� ������ �Է�(���� ������ �Է�)
INSERT INTO EMPLOYEE(EMPLOYEEID, NAME, SSN , BIRTHDAY, LUNAR
                    , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                    , BASICPAY, EXTRAPAY)
VALUES(EMPLOYEESEQ.NEXTVAL, '������', CRYPTPACK.ENCRYPT('9903202234567','9903202234567')
      , TO_DATE('1999-03-20', 'YYYY-MM-DD'), 0, '010-7389-9032', 1, 1, 1
      , 1500000, 1500000);  --����ʸ�, ����ʸ�
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM EMPLOYEE;
--==>>
/*
1	������	iu?M?%?	1999-03-20	0	010-7389-9032	1	1	1	1500000	1500000
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.








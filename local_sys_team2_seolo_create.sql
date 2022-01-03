-- �� ����Ŭ ����� ���� ����(ldy)
CREATE USER team_seolo IDENTIFIED BY java006$
DEFAULT TABLESPACE TBS_EDUA;
--> ldy ��� ����� ������ ����ڴ�. (�����ϰڴ�.)
--  �� ������ �н������ java006$ �� �����ϰڴ�. (�����ϰڴ�.)
--  �� ������ ���� �����ؼ� �����ϴ� ����Ŭ ��ü��(���׸�Ʈ����)
--  �⺻������ TBS_EDUA ��� ���̺����̽��� Ȱ���� �� �ֵ��� �����ϰڴ�.
--  (�� ���̺����̽��� ������ �� �ֵ��� �����ϰڴ�.)
--==>> User LDY��(��) �����Ǿ����ϴ�.

--�� ������ ����Ŭ ����� ����(khj)�� ����
--   ����Ŭ�� ������ �õ��� ��������... ���� �Ұ�.
--   �� ����: ���� -�׽�Ʈ ����: ORA-01045: user LDY lacks CREATE SESSION privilege; logon denied
--> create session ������ ���� ������...

--�� ������ ����Ŭ ����� ����(ldy)��
--   ���� ������ ������ �� �ֵ��� create session ���� �ο� �� sys ��...
GRANT CREATE SESSION TO team_seolo;
--==>> Grant��(��) �����߽��ϴ�.


--�� ������ ����Ŭ ����� ����(ldy)�� ���� ����Ŭ ���� ����~!!!
--   ������, ���̺� ���� �Ұ�(����� �����)

--�� ������ ����Ŭ ����� ����(ldy)��
--   �ý��� ���� ���� ��ȸ
SELECT *
FROM DBA_SYS_PRIVS;
--==>>
/*
             ��
LDY	CREATE SESSION	NO
             ��
*/

-- �� ������ ����Ŭ ����� ����(ldy)��
--    ���̺� ������ ������ �� �ֵ��� CREATE TABLE ���� �ο�
GRANT CREATE TABLE TO team_seolo;
--==>> Grant��(��) �����߽��ϴ�.


-- �� ������ ����Ŭ ����� ����(ldy)��
--    ���̺����̽�(TBS_EDUA)���� ����� �� �ִ� ����(�Ҵ緮)
--    �� ũ�⸦ ���������� ����.
ALTER USER team_seolo
QUOTA UNLIMITED ON TBS_EDUA;    --@ �Ҵ緮�� ���������� ����
--@ QUOTA 10M ON TBS_EDUA;      --@ �Ҵ緮�� 10MB�� ����
--==>> User LDY��(��) ����Ǿ����ϴ�.

-- �� DBA ���� �ο�
GRANT CONNECT, RESOURCE, DBA TO team_seolo;

-- �� SEQUENCE ���� �ο�
GRANT CREATE SEQUENCE TO team_seolo;

-- �� ���� ����
DROP USER team2_seolo_local CASCADE;
DROP USER team_seolo CASCADE;

-- �� ��ȣȭ ���� �ο�
GRANT EXECUTE ON DBMS_OBFUSCATION_TOOLKIT TO team_seolo;

--�� ��ȣȭ ��ȣȭ_02 �ΰ��� CRYPTPACK ������ �ϱ�
-- ○ 오라클 사용자 계정 생성(ldy)
CREATE USER team_seolo IDENTIFIED BY java006$
DEFAULT TABLESPACE TBS_EDUA;
--> ldy 라는 사용자 계정을 만들겠다. (생성하겠다.)
--  이 계정의 패스워드는 java006$ 로 구성하겠다. (설정하겠다.)
--  이 계정을 통해 접속해서 생성하는 오라클 객체는(세그먼트들은)
--  기본적으로 TBS_EDUA 라는 테이블스페이스를 활용할 수 있도록 설정하겠다.
--  (이 테이블스페이스에 생성될 수 있도록 설정하겠다.)
--==>> User LDY이(가) 생성되었습니다.

--※ 생성된 오라클 사용자 계정(khj)을 통해
--   오라클에 접속을 시도해 보았으나... 접속 불가.
--   → 상태: 실패 -테스트 실패: ORA-01045: user LDY lacks CREATE SESSION privilege; logon denied
--> create session 권한이 없기 때문에...

--○ 생성된 오라클 사용자 계정(ldy)에
--   서버 접속이 가능할 수 있도록 create session 권한 부여 → sys 가...
GRANT CREATE SESSION TO team_seolo;
--==>> Grant을(를) 성공했습니다.


--※ 생성된 오라클 사용자 계정(ldy)을 통해 오라클 접속 가능~!!!
--   하지만, 테이블 생성 불가(→권한 불충분)

--○ 생성된 오라클 사용자 계정(ldy)의
--   시스템 관련 권한 조회
SELECT *
FROM DBA_SYS_PRIVS;
--==>>
/*
             ：
LDY	CREATE SESSION	NO
             ：
*/

-- ○ 생성된 오라클 사용자 계정(ldy)에
--    테이블 생성이 가능할 수 있도록 CREATE TABLE 권한 부여
GRANT CREATE TABLE TO team_seolo;
--==>> Grant을(를) 성공했습니다.


-- ○ 생성된 오라클 사용자 계정(ldy)에
--    테이블스페이스(TBS_EDUA)에서 사용할 수 있는 공간(할당량)
--    의 크기를 무제한으로 지정.
ALTER USER team_seolo
QUOTA UNLIMITED ON TBS_EDUA;    --@ 할당량을 무제한으로 지정
--@ QUOTA 10M ON TBS_EDUA;      --@ 할당량을 10MB로 지정
--==>> User LDY이(가) 변경되었습니다.

-- ○ DBA 권한 부여
GRANT CONNECT, RESOURCE, DBA TO team_seolo;

-- ○ SEQUENCE 권한 부여
GRANT CREATE SEQUENCE TO team_seolo;

-- ○ 계정 삭제
DROP USER team2_seolo_local CASCADE;
DROP USER team_seolo CASCADE;

-- ○ 암호화 권한 부여
GRANT EXECUTE ON DBMS_OBFUSCATION_TOOLKIT TO team_seolo;

--○ 암호화 복호화_02 로가서 CRYPTPACK 컴파일 하기
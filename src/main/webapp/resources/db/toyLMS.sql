-- SYSTEM 계정에서 프로젝트를 위한 계정 생성 및 권한 부여
CREATE USER toyLMS IDENTIFIED BY toyLMS;
GRANT RESOURCE, CONNECT to toyLMS;
COMMIT;

CREATE TABLE member(
    id VARCHAR2(20) PRIMARY KEY,
    pwd 	VARCHAR2(20),
	name	VARCHAR2(20),
	phone	VARCHAR2(20),
    major   VARCHAR2(20),
	indate	DATE DEFAULT SYSDATE,
    -- use : N 은 승인되지 않은 사용자, Y 는 관리자로부터 승인된 사용자
	use	CHAR(1) DEFAULT 'N',
    -- garde : 권한을 의미, STUDENT(기본값) : 학생, ADMIN : 관리자
    grade VARCHAR2(20) DEFAULT 'STUDENT'
);
COMMIT;

SELECT * FROM member;

-- 슈퍼 관리자 계정 생성
INSERT INTO member VALUES('sanghoo', 'sanghoo', '상후', '010-3925-7715', 'ADMIN', SYSDATE, 'Y', 'ADMIN');
COMMIT;

-- 학생 테스트 계정 생성
INSERT INTO member VALUES('scott2', 'tiger2', '스캇2', '010-1111-2222', '빅데이터', SYSDATE, 'N', 'STUDENT');
COMMIT;

SELECT * FROM member WHERE id='scott' AND pwd='tiger';

SELECT * FROM member WHERE use='Y';


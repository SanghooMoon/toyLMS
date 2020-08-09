-- SYSTEM 계정에서 프로젝트를 위한 계정 생성 및 권한 부여
CREATE USER toyLMS IDENTIFIED BY toyLMS;
GRANT RESOURCE, CONNECT to toyLMS;
COMMIT;

-- 회원 테이블 생성
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
INSERT INTO member VALUES('scott2', 'tiger2', '스캇2', '010-1111-2222', '스마트웹', SYSDATE, 'N', 'STUDENT');
INSERT INTO member VALUES('scott3', 'tiger3', '스캇3', '010-1111-2222', '스마트웹', SYSDATE, 'N', 'STUDENT');
INSERT INTO member VALUES('scott4', 'tiger4', '스캇3', '010-1111-2222', '스마트웹', SYSDATE, 'N', 'STUDENT');

COMMIT;

-- 로그인 쿼리
SELECT * FROM member WHERE id='scott' AND pwd='tiger';

-- 승인된 사용자 조회
SELECT * FROM member WHERE use='Y';

-- 가입요청 승인
UPDATE member SET use='Y' WHERE id IN('scott2', 'test1');

-- 가입요청 거절
DELETE FROM member WHERE id IN('scott2', 'test1');

-- 전공 테이블
CREATE TABLE major(
    major VARCHAR2(20) PRIMARY KEY,
    mainSubject VARCHAR2(20),
    subSubject  VARCHAR2(20)
);
COMMIT;
SELECT * FROM major;

INSERT INTO major VALUES('스마트웹', 'JAVA', 'ORACLE');
INSERT INTO major VALUES('빅데이터', 'ORACLE', 'JAVA');
INSERT INTO major VALUES('ADMIN', NULL, NULL);

DROP TABLE Major;

ALTER TABLE member ADD CONSTRAINT MEMBER_FK FOREIGN KEY (major) REFERENCES MAJOR(major); 

SELECT * FROM member, major where member.major = major.major AND id='scott';








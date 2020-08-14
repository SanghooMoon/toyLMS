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

-- 메일전송을 위한 member 테이블 수정(이메일 컬럼 추가)
ALTER TABLE member ADD (email VARCHAR2(80));

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

-- 게시판 테이블 생성
CREATE TABLE board(
    bno     NUMBER(10) PRIMARY KEY, 
    id      VARCHAR2(20),
    title 	VARCHAR2(50),
	content	VARCHAR2(200),
	indate	DATE DEFAULT SYSDATE
);
commit;

SELECT * FROM board;

CREATE SEQUENCE bno_SEQ INCREMENT BY 1 START WITH 1;

insert INTO board VALUES(bno_SEQ.NEXTVAL, 'sanghoo', '안녕하세요', '본문입니다', SYSDATE);
insert INTO board VALUES(bno_SEQ.NEXTVAL, 'sanghoo', '안녕하세요2', '본문입니다2', SYSDATE);
insert INTO board VALUES(bno_SEQ.NEXTVAL, 'test', 'test제목', 'test본문', SYSDATE);

commit;

SELECT * FROM board WHERE bno=1;

SELECT COUNT(*) FROM board;

UPDATE board SET content='변경', title='제목변경',indate=SYSDATE WHERE bno=1;
select * from board;
commit;

DELETE FROM board WHERE BNO=7;
COMMIT;

-- 댓글 테이블
CREATE TABLE reply(
    rno     NUMBER(10)  primary key,
    bno     NUMBER(10),  
    replytext VARCHAR2(100),
    replyid   VARCHAR2(30),
    redate    DATE DEFAULT SYSDATE,
    CONSTRAINT FK_reply foreign key(bno) references board(bno)
);

CREATE SEQUENCE rno_SEQ INCREMENT BY 1 START WITH 1;

select * FROM reply;

INSERT INTO reply VALUES(RNO_SEQ.nextval, 1, 'text', 'scott', SYSDATE);
COMMIT;

select * FROM reply WHERE bno =1;



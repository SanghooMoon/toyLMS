-- SYSTEM �������� ������Ʈ�� ���� ���� ���� �� ���� �ο�
CREATE USER toyLMS IDENTIFIED BY toyLMS;
GRANT RESOURCE, CONNECT to toyLMS;
COMMIT;

-- ȸ�� ���̺� ����
CREATE TABLE member(
    id VARCHAR2(20) PRIMARY KEY,
    pwd 	VARCHAR2(20),
	name	VARCHAR2(20),
	phone	VARCHAR2(20),
    major   VARCHAR2(20),
	indate	DATE DEFAULT SYSDATE,
    -- use : N �� ���ε��� ���� �����, Y �� �����ڷκ��� ���ε� �����
	use	CHAR(1) DEFAULT 'N',
    -- garde : ������ �ǹ�, STUDENT(�⺻��) : �л�, ADMIN : ������
    grade VARCHAR2(20) DEFAULT 'STUDENT'
);
COMMIT;

-- ���������� ���� member ���̺� ����(�̸��� �÷� �߰�)
ALTER TABLE member ADD (email VARCHAR2(80));

SELECT * FROM member;

-- ���� ������ ���� ����
INSERT INTO member VALUES('sanghoo', 'sanghoo', '����', '010-3925-7715', 'ADMIN', SYSDATE, 'Y', 'ADMIN');
COMMIT;

-- �л� �׽�Ʈ ���� ����
INSERT INTO member VALUES('scott2', 'tiger2', '��ı2', '010-1111-2222', '����Ʈ��', SYSDATE, 'N', 'STUDENT');
INSERT INTO member VALUES('scott3', 'tiger3', '��ı3', '010-1111-2222', '����Ʈ��', SYSDATE, 'N', 'STUDENT');
INSERT INTO member VALUES('scott4', 'tiger4', '��ı3', '010-1111-2222', '����Ʈ��', SYSDATE, 'N', 'STUDENT');

COMMIT;

-- �α��� ����
SELECT * FROM member WHERE id='scott' AND pwd='tiger';

-- ���ε� ����� ��ȸ
SELECT * FROM member WHERE use='Y';

-- ���Կ�û ����
UPDATE member SET use='Y' WHERE id IN('scott2', 'test1');

-- ���Կ�û ����
DELETE FROM member WHERE id IN('scott2', 'test1');

-- ���� ���̺�
CREATE TABLE major(
    major VARCHAR2(20) PRIMARY KEY,
    mainSubject VARCHAR2(20),
    subSubject  VARCHAR2(20)
);
COMMIT;
SELECT * FROM major;

INSERT INTO major VALUES('����Ʈ��', 'JAVA', 'ORACLE');
INSERT INTO major VALUES('������', 'ORACLE', 'JAVA');
INSERT INTO major VALUES('ADMIN', NULL, NULL);

DROP TABLE Major;

ALTER TABLE member ADD CONSTRAINT MEMBER_FK FOREIGN KEY (major) REFERENCES MAJOR(major); 

SELECT * FROM member, major where member.major = major.major AND id='scott';

-- �Խ��� ���̺� ����
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

insert INTO board VALUES(bno_SEQ.NEXTVAL, 'sanghoo', '�ȳ��ϼ���', '�����Դϴ�', SYSDATE);
insert INTO board VALUES(bno_SEQ.NEXTVAL, 'sanghoo', '�ȳ��ϼ���2', '�����Դϴ�2', SYSDATE);
insert INTO board VALUES(bno_SEQ.NEXTVAL, 'test', 'test����', 'test����', SYSDATE);

commit;

SELECT * FROM board WHERE bno=1;

SELECT COUNT(*) FROM board;

UPDATE board SET content='����', title='���񺯰�',indate=SYSDATE WHERE bno=1;
select * from board;
commit;

DELETE FROM board WHERE BNO=7;
COMMIT;

-- ��� ���̺�
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



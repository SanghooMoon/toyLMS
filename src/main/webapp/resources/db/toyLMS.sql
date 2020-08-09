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








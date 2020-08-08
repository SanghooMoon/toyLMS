-- SYSTEM �������� ������Ʈ�� ���� ���� ���� �� ���� �ο�
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
INSERT INTO member VALUES('scott2', 'tiger2', '��ı2', '010-1111-2222', '������', SYSDATE, 'N', 'STUDENT');
COMMIT;

SELECT * FROM member WHERE id='scott' AND pwd='tiger';

SELECT * FROM member WHERE use='Y';


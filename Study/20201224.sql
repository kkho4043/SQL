CREATE TABLE author (--pk������� ���̺� �����
  author_id	NUMBER(10) ,
  author_name	VARCHAR2(100), 	
  author_desc	VARCHAR2(500),
  PRIMARY 	KEY(author_id)	
);

CREATE TABLE book(--pk���� fk���� ������ ���̺� �����
    book_id number(10) ,
    title varchar2(100),
    pubs varchar2(100),
    pub_date date,
    author_id number(10) NOT NULL,--null ���� ���ְ���
    primary key(book_id), --�������� ���ϼ� ���̺� �� �ϳ��� ������ 
    constraint book_fk foreign key(author_id)
    references author(author_id)
    -- �ܷ�Ű �ٸ� ���̺�� ������ �ٸ����̺� ���� ���� ��� �Ҽ�����
);

alter table book add(pubs varchar2(50)); --�ö� �߰�
alter table book modify(pubs varchar2(100)); --�÷� ����
alter table book rename column title to subject; -- �÷� �̸� ����
alter table book drop (author); --�÷� ����
rename book to oracle; --���̺�� ����
DROP TABLE book; --���̺� ����
TRUNCATE TABLE article; --���̺��� ��� �ο� ����

--������ �� ����ֱ�
insert into author values(2,'�̹���');

--����� �� ����ֱ�
insert into author( author_id, author_name )
values (2, '�̹���' );

--������ ����
update author
set author_name = '���84',
    author_desc = '�����۰�'
where author_id = 2;

delete from author;--������ �޾����� ������ ���� ����
--where

create SEQUENCE seq_author_id increment by 1 start with 1; --������ ����
--�����ϰ� ���� �ѹ� ���� 
drop sequence seq_author_id; --������ ����
select SEQ_author_ID.currval from dual;--���� �������� ��ȸ ���� ������ ��ȸ�� �ȵ�
select SEQ_author_ID.nextval from dual;--���� ������ �� ����

select * from USER_SEQUENCES; --���� �������� �ִ��� Ȯ�� 

select * from book;
select * from author;

select *
from book , author
where book.author_id = author.author_id;

COMMIT; --������ �̰������ ���� �����Ϳ� �� ������ view�� �ٸ��� ����.

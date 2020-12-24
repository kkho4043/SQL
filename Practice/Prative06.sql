drop table book;
drop table author;
--book�� author�� id�� �ܷ�Ű�� ����ϱ� ������ author���� �����.
--author ���̺� ����======================================= 
CREATE TABLE author (
  author_id	NUMBER(10) ,
  author_name	VARCHAR2(100), 	
  author_desc	VARCHAR2(500),
  PRIMARY 	KEY(author_id)
);


--book ���̺� ����=========================================
CREATE TABLE book(
    book_id number(10),
    title varchar2(100),
    pubs varchar2(100),
    pub_date date,
    author_id number(10),
    primary key(book_id),
    constraint book_fk foreign key(author_id)
    references author(author_id)
);

--author ������ ����======================================= 
drop SEQUENCE seq_author_id;
create SEQUENCE seq_author_id increment by 1 start with 1;
--author ������ insert=======================================
insert into author(author_id, author_name , author_desc)
values (seq_author_id.nextval, '�̹���' ,'��� ����');

insert into author(author_id, author_name , author_desc)
values (seq_author_id.nextval, '�ڰ渮' ,'��󳲵� �뿵');

insert into author(author_id, author_name , author_desc)
values (seq_author_id.nextval, '���ù�' ,'17�� ��ȸ�ǿ�');

insert into author(author_id, author_name , author_desc)
values (seq_author_id.nextval, '���84' ,'��ȵ����� �� 84���');

insert into author(author_id, author_name , author_desc)
values (seq_author_id.nextval, '��Ǯ' ,'�¶��� ��ȭ�� 1����');

insert into author(author_id, author_name , author_desc)
values (seq_author_id.nextval, '�迵��' ,'�˾�����');


--book ������ ����=========================================
drop SEQUENCE seq_book_id;
create SEQUENCE seq_book_id increment by 1 start with 1;

--book insert=========================================
insert into book(book_id,title,pubs,pub_date,author_id)
values (seq_book_id.nextval,'�츮���� �ϱ׷�������','�ٸ�','1998-02-02', 1);

insert into book(book_id,title,pubs,pub_date,author_id)
values (seq_book_id.nextval,'�ﱹ��','�����','2002-03-01',1);

insert into book(book_id,title,pubs,pub_date,author_id)
values (seq_book_id.nextval,'����','���δϿ��Ͻ�','2012-08-15',2);

insert into book(book_id,title,pubs,pub_date,author_id)
values (seq_book_id.nextval, '���ù��� �۾��� Ư��','�����Ǳ�','015-04-01',3);

insert into book(book_id,title,pubs,pub_date,author_id)
values (seq_book_id.nextval,'�мǿ�','�߾ӺϽ�(books)','2012-02-22',4);

insert into book(book_id,title,pubs,pub_date,author_id)
values (seq_book_id.nextval,'������ȭ','�������','2011-08-03',5);

insert into book(book_id,title,pubs,pub_date,author_id)
values (seq_book_id.nextval,'�����λ��','���е���','2017-05-04',6);

insert into book(book_id,title,pubs,pub_date,author_id)
values (seq_book_id.nextval,'26��','�������','2012-02-04',5);

--���
select 
    b.book_id,
    b.title,
    b.pubs,
    b.pub_date,
    a.author_id,
    a.author_name,
    a.author_desc
from book b,author a
where b.author_id = a.author_id;

--��Ǯ ���� ����
update author
set author_desc = '����Ư����'
where author_name = '��Ǯ';
--author���� ���84 �� ���� (�ȉ�) �мǿ��� �����ϰ� �ϱ�.
delete from book
where author_id = 4;
delete from author
where author_id = 4;

--���
select 
    b.book_id,
    b.title,
    b.pubs,
    b.pub_date,
    a.author_id,
    a.author_name,
    a.author_desc
from book b,author a
where b.author_id = a.author_id;

commit;
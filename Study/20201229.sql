SELECT *
from author;

SELECT *
from book;

Insert into author
values(seq_author_id.nextval,'���¿�','��⵵ ���ֽ�');

update author
set author_desc = '��⵵ ���ֽ�'
where author_name = '���¿�';

SELECT author_id,
author_name,
author_desc
FROM author;

delete from author
where author_id = 4;


select 
    *
from book;
---------------------------
drop table book;
drop table author;

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
drop SEQUENCE seq_author_id;
create SEQUENCE seq_author_id increment by 1 start with 1;
drop SEQUENCE seq_book_id;
create SEQUENCE seq_book_id increment by 1 start with 1;

select  b.book_id,
b.title,
b.pubs,
TO_CHAR((b.pub_date),'YYYY/MM/DD'),
a.author_name
from book b,author a 
where(b.title LIKE '%��%' 
or b.pubs LIKE '%��%'
or a.author_name LIKE '%��%')
and b.author_id = a.author_id;



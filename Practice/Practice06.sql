drop table book;
drop table author;
--book이 author에 id를 외례키로 사용하기 때문에 author부터 만든다.
--author 테이블 생성======================================= 
CREATE TABLE author (
  author_id	NUMBER(10) ,
  author_name	VARCHAR2(100), 	
  author_desc	VARCHAR2(500),
  PRIMARY 	KEY(author_id)
);


--book 테이블 생성=========================================
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

--author 시퀀스 생성======================================= 
drop SEQUENCE seq_author_id;
create SEQUENCE seq_author_id increment by 1 start with 1;
--author 데이터 insert=======================================
insert into author(author_id, author_name , author_desc)
values (seq_author_id.nextval, '이문열' ,'경북 영양');

insert into author(author_id, author_name , author_desc)
values (seq_author_id.nextval, '박경리' ,'경상남도 통영');

insert into author(author_id, author_name , author_desc)
values (seq_author_id.nextval, '유시민' ,'17대 국회의원');

insert into author(author_id, author_name , author_desc)
values (seq_author_id.nextval, '기안84' ,'기안동에서 산 84년생');

insert into author(author_id, author_name , author_desc)
values (seq_author_id.nextval, '강풀' ,'온라인 만화가 1세대');

insert into author(author_id, author_name , author_desc)
values (seq_author_id.nextval, '김영하' ,'알쓸신참');


--book 시퀀스 생성=========================================
drop SEQUENCE seq_book_id;
create SEQUENCE seq_book_id increment by 1 start with 1;

--book insert=========================================
insert into book(book_id,title,pubs,pub_date,author_id)
values (seq_book_id.nextval,'우리들의 일그러진영웅','다림','1998-02-02', 1);

insert into book(book_id,title,pubs,pub_date,author_id)
values (seq_book_id.nextval,'삼국지','만흥사','2002-03-01',1);

insert into book(book_id,title,pubs,pub_date,author_id)
values (seq_book_id.nextval,'토지','마로니에북스','2012-08-15',2);

insert into book(book_id,title,pubs,pub_date,author_id)
values (seq_book_id.nextval, '유시민의 글쓰기 특강','생각의길','015-04-01',3);

insert into book(book_id,title,pubs,pub_date,author_id)
values (seq_book_id.nextval,'패션왕','중앙북스(books)','2012-02-22',4);

insert into book(book_id,title,pubs,pub_date,author_id)
values (seq_book_id.nextval,'순정만화','재미주의','2011-08-03',5);

insert into book(book_id,title,pubs,pub_date,author_id)
values (seq_book_id.nextval,'오직두사람','문학동네','2017-05-04',6);

insert into book(book_id,title,pubs,pub_date,author_id)
values (seq_book_id.nextval,'26년','재미주의','2012-02-04',5);

--출력
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

--강풀 정보 변경
update author
set author_desc = '서울특별시'
where author_name = '강풀';
--author에서 기안84 값 삭제 (안됌) 패션왕을 삭제하고 하기.
delete from book
where author_id = 4;
delete from author
where author_id = 4;

--출력
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
CREATE TABLE author (--pk만사용해 테이블 만들기
  author_id	NUMBER(10) ,
  author_name	VARCHAR2(100), 	
  author_desc	VARCHAR2(500),
  PRIMARY 	KEY(author_id)	
);

CREATE TABLE book(--pk값과 fk값을 지정해 테이블 만들기
    book_id number(10) ,
    title varchar2(100),
    pubs varchar2(100),
    pub_date date,
    author_id number(10) NOT NULL,--null 값을 못넣게함
    primary key(book_id), --데이터의 유일성 테이블 당 하나만 가능함 
    constraint book_fk foreign key(author_id)
    references author(author_id)
    -- 외래키 다른 테이블과 연결함 다른데이블에 없는 값은 사용 할수없다
);

alter table book add(pubs varchar2(50)); --컬람 추가
alter table book modify(pubs varchar2(100)); --컬럼 수정
alter table book rename column title to subject; -- 컬럼 이름 변경
alter table book drop (author); --컬럼 삭제
rename book to oracle; --테이블명 수정
DROP TABLE book; --테이블 제거
TRUNCATE TABLE article; --테이블의 모든 로우 제거

--묵시적 값 집어넣기
insert into author values(2,'이문열');

--명시적 값 집어넣기
insert into author( author_id, author_name )
values (2, '이문열' );

--데이터 변경
update author
set author_name = '기안84',
    author_desc = '웝툰작가'
where author_id = 2;

delete from author;--조건을 달아주지 않으면 전부 날라감
--where

create SEQUENCE seq_author_id increment by 1 start with 1; --시퀀스 생성
--생성하고 값을 한번 증가 
drop sequence seq_author_id; --시퀀스 삭제
select SEQ_author_ID.currval from dual;--현제 시퀀스값 조회 값이 없으면 조회가 안됨
select SEQ_author_ID.nextval from dual;--현재 시퀀스 값 증가

select * from USER_SEQUENCES; --무슨 시퀀스가 있는지 확인 

select * from book;
select * from author;

select *
from book , author
where book.author_id = author.author_id;

COMMIT; --종료전 이걸해줘야 실제 데이터에 들어감 그전엔 view랑 다를게 없음.

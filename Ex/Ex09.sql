-- webdb 계정에 book 테이블 만들기
create table book(
    book_id     number(5), 
    title       varchar2(50),
    author      varchar2(10),
    pub_date    date);
    
select  *
from   article;

-- book 테이블에 pubs 컬럼 추가하기
alter table book add(pubs varchar2(50));

-- book 테이블에 컬럼속성 변경하기
alter table book modify(title varchar2(100));

-- book 테이블에 컬럼명 변경하기
alter table book rename column title to subject;

-- 컬럼삭제
alter table book drop(author);

-- 테이블 명 변경하기
rename book to article;

-- 테이블 삭제
drop table article;


-- 작가(author) 테이블 만들기
create table author(
    author_id       number(10),
    author_name     varchar2(100) not null,
    author_desc     varchar2(500),
    primary key(author_id));

-- 책(book) 테이블 만들기
create table book(
    book_id         number(10),
    title           varchar2(100) not null,
    pubs            varchar2(100),
    pub_date        Date,
    author_id       number(10),
    primary key(book_id),
    constraint book_fk foreign key (author_id)
    references author(author_id));

-- 작가(author) 테이블에 데이터 추가(INSERT)
insert into author 
values(1, '박경리', '토지 작가');

insert into author(author_id, author_name)
values(2, '이문열');

insert into author
values(3, '기안84', '웹툰 작가');


-- 작가 테이블 정보 수정 UPDATE
update  author
set     author_name= '김경리',
        author_desc= '토지작가'
where   author_id= 1;

-- 작가 테이블 정보 삭제 DELETE
delete from author
where       author_id= 1;

-- SEQUENCE 시퀀스 (번호표)
create sequence seq_author_id
increment by 1
start with 1
nocache;

insert into author
values(seq_author_id.nextval, '박경리', '토지작가');

insert into author
values(seq_author_id.nextval, '이문열', '삼국지 작가');

insert into author
values(seq_author_id.nextval, '강풀', '웹툰작가');

-- 시퀀스 조회
select * from user_sequences;

-- 현재 시퀀스 조회
select  seq_author_id.currval
from    dual;

-- 다음 시퀀스 조회
select  seq_author_id.nextval
from    dual;

-- 시퀀스 삭제
drop sequence seq_author_id;




select * from book;
select * from author;
select * from all_tables;
### 데이터베이스 생성 / 테이블 생성 ###
-- a_market_db

-- 전체(해당 페이지) SQL문 실행: ctrl + shift + enter
-- 선택된(마우스 클릭 or 드래그) 영역의 SQL문 실행: ctrl + enter

-- 인터넷 마켓 market_db (데이터베이스)
-- 회원 / 구매 (테이블)

drop database if exists market_db;
create database market_db;

-- 데이터 베이스 선택 SQL문
use market_db;

-- 회원 테이블 (member)
-- create table 테이블명(컬럼명, 데이터타입, 옵션);
-- 아이디, 이름(아이돌), 인원, 주소, 국번, 전화번호, 평균 키, 데뷔 일자

create table member 
(
	mem_id char(8) not null primary key, -- 회원 아이디
    mem_name varchar(10) not null, -- 회원 이름
    mem_number int not null, -- 인원수
    addr char(2) not null, -- 주소(경기, 서울, 경남 - 2글자만 입력)
    phone1 char(3), -- 연락처의 국번(02, 051, 042 등)
    phone2 char(8), -- 연락처의 나머지 전화번호 (하이픈 제외)
    height smallint, -- 평균 키
    debut_date date -- 데뷔 일자
);

-- 구매 테이블 (buy)
-- 순번, 아이디, 물품명, 분류, 단가, 수량

create table buy 
(
	num int auto_increment not null primary key, -- 순번
    mem_id char(8) not null, -- 아이디(FK)
    prod_name char(6) not null, -- 제품명
    group_name char(4), -- 분류
    price int not null, -- 단가
    amount smallint not null, -- 수량
    foreign key (mem_id) references member(mem_id)
);

-- 각 테이블에 데이터 삽입
-- 회원 테이블 데이터 삽입
insert into member 
values('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015-10-19');
insert into member 
values('BLK', '블랙핑크', 4, '경남', '055', '22222222', 163, '2016-08-08');
insert into member 
values('WMN', '여자친구', 6, '경기', '031', '33333333', 166, '2015.01.15');
insert into member 
values('OMY', '오마이걸', 7, '서울', null, null, 160, '2015.04.21');
insert into member 
VALUES('GRL', '소녀시대', 8, '서울', '02', '44444444', 168, '2007.08.02');
insert into member 
VALUES('ITZ', '잇지', 5, '경남', NULL, NULL, 167, '2019.02.12');
insert into member 
VALUES('RED', '레드벨벳', 4, '경북', '054', '55555555', 161, '2014.08.01');
insert into member 
VALUES('APN', '에이핑크', 6, '경기', '031', '77777777', 164, '2011.02.10');
insert into member 
VALUES('SPC', '우주소녀', 13, '서울', '02', '88888888', 162, '2016.02.25');
insert into member 
VALUES('MMU', '마마무', 4, '전남', '061', '99999999', 165, '2014.06.19');

-- 구매 테이블
INSERT INTO buy VALUES(NULL, 'BLK', '지갑', NULL, 30, 2);
INSERT INTO buy VALUES(NULL, 'BLK', '맥북프로', '디지털', 1000, 1);
INSERT INTO buy VALUES(NULL, 'APN', '아이폰', '디지털', 200, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '아이폰', '디지털', 200, 5);
INSERT INTO buy VALUES(NULL, 'BLK', '청바지', '패션', 50, 3);
INSERT INTO buy VALUES(NULL, 'MMU', '에어팟', '디지털', 80, 10);
INSERT INTO buy VALUES(NULL, 'GRL', '갤럭시버즈', '서적', 15, 5);
INSERT INTO buy VALUES(NULL, 'APN', '갤럭시버즈', '서적', 15, 2);
INSERT INTO buy VALUES(NULL, 'APN', '청바지', '패션', 50, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 1);
INSERT INTO buy VALUES(NULL, 'APN', '갤럭시버즈', '서적', 15, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 4);
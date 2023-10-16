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
-- 순번, 아이디, 물품명, 분류, 단가, 수량v





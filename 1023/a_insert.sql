### 데이터 변경을 위한 SQL문 ###

use market_db;
# insert, update, delete에 기능 추가

create table practice01 
	(toy_id int, toy_name char(4), age int);
    
# insert문
# insert into 테이블명 (열1, 열2, ...)
# values (값1, 값2, ...)

# 1. 열 이름 생략 시
# : values 다음에 나오는 값들의 순서 및 개수는
# 테이블 정의 시 지정한 열 순서 및 개수와 동일하게 지정
insert into practice01 values (1, '우디', 25);
insert into practice01 values ('2', 우디, '25');

# 2. 원하는 열의 데이터만 삽입할 경우
# : 테이블명 다음에 입력할 열의 이름을 작성
insert into practice01 (toy_id, toy_name)
values (2, '버즈');

# 3. auto_increment: 자동 증가
# : 열을 정의할 때 1부터 증가하는 값을 입력
# : insert문 작성 시 해당 열이 없다고 가정하고 입력
# : primary key 지정 (중복 값X, 필수 값)

create table practice02 (
	toy_id int auto_increment primary key,
    toy_name char(4),
	age int
);

# 자동 증가하는 열은 null값으로 채워넣음.
insert into practice02 values(null, '보핍', 25);
insert into practice02 values(null, '슬링키', 22);
insert into practice02 values(null, '렉스', 21);

select * from practice02;

-- 최종 자동 증가 입력 수 확인
select last_insert_id();

-- auto_increment 자동 증가 '시작 수' 변경
-- ex. 입력되는 다음 값을 100으로 지정
alter table practice02 auto_increment=100;
insert into practice02 values (null, '재남', 35);

-- auto_increment 자동 증가 수 변경
-- ex. 다음 값 증가가 +3씩 이루어지도록 지정(1000, 1003, 1006)
-- 시스템 변수인 @@auto_increment_increment를 변경
-- : MySQL에서 자체적으로 가지고 있는 설정값이 저장된 변수
-- : 앞에 @@가 붙는 것이 특징
-- : 사용자가 원하는 대로 변경 가능

-- : 해당 시스템 변수 설정은 일반적으로 
--   MySQL 서버 세션이 지속되는 동안만 유지

create table practice03 (
	toy_id int auto_increment primary key,
    toy_name char(4),
    age int
);
-- 시작값을 1000으로 지정
alter table practice03 auto_increment=1000;
-- 증가값은 3으로 지정
set @@auto_increment_increment=3;

insert into practice03 values (null, '토마스', 20);
insert into practice03 values (null, '제임스', 23);
insert into practice03 values (null, '고든', 25);

select * from practice03;

-- 여러 데이터 삽입 문을 한 줄로 작성
insert into practice03 
values (null, '토마스', 20)
, (null, '제임스', 23)
, (null, '고든', 25);

# 다른 테이블의 데이터를 한 번에 입력
# insert into ~ select
# : select문의 열 개수는 insert할 테이블의 열 개수와 동일

-- insert into 테이블명 (열이름1, 열이름2, ...)
--   select문;

-- world 데이터베이스의 city 테이블의 개수를 조회
select count(*) from world.city;

-- 테이블의 구조 확인: desc(describe: 묘사하다)
-- : create table의 구조 파악
desc world.city;

-- 테이블의 데이터 확인 (제한 - 상위 5개)
select * from world.city limit 5;

-- world 데이터베이스 city 테이블의 
-- 도시 이름(Name)과 인구(Population) 데이터 추출

use market_db;
create table city_popul 
(city_name char(35), population int);

insert into city_popul
	select Name, Population from world.city;

select * from city_popul;
select count(*) from city_popul;
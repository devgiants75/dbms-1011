### DDL 문법 정리 ###
# create, alter, drop, truncate 

-- 1. 테이블 생성 (create)
-- 1-1. GUI 방식으로 스키마 & 테이블 생성

-- GUI (Graphic User Interface)
-- : 사용자가 편리하게 사용할 수 있도록 입출력 등의 기능을 
-- : 알기 쉬운 아이콘 등의 그래픽으로 나타낸 것

-- 인코딩(encoding)
-- : 정보의 형태나 형식을 변환하는 처리나 처리 방식
-- utf-8: 전 세계에서 가장 많이 사용하는 유니코드 인코딩

-- ! 데이터베이스 생성
-- : 왼쪽 상단 아이콘 메뉴바 네 번째의 스키마 아이콘 선택
-- : 스키마명 입력 후 > 인코딩 설정 utf8, utf8_general_ci로 설정

-- ! 테이블 생성
-- : 왼쪽 네비게이션 패널에서 생성하고자 하는 위치의 스키마 선택(더블 클릭)
-- : 선택된 스키human_resourceshuman_resourceshuman_resources마 Tables에서 마우스 오른쪽 클릭 > Create Table 선택
-- : 테이블 설정(테이블명, 컬럼명, 컬럼 조건 지정)
-- : 반드시 Apply 버튼 클릭하여 생성

-- 1-2. SQL문 방식으로 스키마/테이블 생성(create)
-- SQL Editor 열기: 상단 메뉴 File > New Query Tab 선택 

-- 스키마 생성 SQL문: create database 스키마(데이터베이스)명;
create database company;

-- 테이블 생성 SQL문: create table 스키마명.테이블명 (
--   컬럼1 데이터타입 옵션,
-- 	 컬럼2 데이터타입 옵션,
--   ...
-- 
-- )
-- default character set = utf8;

-- 컬럼: 테이블에 포함될 열의 이름
-- 데이터타입: 각 열의 데이터 유형을 정의 (ex. 문자, 숫자, 날짜)
-- 옵션: 제약조건

create table `company`.`human_resources` (
	employee_number int auto_increment primary key,
    employee_name varchar(50) not null,
    employee_age int not null,
    employee_score int not null,
    employee_email varchar(100)
)
default character set = utf8;

-- 2. 테이블 수정(alter)
-- 2-1. GUI 방식으로 열 추가/수정/삭제
-- : 좌측 상단의 Navigator 패널에서 변경하려는 테이블을 우클릭
-- : Alter Table을 선택
-- : 해당 페이지에서 열 추가/수정/삭제 후 반드시 apply 버튼을 클릭하여 적용

-- 2-2. SQL문 방식으로 열 추가/수정/삭제(alter)
-- alter table [테이블명] add/modify/drop column [컬럼명] [데이터타입] [제약조건];

-- 열 추가
alter table `human_resources`
add column employee_vacation_date date;

-- 열 수정
alter table `human_resources`
modify column employee_email varchar(150) not null;

-- 열 삭제
alter table `human_resources`
drop column employee_score;

-- 열 이름 변경 (change) [기존 열이름 새로운 열이름 데이터타입 (옵션)]
alter table `human_resources`
change column `employee_number` `employee_num` int;

-- 제약 조건(옵션) 수정
-- 제약 조건 수정 시에는 add 제약조건(열이름) 작성
alter table `human_resources`
add primary key (employee_num);

-- 3. 테이블 삭제(drop)
-- 3-1. GUI 방식으로 스키마/테이블 삭제
-- : 좌측 상단의 Navigator 패널에서 삭제하고자 하는 스키마/테이블 확인
-- : 삭제하고자하는 스키마/테이블명 우클릭
-- : Drop Schemas/Table 옵션 선택

-- 3-2. SQL을 사용한 스키마/테이블 삭제
-- 스키마 삭제 문법
drop database `company`;

-- 테이블 삭제 문법
-- 데이터베이스명.테이블명 / 데이터베이스를 선택한 경우에는 테이블명만 작성 가능
drop table `company`.`human_resources`;
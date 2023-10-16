### 데이터베이스 DML ###
# b_데이터베이스DML

-- DML(Data Manipulation Language)
-- : 데이터 관리 언어
-- : 데이터베이스 내의 데이터를 조회, 삽입, 수정, 삭제 기능

-- 1. select
-- : 데이터를 조회하기 위한 SQL 명령어
-- 기본구조
-- select 컬럼명1, 컬럼명2, ...
-- from 테이블명
-- where 조건(condition)

-- 2. insert
-- : 테이블에 새로운 데이터를 삽입하기 위한 SQL 명령어
-- 기본 구조
-- insert into 테이블명 (컬럼명1, 컬럼명2, ...)
-- values (데이터1, 데이터2, ...)

-- : 테이블명, 열 이름(컬럼명) - 따옴표 지정 없이 작성 가능
-- : 데이터값 - 문자열의 경우 따옴표를 붙여서 작성
-- : char, varchar, date 형식
--   따옴표(큰, 작은)로 묶어주어야 한다!

-- 3. update
-- : 테이블의 내용 수정하기 위한 SQL 명령어
-- 기본 구조
-- update 테이블명
-- set 컬럼명1 = 값1, 컬러명2 = 값2, ...
-- where 조건(condition)

-- 4. delete 
-- : 테이블의 데이터를 삭제하기 위한 SQL 명령어
-- 기본 구조
-- delete from 테이블명
-- where 조건(condition)

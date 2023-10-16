### 데이터 조회 (select) ###
# c_Select

use market_db;

### select문의 기본 구조(select문 작성 순서) ###

-- select 컬럼명(열 목록): 원하는 열(컬럼)을 지정
-- from 테이블명: 어떤 테이블에서 데이터를 가져올 지 지정
-- where 조건: 특정 조건에 맞는 데이터만 선택
-- group by 그룹화 할 열이름: 특정 열을 기준으로 그룹화
-- having 그룹 조건: 그룹화 한 후의 조건을 지정
-- order by 정렬 열이름: 결과를 특정 열의 순서로 정렬
-- limit 행 수 제한: 반환할 행의 수를 제한

-- 1. 기본 조회: select ~ from 데이터베이스명.테이블명
select * from market_db.member;
select * from buy;

select mem_name, addr, debut_date from member;

-- 열 이름에 별칭(alias) 지정하는 방법
-- : 열 이름 다음에 지정하고 싶은 별칭을 입력
-- : 별칭에 공백이 있을 경우 따옴표로 묶음
select addr 주소, debut_date '데뷔 일자', mem_name from member;

-- 2. 특정한 조건만 조회: select ~ from ~ where
-- 실무에서 반드시 사용!

-- select 열이름 
-- 	 from 테이블명 
-- 	 where 조건식;

select * 
	from member
	where mem_name = '블랙핑크';

-- 회원 테이블 인원(mem_number)가 4명인 회원을 조회
select *
	from member
    where mem_number = 4;

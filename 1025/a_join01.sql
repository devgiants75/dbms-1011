### 조인(join) ###

# 조인(join - 결합하다)
# : 두 개의 테이블을 서로 묶어서 하나의 결과를 만들어 내는 것

use market_db;
select * from member;
select * from buy;

# 1. (내부) 조인

# 1-1. 일대다 관계(one to many)
# : 기본 키와 외래 키의 관계

# 회원 테이블의 아이디(하나의 값만 존재)
# : 기본 키 지정(Primary Key, PK)
# 구매 테이블의 아이디(여러 개의 값이 존재 가능)
# : 외래 키 지정(Foreign Key, FK)

-- 내부 조인(inner join)의 형식
-- inner 생략 시에도 내부 조인으로 인식
# select 열목록
# from 첫 번째 테이블명
# 	(inner) join 두 번째 테이블명
#	on 조인될 조건
# where 검색 조건

-- 구매 테이블에서 'GRL' 아이디를 가진 사람이 구매한
-- 물건을 발송하기 위해 조인을 통해 이름, 주소, 연락처를 연결

# buy, member 2개의 테이블을 조인할 경우
# 동일한 열 이름이 존재할 때는 반드시, 테이블명.열이름 형식표기

select *
from buy
	inner join member
    on buy.mem_id = member.mem_id
where buy.mem_id = 'GRL';

select * from member;
-- 내부 조인 사용 시 테이블 표현
-- from절과 join문 뒤에 나오는 테이블명 뒤에 별칭을
-- 첨부하여 간결하게 작성하는 것을 적극 권장
select B.mem_id, M.mem_name, B.prod_name, M.addr
	, concat(M.phone1, M.phone2) "연락처"
from buy B
	inner join member M
    on B.mem_id = M.mem_id;

# 내부 조인 활용
-- '전체 회원'의 아이디, 이름, 구매한 제품, 주소 출력
-- 결과는 회원 아이디 순으로 정렬
select M.mem_id, M.mem_name, B.prod_name, M.addr
from buy B
	inner join member M
    on B.mem_id = M.mem_id
order by M.mem_id;

-- 내부 조인의 경우 두 테이블에 데이터(열 목록)가 모두 
-- 있는 내용만 조인되는 방식

-- 양쪽 테이블 중에서 한곳이라도 내용이 있을 때
-- 조인을 하기 위해서는 >> 외부 조인 사용

-- 해당 사이트에서 
-- 한 번이라도 구매한 기록이 있는 회원에게 쿠폰 발송
select distinct M.mem_id, M.mem_name, M.addr
from buy B
	inner join member M
    on B.mem_id = M.mem_id
order by M.mem_id;
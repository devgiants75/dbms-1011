### 기타 조인 ###
# c_join03

# 상호 조인 & 자체 조인 #

# 상호조인 (cross join)
# : 한쪽 테이블의 모든 행과 다른쪽 테이블의 모든 행을 조인
# : 상호 조인의 결과의 전체 행 개수
# : - 두 테이블의 각 행의 개수를 곱한 개수

# 회원 테이블과 구매 테이블의 상호 조인
select *
	from buy
    cross join member;

-- on 구문을 사용할 수 X
-- 결과의 내용은 의미가 X - 랜덤으로 조인
-- 주 용도는 테스트하기 위한 대용량 데이터 생성 시 사용

select count(*) '데이터 개수'
	from sakila.inventory
		cross join world.city; -- 1억 8천개 데이터 생성

-- 대용량 테이블 생성
use market_db;
create table cross_table
	select *
	from sakila.actor -- 200건
		cross join world.country; -- 240건
        
select * from cross_table limit 10;

# 자체 조인(self join)
# : 자신이 자신과 조인

create table emp_table 
	(emp char(4), manager char(4), phone varchar(8));

insert into emp_table values('대표', null, '00');
insert into emp_table values('영업이사', '대표', '11');
insert into emp_table values('관리이사', '대표', '22');
insert into emp_table values('정보이사', '대표', '33');
insert into emp_table values('영업과장', '영업이사', '11-1');
insert into emp_table values('경리부장', '관리이사', '22-1');
insert into emp_table values('인사부장', '관리이사', '22-2');
insert into emp_table values('개발팀장', '정보이사', '33-1');
insert into emp_table values('개발주임', '정보이사', '33-1-1');

-- 자체 조인 형식
-- select 열목록
-- from 테이블 별칭A
-- 	inner join 테이블 별칭
--  on 조인될 조건
-- (where 검색 조건);

-- 경리 부장의 직속 상관의 연락처를 추출
select A.emp "직원", B.emp "직속 상관", B.phone "직속상관연락처"
from emp_table A
	inner join emp_table B
    on A.manager = B.emp
where A.emp = '경리부장'
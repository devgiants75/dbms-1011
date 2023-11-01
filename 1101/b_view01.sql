### 가상의 테이블: 뷰(view) ###
# b_view01

# 뷰(view)
# : 데이터베이스 개체 중 하나

# 뷰는 select문으로 만들어지기 때문에
# : 테이블처럼 데이터를 가지고 있지 X

# 단순 뷰와 복합 뷰로 나뉘어져 있다.
# : 단순 뷰 - 하나의 테이블과 연관된 뷰
# : 복합 뷰 - 2개 이상의 테이블과 연관된 뷰

-- 인터넷 마켓 데이터베이스
use market_db;
select mem_id, mem_name, addr from member;

# 뷰 이름 
# : v_테이블명

# 뷰 생성 형식
-- create view 뷰 이름
-- as
-- 	select문;

# 뷰 접근 방식
-- select 열 이름 from 뷰 이름 (where 조건식);

create view v_member
as
	select mem_id, mem_name, addr from member;

select * from v_member;

select mem_name, addr from v_member
	where addr in ('서울', '경기');

# 뷰의 사용 목적

# 1. 보안(security)에 도움
# : 중요한 개인 정보 유출을 방지
# : 외부에 공개해야 될 데이터가 있는 경우
# : , 해당 데이터만 따로 빼서 뷰를 통해 공개

# 2. 복잡한 SQL을 단순하게 작업

create view v_memberbuy
as
	select B.mem_id, M.mem_name, B.prod_name, M.addr,
		concat(M.phone1, M.phone2) '연락처'
	from buy B
		inner join member M
		on B.mem_id = M.mem_id;

select * from v_memberbuy
	where mem_name = '블랙핑크';
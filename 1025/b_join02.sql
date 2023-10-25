### 외부 조인 ###
# b_join02

# 외부조인(outer join)
# : 두 테이블을 조인할 때 필요한 내용이
# : 한쪽 테이블에만 있어도 결과를 추출 가능

# 외부 조인 형식
# select 열목록
# from 첫 번째 테이블(left 테이블)
# 	<left | right | full>outer join 두 번째 테이블(right 테이블)
#	on 조인될 조건
# (where 검색 조건);

-- left | right outer join
-- : 왼쪽|오른쪽 테이블의 내용은 모두 출력되어야 한다

-- '전체 회원의 구매 기록 출력'
-- : 구매 기록이 없는 회원의 정보도 같이 출력

select M.mem_id, M.mem_name, B.prod_name, M.addr
from buy B -- 오른쪽 테이블
	right outer join member M
    -- 오른쪽에 있는 회원 테이블을 기준으로 외부 조인
	on M.mem_id = B.mem_id
order by M.mem_id;

-- left outer join을 줄여서 left join으로 축약 가능

-- 동일 결괏값 도출(right outer join 사용)
select M.mem_id, M.mem_name, B.prod_name, M.addr
from member M -- 주로 왼쪽 테이블(모두 출력)
	left outer join buy B
    -- 왼쪽에 있는 회원 테이블을 기준으로 외부 조인
	on M.mem_id = B.mem_id
order by M.mem_id;

-- 회원으로 가입만 하고, 한 번도 구매한 적 없는 목록 추출
select distinct M.mem_id, B.prod_name
	, M.mem_name, M.addr
from member M
	left outer join buy B
    on M.mem_id = B.mem_id
where B.prod_name is null
order by M.mem_id;

-- full outer join
-- : 왼쪽 외부 조인과 오른쪽 외부 조인이 합쳐진 것
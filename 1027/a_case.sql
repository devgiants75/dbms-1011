### 데이터 베이스 - 조건문 ###
# a_case

# case문
# : 2가지 이상의 여러 가지 경우일 때 처리 가능한 다중 분기
# : 여러 조건 중에서 선택할 경우

# case문의 기본 형식
-- case
--  when 조건1 then
--   조건1에 해당할 때 실행할 sql문
--  when 조건2 then
--   조건2에 해당할 때 실행할 sql문
--  when ... then
--   ...sql문
--  else (모든 조건에 해당하지 않을 경우 마지막 else문 실행)
--   실행할 sql문
-- end case;

# 시험 점수와 학점 계산
# 90점 이상 A, 80점 이상 B, 
# 70점 이상은 C, 60점 이상은 D, 60점 미만은 F

drop procedure if exists caseProc;

delimiter $$
create procedure caseProc()
begin
	declare point int;
    declare credit char(1);
    set point = 68;
    
    case 
		when point >= 90 then
			set credit = 'A';
		when point >= 80 then
			set credit = 'B';
		when point >= 70 then
			set credit = 'C';
		when point >= 60 then
			set credit = 'D';
		else
			set credit = 'F'; -- 앞의 모든 조건에 해당 X: 'F'
	end case;
	select concat('취득 점수 >>> ', point)
		, concat('학점 >>> ', credit);
end $$
delimiter ;
call caseProc();

# case문의 활용
# 회원들의 총 구매액을 계산해서 회원의 등급
# 1500 이상 > 최우수고객
# 1000 이상 1499 이하 > 우수고객
# 1 이상 999 이하 > 일반고객
# 0 이하(구매한 적 X) > 유령고객

-- 구매 테이블(buy)에서 회원별로 총 구매액 계산
-- 총 구매액이 많은 순서로 정렬
-- mem_id, 총 구매액
use market_db;

select mem_id, sum(price * amount)"총 구매액"
	from buy
    group by mem_id
    order by sum(price * amount) desc;

-- (내부)조인을 사용하여 회원의 이름도 출력
-- B.mem_id, M.mem_name, sum(price * amount)"총 구매액"
select B.mem_id, M.mem_name, sum(price * amount)"총 구매액"
	from buy B
		inner join member M
        on B.mem_id = M.mem_id
    group by B.mem_id
    order by sum(price * amount) desc;

-- 구매하지 않은 회원의 아이디와 이름도 같이 출력
-- 외부 조인(right outer join)
select M.mem_id, M.mem_name, sum(price * amount) "총 구매액",
	case
		when (sum(price * amount) >= 1500) then '최우수고객'
        when (sum(price * amount) >= 1000) then '우수고객'
        when (sum(price * amount) >= 1) then '일반고객'
        else '유령고객'
	end '회원등급'
from buy B
	right outer join member M
    on B.mem_id = M.mem_id
group by M.mem_id
order by sum(price * amount) desc;
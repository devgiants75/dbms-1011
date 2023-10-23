### SQL 변수 사용 ###

# 변수(variable)
# : 사용하고자 하는 데이터를 담는 상자
# : MySQL 워크벤치를 재시작할 때까지는 유지, 종료 시 삭제

# 변수의 선언과 출력
# set: 변수의 선언 & 초기화
-- set @변수이름 = 변수의 값;

# select: 변수의 값 조회/출력
-- select @변수이름;

use market_db;
set @myVar1 = 5;
set @myVar2 = 4.25;

select @myVar1;
select @myVar2;
select @myVar1 + @myVar2; -- 변수끼리의 연산

set @txt = '가수 이름 >> ';
set @height = 166; -- 변수를 선언하고 문자열 또는 정수 대입
select @txt, mem_name 
	from member
	where height > @height; -- 테이블을 조회하면서 변수 활용
	-- height > 166과 동일

-- limit에는 변수를 사용X
-- prepare(준비하다), execute(실행하다)
-- prepare: 실행하지 않고 SQL문만 준비
-- execute: 실행

select mem_name, height from member
	order by height limit 3;
    
set @count = 3; -- @count 변수에 3 대입
-- prepare
-- select ~~ limit ?문
-- limit 다음에 오는 ? - 현재는 모르지만 나중에 채워짐.
prepare mySQL 
from 'select mem_name, height 
		from member
		order by height limit ?';

-- using을 사용하여 물음표에 @count 변수의 값을 대입
execute mySQL using @count;
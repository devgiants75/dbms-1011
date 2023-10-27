### SQL 프로그래밍 - 동적 SQL ###
# c_prepare_execute

# prepare & execute

# prepare: SQL문을 실행하지는 않고 준비
# execute: 준비한 SQL문을 실행
# deallocate prepare: SQL문 실행 후 문장을 해제

use market_db;
-- from문 뒤의 SQL문을 바로 실행하지 않고 myQuery에 입력만 시켜놓는 단계
prepare myQuery from 'select * from member where mem_id = "BLK"';

-- 실행이 필요한 시점에서 execute로 실행
execute myQuery;
deallocate prepare myQuery;

# 동적 SQL문 활용
-- prepare문에서는 ?로 향후 입력될 값을 비워놓고,
-- executer문에서 using으로 ?에 값 전달 가능

# 출입문에서 출입한 내역을 테이블에 기록
# (출입하는 순간의 날짜와 시간을 insert문으로 만들어져서 입력)

drop table if exists gate_table;

create table gate_table 
	(id int auto_increment primary key, entry_time datetime);

-- 일반 SQL 변수 설정: @변수명 (별도의 선언 필요 X)
-- 스토어드 프로시저 변수 설정: declare 키워드로 변수 선언한 후에 사용!

set @curDate = current_timestamp(); -- 현재 날짜와 시간

prepare myQuery from 'insert into gate_table values(null, ?)';
execute myQuery using @curDate;
deallocate prepare myQuery;

select * from gate_table;




### SQL 프로그래밍 ###

# 스토어드 프로시져
# : SQL 안에서 일반 프로그래밍 언어처럼 코딩, MySQL 제공 프로그램

# 스토어드 프로시져 구조
-- delimiter $$

-- create procedure 스토어드_프로시져_이름()
-- begin 
-- 	해당 영역에 SQL 프로그래밍 코딩
-- end $$

-- delimiter ; (종료 문자를 다시 세미콜론으로 변경)

-- call 스토어드_프로시져_이름();

-- delimiter: 구분 문자(주로 $$ 사용, 다른 기호를 2개 연속 나열)


# 1. if문(조건문)
# if문의 기본 형식
# : 조건식이 참이라면 SQL문장을 실행 / 그렇지 않으면 넘어감.

# begin(조건문이 두 문장 이상 처리되어야 하는 경우)
# if 조건식 then 
# 	sql문장(조건식이 참일 때 실행)
# end if;

drop procedure if exists ifProc1;

delimiter $$
create procedure ifProc1()
begin
	if 100 = 100 then
		select '100은 100과 같습니다.'; -- 결과 출력
	end if;
end $$

delimiter ;
call ifProc1(); -- 스토어드 프로시져 실행

# 2. if ~ else문
# : 조건에 따라 다른 부분을 수행
# : 조건식이 참이라면 SQL문장1을 실행
# : 그렇지 않으면 SQL문장2를 실행

drop procedure if exists ifProc2;
delimiter $$
create procedure ifProc2()
begin
	declare myNum int; -- declare 예약어로 변수 선언
    set myNum = 200;
    if myNum = 100 then
		select '100입니다.';
	else 
		select '100이 아닙니다.';
	end if;
end $$
delimiter ;

call ifProc2();

# if문 실습
use market_db;
-- 아이디가 APN(에이핑크)인 회원의 데뷔 일자가 
-- 5년이 넘었는지 확인하고, 넘었을 경우
-- 축하 메시지를 출력

drop procedure if exists ifProc3;

delimiter $$
create procedure ifProc3()
begin
	declare debutDate date; -- 데뷔 일자
    declare curDate date; -- 오늘 날짜
    declare days int; -- 활동한 일수
    select debut_Date into debutDate
		from market_db.member
        where mem_id = 'APN';
		-- select문에 into 변수를 붙이는 경우
        -- 결과를 변수에 저장
        
	set curDate = current_date(); -- 현재 날짜
    set days = datediff(curDate, debutDate); -- 날짜의 차이
    
    if (days/365) >= 5 then
		select concat('데뷔한 지', days, '일이나 지났습니다. 축하합니다!') "결과";
	else 
		select '데뷔 한지' +  days + '일입니다.';
	end if;
end $$
delimiter ;
call ifProc3();
    
-- 날짜 관련 함수
-- current_date(): 오늘 날짜
-- current_timestamp(): 오늘 날짜 및 시간을 함께 출력
-- datediff(날짜1, 날짜2) 
-- : 날짜2부터 날짜1까지의 기간을 일수로 몇일인지 계산
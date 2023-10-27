### SQL 프로그래밍 - 조건문 ###

# while문 (~하는 동안)
# : 필요한 만큼 계속 같은 내용을 반복
# : 조건식이 참인 동안에 SQL문장들을 계속 반복

# while문 기본 형식
-- while 조건식 do
-- 	sql문장
-- end while;

# 1에서 100까지 값을 모두 더하는 while문 작성
drop procedure if exists whileProc;
delimiter $$
create procedure whileProc()
begin
	declare i int; -- 1에서 100까지 증가할 변수
    declare hap int; -- 더한 값을 누적할 변수
    set i = 1;
    set hap = 0;
    
    while (i <= 100) do
		-- hap의 원래 값에 i를 더해서 다시 hap에 넣으라는 의미
		set hap = hap + i;
        -- i의 원래 값에 1을 더해서 다시 i에 넣으라는 의미
        set i = i + 1;
	end while; -- i가 100 이하인 동안에 계속 반복
    select '1부터 100까지의 합 >>> ', hap;
end $$
delimiter ;
call whileProc();

# 1에서 100까지의 합계에서 4의 배수를 제외시키려면
# 1 + 2 + 3 + 5 + 6 + 7 + 9 + ...
# 숫자를 더하는 중간에 합계가 1,000이 넘으면 종료

# iterate문과 leave문을 사용하여 프로그래밍
# iterate 레이블: 지정한 레이블로 가서 계속 진행
# leave 레이블: 지정한 레이블을 빠져나갑니다. (while문 종료)

drop procedure if exists whileProc2;
delimiter $$
create procedure whileProc2()
begin
	declare i int;
    declare hap int;
    set i = 1;
    set hap = 0;
    
    -- 레이블 지정
    -- 레이블 명: 레이블 SQL 프로그래밍 작성
    myWhile: -- while문을 myWhile이라는 레이블로 지정
    while (i <= 100) do
		-- +, -, *, /, %(몫으로 나눈 나머지)
		if (i%4 = 0) then
			set i = i + 1;
            iterate myWhile; -- 지정한 label 문으로 가서 계속 진행
		end if;
        set hap = hap + i;
        if (hap > 1000) then
			leave myWhile; -- 지정한 label을 떠남. (while문 종료)
		end if;
        set i = i + 1;
	end while;
    
    select '1부터 100까지의 합(4의 배수 제외), 1000이 넘으면 종료 >>>'
		, hap;
end $$
delimiter ;
call whileProc2();


### 데이터 형 변환 ###
# e_conversion

# 형 변환
# : 문자형을 정수형으로 바꾸거나, 정수형을 문자형으로 변환하는 것

# 1. 명시적인 형 변환
# : 직접 함수를 사용하여 변환

-- cast()
-- : cast( 값 as 데이터형식 (길이))

-- convert()
-- : convert ( 값, 데이터형식 (길이))

-- buy테이블에서 평균 가격을 구하는 SQL
select avg(price) as '평균 가격' from buy; -- 결과값: 142.9167

-- cast() 또는 convert() 함수에는 int 데이터 형식 사용 X
-- signed: 부호가 있는 정수
-- unsigned: 부호가 없는 정수
select cast(avg(price) as signed) '평균 가격' from buy;
select convert(avg(price), signed) '평균 가격' from buy;

-- data 형식 yyyy-mm-dd
select cast('2023$10$23' as date) '오늘 날짜';
select cast('2023^10^23' as date) '오늘 날짜';
select cast('2023/10/23' as date) '오늘 날짜';

-- 가격(price)와 수량(amount)를 곱한 실제 구매액 표시
-- concat('a ', 'b ', 'c'): 문자를 이어주는 역할 = 'a b c'
select num
, concat(
	cast(price as char), 'X', cast(amount as char), '='
) '가격 X 수량'
, price * amount '구매액'
from buy;

# 2. 암시적인 형 변환
# : 별도의 지시 없이 자동으로 변환
select '100' + '200';
-- 서로 다른 문자열을 나열 할 경우 + 연산식이 아닌 concat()함수를 사용
select concat('100', '200') as '100 + 200';

-- 숫자와 문자를 concat 함수로 연결 시
-- 숫자가 자동으로 문자로 변환되어 출력
select concat(100, '200');

-- 숫자와 문자를 연산식으로 나열할 경우 문자가 자동으로 숫자로 변환
select 100 + '200';
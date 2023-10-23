### 데이터 변경을 위한 SQL문 ###

# update문: 데이터 수정
-- update 테이블명
-- set 열1=값1, 열2=값2, ...
-- where 조건;

use market_db;
update city_popul
	set city_name = '서울'
    where city_name = 'Seoul';
    
select * 
	from city_popul
    where city_name = '서울';
    
-- 한꺼번에 여러 열의 값 변경
update city_popul
	set city_name = '뉴욕', population = 0
    where city_name = 'New York';

select * from city_popul
	where city_name = '뉴욕';

-- city_popul 테이블 인구(population) 열이
-- 1명 단위로 데이터가 저장
select * from city_popul
	where city_name = 'Kabul';
    
update city_popul
	set population = population / 10000;
	
select * from city_popul limit 10;
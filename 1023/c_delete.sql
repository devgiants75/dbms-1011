### 데이터 변경을 위한 SQL문 ###

# delete: 데이터 삭제

-- delete from 테이블명 where 조건;

-- city_popul 테이블에서 'New'로 시작하는 도시를 삭제

delete from city_popul
	where city_name like 'New%';
    
# delete, drop, truncate #
create table big_table01 
(select * from world.city, sakila.country);

create table big_table02
(select * from world.city, sakila.country);

create table big_table03
(select * from world.city, sakila.country);

select count(*) from big_table01;

-- delete: 삭제가 오래걸림.
delete from big_table01; -- 3.5초
select * from big_table01;

-- drop: 테이블 자체 삭제, 삭제가 빠름.
drop table big_table02; -- 0.03초
select * from big_table02;

-- truncate: 빈 테이블을 남기고 데이터만 삭제, 삭제가 빠름
-- 			where 조건식 사용 불가(조건 없이 전체 행을 삭제할 때 사용)
-- DDL: 데이터 정의 언어
truncate table big_table03; -- 0.04초
select * from big_table03;
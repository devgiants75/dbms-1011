### SELECT 문 ###

# group by 절 #
# : 그룹으로 묶어주는 역할

# select 작성순서
# sfw, ghol

use market_db;
select * from member;
select * from buy;

# 구매 테이블(buy)에서 
# 회원(mem_id)이 구매한 물품의 개수(amount)

select mem_id as "회원 아이디", sum(amount) as "총 구매 개수"
	from buy
	group by mem_id;
    
# 별칭은 작은 따옴표 보다 큰 따옴표 사용을 권장
# : 작은 따옴표는 insert 등(SQL문)에서 문자를 입력할 때
# : as 키워드 생략 가능

# 집계함수: 주로 group by 절과 함께 사용해 데이터를 그룹화

# sum(): 합계
# avg(): 평균
# min(): 최소값
# max(): 최대값
# count(): 행의 개수
# count(distinct): 행의 개수(중복은 1개만 인정)

# 전체 회원이 구매한 물품 개수(amount) 의 평균
# : 회원이 한 번 구매할 때마다 평균 몇 개를 구매하는지
select avg(amount) "평균 구매 개수" from buy;

# 각 회원이 한 번 구매 시 평균 몇 개를 구매
# 회원(mem_id)별로 구매
select mem_id, avg(amount)
	from buy
    group by mem_id;
    
# 회원 테이블에서 연락처가 있는 회원의 수를 카운트
select count(phone1) "연락처가 있는 회원" from member;

# Students 테이블에서 
# 각 학생의 성(LastName)을 중복 없이 조회하되 - distinct
# , 가장 많이 등장하는 성부터 나열 - count(내림차순)
# : 서브쿼리(from)

use practice;

# 1. 서브 쿼리
select LastName, count(*) as cnt
	from students
    group by LastName; -- LastName 컬럼을 기준으로 그룹화

# 2. 메인 쿼리
select LastName
	from (
		select LastName, count(*) as cnt
			from students
			group by LastName
    ) as SubQuery -- 서브쿼리를 '일반 테이블'처럼 사용
    order by cnt desc;

-- students 테이블의 LastName을 수정하는 SQL문
update students set LastName = 'Deo' where studentID = 101;
update students set LastName = 'Deo' where studentID = 103;
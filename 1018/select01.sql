### 데이터 조회하기(SELECT) ###
# select01

use market_db;

# select문의 기본 형식
select * from market_db.member;

# select문의 작성 순서
# select 열이름 
# from 테이블명
# where 조건식
# group by 열이름
# having 조건식
# order by 열이름
# limit 숫자

# 특정 조건 조회하기: select ~ from ~ where
# where절: 조회하는 결과에 특정한 조건을 추가해서 원하는 데이터만 출력
# select 열_이름 
#	from 테이블_이름 
#	where 조건식;

select *
	from member
    where mem_name = '블랙핑크';

# 1. 관계 연산자, 논리 연산자

# 관계 연산자(부등호)
# >(크다) <(작다) >=(크거나 같다) <=(작거나 같다)
select mem_id, mem_name
	from member
    where height <= 162;

# 논리 연산자
# and(그리고) or(또는) not(아니다)
# and: 모든 조건이 참이어야 참
# or: 조건 중에 하나라도 참이면 참
# not: 조건의 결과를 반대

# 평균 키가 165이상이면서 인원은 6명이 초과하는 회원
select mem_name, height, mem_number
	from member
    where height >= 165 and mem_number > 6;

# 2. between ~ and
# : 지정된 범위 내에 있으면 참

# 평균키: 163 ~ 165인 회원 조회
select mem_name, height
	from member
    -- where height >= 163 and height <= 165;
    where height between 163 and 165;
    
# 3. in()
# : 지정된 리스트 중 하나와 일치하면 참
# : 문자로 표기된 데이터에 범위를 추가할 때 

# 경기, 전남, 경남 중에서 한 곳에 사는 회원 검색
select mem_name, addr
	from member
    -- where addr = '경기' or addr = '전남' or addr = '경남'; 
    where addr in('경기', '전남', '경남');
    
# 4. like (%: 무엇이든 허용한다, _: 한 글자만 허용)
# : 문자열의 일부 글자를 검색

# 이름의 첫 글자가 '우'로 시작하는 회원 검색
select *
	from member
    where mem_name like '우%';
    
select * 
	from member
    where mem_name like '__핑크';

# 5. is null 연산자 / is not null 연산자
# : 값이 null인 경우에 참 / 값이 null이 아닌 경우에 참

select *
	from market_db.member
    where phone1 is not null;
    
select *
	from market_db.member
    where phone1 is null;    
    
# 6. 날짜, 시간 조회
select * 
	from member 
    where debut_date = '2019-02-12';
    
# 특정 시간 기준 이후의 데이터 조회 (컬럼명 > 특정시간)
select *
	from market_db.member
    where debut_date > '2016-01-01';
    
# 특정 시간 사이의 데이터 조회: between ~ and 사용
select *
	from member
    where debut_date 
		between '2015-01-16' and '2016-12-31';

# 날짜나 시간의 특정 부분과 일치하는 데이터 조회

# 연도 일치: year()
# 2015년의 모든 데이터 조회
select *
	from member
    where year(debut_date) = 2015;

# 월 일치: month()
# 일 일치: day()

# 시간 일치: hour()
    
# 현재 날짜나 현재 시간을 기준으로 조회
# : curdate(), now()

# 현재 이전의 데뷔 일자 조회
select *
	from member
    where debut_date < curdate();
    
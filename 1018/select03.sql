### Select문 - 정렬 ###

# order by: 결과를 정렬
# limit: 결과의 개수를 제한
# distinct: 중복된 데이터를 제거
# group by: 지정한 열의 데이터들을 같은 데이터끼리 묶어서 결과 추출
# having: 그룹화된 데이터에 조건을 추가

# 1. order by절
# : 결과의 값이나 개수에 대해서는 영향 X
# : 결과가 출력되는 순서를 조절

# 데뷔 일자가 빠른 순서대로 출력(오름차순, 순서대로, ascending)
# 오름차순 키워드인 asc는 주로 생략(기본값)
select mem_id, mem_name, debut_date
	from member
    order by debut_date;

# 데뷔 일자가 느린 순서대로 출력(내림차순, descending)
select mem_id, mem_name, debut_date
	from member
    order by debut_date desc;

# 평균 키가 164 이상인 회원들을 키가 큰 순서대로 조회
select mem_id, mem_name, height
	from member
    where height >= 164
    order by height desc;

# select문 작성 순서 ghol
# : Giant Happy Octopus Laughs(거대한 행복한 문어가 웃는다)

# 정렬된 데이터에 또 다른 정렬 조건을 추가할 경우
# 정렬 조건식을 ,(쉼표)로 구분해 나열
select mem_id, mem_name, debut_date, height
	from member
    where height >= 164
    order by height desc, debut_date asc;

# ghol
# 2. limit
# : 출력하는 개수를 제한
# : limit 시작, 개수
# : limit 개수 offset 시작
# : 시작 번호는 0 (생략할 경우 기본값 0)

# 회원 테이블 조회하는데 전체 중 앞의 3건만 출력

select *
	from member
    order by height desc
    limit 3;

# 3. distinct
# : 중복된 결과를 제거
# : 조회된 결과에서 중복된 데이터가 존재할 경우 1개만 남기고 생략
# : 조회할 열 이름 앞에 distinct키워드를 작성

select distinct addr 
	from member
    order by addr;
    
-- 실습 예제
use practice;
# Students 테이블에서 중복없이 사용되는 
# 모든 전공을 알파벳 오름차순 나열
select distinct major
	from students
    order by major asc;

# Students 테이블에서 '서로 다른 이메일 도메인을 사용'하는 학생 중
# 이메일을 알파벳 오름차순 정렬, 상위 5개의 이메일만 조회
select distinct email
	from students
    order by email asc
    limit 5;

# 전공 - 오름차순 정렬
# , 같은 전공을 가진 학생들 사이에서는 나이가 적은 순으로 나열
select *
	from students
    order by major asc, age asc;

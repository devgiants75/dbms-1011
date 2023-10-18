### 서브 쿼리 ###
# select02

# 서브(하위) 쿼리란?
# : SQL 문자 내부에 또 다른 SQL 문장이 삽입
# : select안에 또 다른 select가 삽입

# 이름이 '에이핑크'인 회원의 평균 키보다 큰 회원을 검색

# 에이핑크의 평균 키(평균 키 컬럼)
select height
	from member
    where mem_name = '에이핑크';
    
-- 에이핑크의 평균 키: 164 

# 해당 평균 키(164)보다 큰 회원 조회(그룹 명, 평균 키)
select mem_name, height 
	from member
    where height > 164;
    
-- 서브 쿼리를 사용한 데이터 조회
select mem_name, height 
	from member
	where height > 
	(
		select height
			from member
			where mem_name = '에이핑크'
	);
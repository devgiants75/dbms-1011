### where 조건식 연산자 실습 ###

use practice;

select * from courses;
select * from students;

# students 테이블에 age 컬럼 추가
alter table students add age int;

# 기존 학생 데이터에 나이 값을 할당
update students set age = 20 where studentId = 101;
update students set age = 22 where studentId = 102;
update students set age = 24 where studentId = 103;
update students set age = 19 where studentId = 104;
update students set age = 23 where studentId = 105;
update students set age = 21 where studentId = 106;

# 1. Students 테이블에서 전공(Major)이 
# 'Computer Science'인 학생들의 정보를 조회

# 2. Students 테이블에서 전공이 'Computer Science'이거나 
# 'Biology'인 학생들의 정보를 조회

# 3. Students 테이블에서 전공이 
# 'Physics', 'Mathematics' 또는 'History'인 
# 학생들의 정보를 조회

# 4. Students 테이블에서 나이가 20세에서 23세 사이인 학생들의 정보를 조회

# 5. Students 테이블에서 이름이 J로 시작하는 학생들의 정보를 조회

# 6. Students 테이블에서 나이(Age) 정보가 없는 학생들의 정보를 조회

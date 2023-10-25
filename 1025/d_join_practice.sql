### 조인(join) 실습 예제 ###

use practice;

-- 1. 내부 조인

-- 1-1.
# Students 테이블과 Courses 테이블을 
# Major와 CourseName을 기준으로 내부 조인하여
#, 모든 학생의 이름, 전공, 해당 전공의 강사 이름을 조회
select S.FirstName, S.LastName, S.major, C.instructor
from students S
	inner join courses C
    on S.major = C.courseName;

-- 1-2.
# Students 테이블과 Courses 테이블을 
# Major와 CourseName을 기준으로 내부 조인하여
# , 'History' 전공을 가진 학생들의 이름과 
# 해당 강좌의 강사 이름을 조회
select concat(S.FirstName, ' ', S.LastName) "학생 이름"
	, C.instructor
from students S
	inner join courses C
    on S.major = C.courseName
where S.major = 'History';
    
-- 1-3.
# Students 테이블과 Courses 테이블을 
# Major와 CourseName을 기준으로 내부 조인하여
# , 23세 이상인 학생들의 이름, 전공
# , 그리고 해당 강좌의 강사 이름을 조회
select concat(S.FirstName, ' ', S.LastName) "학생 이름"
	,S.major, C.instructor
from students S
	inner join courses C
    on S.major = C.courseName
where S.age >= 23;

-- 2. Left Outer Join (왼쪽 외부 조인)
# Students 테이블과 Courses 테이블을 
# Major와 CourseName을 기준으로 왼쪽 외부 조인하여
# , 모든 학생들과 그들의 전공에 해당하는 강좌의 강사 이름을 조회하세요. 
# 만약 전공에 해당하는 강좌가 없다면, 강사 이름은 NULL로 표시
select concat(S.firstName, S.lastName), S.major, C.instructor
from Students S
	left join Courses C
    on S.major = C.courseName;

-- 3. Cross Join (교차 조인)
# Students 테이블과 Courses 테이블을 교차 조인하여 조회
SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
CROSS JOIN Courses c;

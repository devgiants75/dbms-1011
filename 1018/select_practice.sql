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

--
SELECT * FROM Students WHERE Major = 'Computer Science';
SELECT * FROM Students WHERE Major = 'Computer Science' OR Major = 'Biology';
SELECT * FROM Students WHERE Major IN ('Physics', 'Mathematics', 'History');
SELECT * FROM Students WHERE Age BETWEEN 20 AND 23;
SELECT * FROM Students WHERE Email LIKE 'J%';
SELECT * FROM Students WHERE Age IS NULL;
--
use practice;
select * from students;

# 일부 학생의 전공을 중복되게 설정
# StudentID가 102, 104에 해당하는 데이터의 전공을 Computer Science
# in(): 문자열, 숫자 모두 사용 가능
update students set major = 'Computer Science' 
	where studentID in (102, 104);

# StudentId가 103에 해당하는 데이터의 전공을 History
UPDATE students SET Major = 'History' WHERE StudentID = 103;

# 일부 학생의 성을 중복되게 설정
# StudentID가 102 - Doe, 106 - Taylor
update students set LastName = 'Deo' 
	where studentID = 102;
    
UPDATE Students SET LastName = 'Taylor' 
	WHERE StudentID = 106;

# 일부 학생의 이메일 도메인을 다르게 설정
# StudentID가 102 - 'janesmith@naver.com
# StudentID가 103 - robertj@naver.com
# StudentID가 104 - emilyb@naver.com
UPDATE Students SET Email = 'janesmith@yahoo.com' 
	WHERE StudentID = 102;
UPDATE Students SET Email = 'robertj@hotmail.com' 
	WHERE StudentID = 103;
UPDATE Students SET Email = 'emilyb@outlook.com' 
	WHERE StudentID = 104;

### 변수 및 형 변환 실습 ###

use practice;

INSERT INTO courses (CourseID, CourseName, Instructor)
VALUES
(502, 'Computer Science', 'Dr. Johnson'),
(503, 'Physics', 'Dr. Lee'),
(504, 'English Literature', 'Dr. Kim'),
(505, 'History', 'Dr. Park');

-- 1. 문자열 연결하기
-- John 학생의 FirstName, LastName과 
-- 그의 전공을 하나의 문자열로 연결하여 출력
-- 출력 결과: "John Deo's major is Computer Science"
select concat(FirstName, ' ', LastName, "'s major is ", Major) as Result
from students
where studentID = 101;

-- 2. 숫자를 문자열로 변환하기
-- 각 학생의 StudentID를 문자열로 변환하여 FirstName과 함께 출력
-- ex. "101 - John"과 같이 출력
select concat(cast(studentID as char), ' - ', FirstName) as Result
from students;

-- date_format() 함수
-- : 날짜 및 시간 값을 지정된 형식의 문자열로 변환하는 함수

select date_format(birth_date, '%D-%M-%Y') as FormattedBirthDate
from students;

-- %d(D), %m(M) - 일, 월을 두 자릿수로 표현 (01 ~ 31, 01 ~ 12)
-- %Y - 연도를 네자릿수로 표시
-- %y - 연도를 두자릿수로 표시

alter table students
add column birth_date date;

UPDATE students SET birth_date = '2003-01-15' WHERE StudentID = 101;
UPDATE students SET birth_date = '2002-05-22' WHERE StudentID = 102;
UPDATE students SET birth_date = '1999-08-13' WHERE StudentID = 103;
UPDATE students SET birth_date = '2004-11-05' WHERE StudentID = 104;
UPDATE students SET birth_date = '2001-12-30' WHERE StudentID = 105;
UPDATE students SET birth_date = '2003-03-27' WHERE StudentID = 106;
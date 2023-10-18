### 데이터베이스 DML 문법 실습 ###
# z_practice

use practice;
/*
1. Students 테이블에 phone라는 칼럼을 추가 
데이터 타입: VARCHAR
최대 길이: 15
NULL 값 허용
*/
/*
2. Students 테이블의 Major 칼럼의 
데이터 타입을 VARCHAR(150)로 
변경하려면 어떤 SQL문을 사용해야 할까요?
*/
/*
3. 새로운 테이블 Courses를 만들려고 합니다. 

CourseID: 강좌를 유일하게 식별하는 ID. 
	(정수형, 주요 키, NULL 불허)
CourseName: 강좌 이름 
	(문자열, 최대 길이 100, NULL 불허)
Instructor: 강좌의 지도 교수 
	(문자열, 최대 길이 50, NULL 허용)
*/

/*member
4. Students 테이블에서 Age 칼럼을 삭제 SQL 작성
*/
ALTER TABLE Students ADD Phone VARCHAR(15) NULL;

ALTER TABLE Students MODIFY COLUMN Major VARCHAR(150);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY NOT NULL,
    CourseName VARCHAR(100) NOT NULL,
    Instructor VARCHAR(50) NULL
);

ALTER TABLE Students DROP COLUMN Age;

-- DML 문법 실습
/*
1.
Students 테이블에 다음 학생의 정보를 추가하세요.

StudentID: 101
FirstName: "John"
LastName: "Doe"
Major: "Computer Science"
Email: "johndoe@email.com"
Phone: "123-456-7890"

2.
Students 테이블에서 StudentID가 101인 학생의 
Major를 "Electrical Engineering"로 변경하는 SQL문을 작성하세요.

3. 
Students 테이블에서 StudentID가 101인 학생의 정보를 삭제하는 SQL문을 작성하세요.

4. 
Courses 테이블에 다음 강좌 정보를 추가하세요.

CourseID: 501
CourseName: "Introduction to AI"
Instructor: "Dr. Smith"

5.
Students 테이블에서 Major가 "Computer Science"인 학생들의 전체 정보를 조회하는 SQL문을 작성하세요.

### 데이터 추가 ###
*/

INSERT INTO Students (StudentID, FirstName, LastName, Major, Email, Phone) 
VALUES (101, 'John', 'Doe', 'Computer Science', 'johndoe@email.com', '123-456-7890');

UPDATE Students 
SET Major = 'Electrical Engineering' 
WHERE StudentID = 101;

DELETE FROM Students 
WHERE StudentID = 101;

INSERT INTO Courses (CourseID, CourseName, Instructor) 
VALUES (501, 'Introduction to AI', 'Dr. Smith');

SELECT * FROM Students 
WHERE Major = 'Computer Science';

### 데이터 추가 ###
-- 학생 1
INSERT INTO Students (StudentID, FirstName, LastName, Major, Email, Phone) 
VALUES (102, 'Jane', 'Smith', 'Biology', 'janesmith@email.com', '123-456-7891');

-- 학생 2
INSERT INTO Students (StudentID, FirstName, LastName, Major, Email, Phone) 
VALUES (103, 'Robert', 'Johnson', 'Physics', 'robertj@email.com', '123-456-7892');

-- 학생 3
INSERT INTO Students (StudentID, FirstName, LastName, Major, Email, Phone) 
VALUES (104, 'Emily', 'Brown', 'Mathematics', 'emilyb@email.com', '123-456-7893');

-- 학생 4
INSERT INTO Students (StudentID, FirstName, LastName, Major, Email, Phone) 
VALUES (105, 'William', 'Taylor', 'History', 'williamt@email.com', '123-456-7894');

-- 학생 5
INSERT INTO Students (StudentID, FirstName, LastName, Major, Email, Phone) 
VALUES (106, 'Lucy', 'Davis', 'English Literature', 'lucyd@email.com', '123-456-7895');

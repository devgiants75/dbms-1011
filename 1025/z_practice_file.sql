### practice 데이터베이스 자료 ###

-- 스키마 생성 및 선택
CREATE DATABASE IF NOT EXISTS practice;
USE practice;

-- Students 테이블 생성
CREATE TABLE IF NOT EXISTS Students (
    StudentID INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age SMALLINT CHECK(Age >= 18 AND Age <= 100),
    Major VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Gender VARCHAR(10),
    Phone VARCHAR(15),
    Birth_Date DATE
);

-- Courses 테이블 생성
CREATE TABLE IF NOT EXISTS Courses (
    CourseID INT PRIMARY KEY NOT NULL,
    CourseName VARCHAR(100) NOT NULL,
    Instructor VARCHAR(50) NULL
);

-- 데이터 추가
INSERT IGNORE INTO Students (StudentID, FirstName, LastName, Major, Email, Phone) 
VALUES 
(101, 'John', 'Doe', 'Computer Science', 'johndoe@email.com', '123-456-7890'),
(102, 'Jane', 'Smith', 'Biology', 'janesmith@email.com', '123-456-7891'),
(103, 'Robert', 'Johnson', 'Physics', 'robertj@email.com', '123-456-7892'),
(104, 'Emily', 'Brown', 'Mathematics', 'emilyb@email.com', '123-456-7893'),
(105, 'William', 'Taylor', 'History', 'williamt@email.com', '123-456-7894'),
(106, 'Lucy', 'Davis', 'English Literature', 'lucyd@email.com', '123-456-7895');

INSERT IGNORE INTO Courses (CourseID, CourseName, Instructor) 
VALUES (501, 'Introduction to AI', 'Dr. Smith');

-- where 조건식 연산자 실습
-- Age 열이 존재하지 않는 경우에만 추가
-- 오류를 무시하고 Age 열 추가 시도
-- ALTER TABLE Students ADD COLUMN Age INT NULL;

UPDATE Students SET Age = 20 WHERE StudentID = 101;
UPDATE Students SET Age = 22 WHERE StudentID = 102;
UPDATE Students SET Age = 24 WHERE StudentID = 103;
UPDATE Students SET Age = 19 WHERE StudentID = 104;
UPDATE Students SET Age = 23 WHERE StudentID = 105;
UPDATE Students SET Age = 21 WHERE StudentID = 106;

-- 1
SELECT * FROM Students WHERE Major = 'Computer Science';
-- 2
SELECT * FROM Students WHERE Major = 'Computer Science' OR Major = 'Biology';
-- 3
SELECT * FROM Students WHERE Major IN ('Physics', 'Mathematics', 'History');
-- 4
SELECT * FROM Students WHERE Age BETWEEN 20 AND 23;
-- 5
SELECT * FROM Students WHERE FirstName LIKE 'J%';
-- 6
SELECT * FROM Students WHERE Age IS NULL;

-- 데이터 수정
UPDATE Students SET Major = 'Computer Science' WHERE StudentID IN (102, 104);
UPDATE Students SET Major = 'History' WHERE StudentID = 103;

UPDATE Students SET LastName = 'Deo' WHERE StudentID = 102;
UPDATE Students SET LastName = 'Taylor' WHERE StudentID = 106;

UPDATE Students SET Email = 'janesmith@yahoo.com' WHERE StudentID = 102;
UPDATE Students SET Email = 'robertj@hotmail.com' WHERE StudentID = 103;
UPDATE Students SET Email = 'emilyb@outlook.com' WHERE StudentID = 104;

-- 변수 및 형 변환 실습
-- ALTER TABLE Students ADD COLUMN Birth_Date DATE;

UPDATE Students SET Birth_Date = '2003-01-15' WHERE StudentID = 101;
UPDATE Students SET Birth_Date = '2002-05-22' WHERE StudentID = 102;
UPDATE Students SET Birth_Date = '1999-08-13' WHERE StudentID = 103;
UPDATE Students SET Birth_Date = '2004-11-05' WHERE StudentID = 104;
UPDATE Students SET Birth_Date = '2001-12-30' WHERE StudentID = 105;
UPDATE Students SET Birth_Date = '2003-03-27' WHERE StudentID = 106;

INSERT INTO Courses (CourseID, CourseName, Instructor)
VALUES
(502, 'Computer Science', 'Dr. Johnson'),
(503, 'Physics', 'Dr. Lee'),
(504, 'English Literature', 'Dr. Kim'),
(505, 'History', 'Dr. Park');

-- 1. 문자열 연결하기
SELECT CONCAT(FirstName, ' ', LastName, "'s major is ", Major) AS Result
FROM Students
WHERE StudentID = 101;

-- 2. 숫자를 문자열로 변환하기
SELECT CONCAT(CAST(StudentID AS CHAR), ' - ', FirstName) AS Result
FROM Students;

-- 날짜 형식 변환하기
SELECT DATE_FORMAT(Birth_Date, '%D-%M-%Y') AS FormattedBirthDate
FROM Students;

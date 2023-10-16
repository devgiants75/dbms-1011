### 실습 ###

# 스키마 생성
# : 스키마 이름(practice)
create database practice;

# 스키마 선택
use practice;

/*
테이블 설계
: 테이블명(Students)

StudentID: 학생을 유일하게 식별하는 ID.
FirstName: 학생의 이름.
LastName: 학생의 성.
Age: 학생의 나이.
Major: 학생의 전공.
Email: 학생의 이메일.
*/

/*
데이터 타입 및 제약조건 선택

StudentID: INT, PRIMARY KEY, NOT NULL
FirstName: VARCHAR(50), NOT NULL
LastName: VARCHAR(50), NOT NULL
Age: INT, CHECK(Age >= 18 AND Age <= 100)
Major: VARCHAR(100)
Email: VARCHAR(100), UNIQUE
*/

CREATE TABLE Students (
    StudentID INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT CHECK(Age >= 18 AND Age <= 100),
    Major VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);

/*
열 추가/수정/삭제

Students 테이블에 Gender 칼럼을 추가합니다.
- 데이터타입 VARCHAR(10)


Students 테이블의 Age 칼럼 데이터 타입을 수정합니다.
- 데이터타입 SMALLINT로 수정
*/
alter table students add gender varchar(10);
alter table students 
modify column age smallint CHECK(Age >= 18 AND Age <= 100);

/*
테이블 삭제
스키마 삭제
*/
drop table students;
drop database practice;
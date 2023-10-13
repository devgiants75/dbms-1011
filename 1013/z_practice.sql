### 실습 ###

# 스키마 생성
# : 스키마 이름(practice)

/*
테이블 설계
Students
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
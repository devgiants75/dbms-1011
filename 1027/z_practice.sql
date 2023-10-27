### 제약조건 실습 - 기본키 & 외래 키 ###

# ‘School’ 데이터베이스 내에 
# ‘Students’ 와 ‘Enrollment’ 두 개의 테이블

# 'Students' 테이블에는 학생들의 정보가 저장
# 'Courses' 테이블에는 강좌의 정보가 저장
# 'Enrollment' 테이블에는 학생들의 수강 정보가 저장

# ‘Students’ 테이블을 생성
-- ‘ID’ (정수 타입, 기본 키)
-- ‘Name’ (문자열 타입, 최대 길이 100)

# ‘Courses’ 테이블을 생성
-- ‘CourseID’ (정수 타입, 기본 키)
-- ‘CourseName’ (문자열 타입, 최대 길이 100)

# Enrollment’ 테이블을 생성
-- ‘StudentID’ 
-- (정수 타입, 외래 키, ‘Students’ 테이블의 ‘ID’ 컬럼을 참조
-- , on update cascade, on delete cascade 설정)

-- ‘CourseID’ 
-- (정수 타입, 외래 키, ‘Courses’ 테이블의 ‘CourseID’ 컬럼을 참조
-- , on update cascade, on delete cascade 설정)

-- ‘Students’ 테이블 데이터 삽입
-- ID: 1, Name: ‘John Doe’
-- ID: 2, Name: ‘Jane Doe’

-- ‘Courses’ 테이블 데이터 삽입
-- CourseID: 101, CourseName: ‘Mathematics’
-- CourseID: 102, CourseName: ‘English’

-- ‘Enrollment’ 테이블 데이터 삽입
-- StudentID: 1, CourseID: 101
-- StudentID: 2, CourseID: 102

/*
ID가 1인 학생의 이름을 ‘John Smith’로 변경

‘English’ 과목의 이름을 ‘Literature’로 변경

ID가 2인 학생의 레코드를 삭제 이 작업이 완료된 후 
 ‘Enrollment’ 테이블의 내용을 확인

‘Mathematics’ 과목의 레코드를 삭제 이 작업이 완료된 후 
 ‘Enrollment’ 테이블의 내용을 확인
*/

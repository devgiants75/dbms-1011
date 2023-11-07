### DBMS 실습 ###
/* 
employees 테이블:

emp_no: 직원 번호를 나타내며 기본 키
birth_date: 직원의 생년월일
first_name: 직원의 이름
last_name: 직원의 성
gender: 직원의 성별 (M 또는 F).
hire_date: 직원이 고용된 날짜

departments 테이블:

dept_no: 부서 번호로서 기본 키
dept_name: 부서의 이름

salaries 테이블:

emp_no: 직원 번호로서 employees 테이블의 emp_no를 참조하는 외래 키
salary: 직원의 급여
from_date: 해당 급여가 시작된 날짜
to_date: 해당 급여가 종료된 날짜

titles 테이블:

emp_no: 직원 번호로서 employees 테이블의 emp_no를 참조하는 외래 키
title: 직원의 직책
from_date: 해당 직책의 시작 날짜
to_date: 해당 직책의 종료 날짜

dept_emp 테이블:

emp_no: 직원 번호로서 employees 테이블의 emp_no를 참조하는 외래 키
dept_no: 부서 번호로서 departments 테이블의 dept_no를 참조하는 외래 키
from_date: 직원이 해당 부서에서 근무하기 시작한 날짜
to_date: 직원이 해당 부서에서 근무를 마친 날짜

dept_manager 테이블:

dept_no: 부서 번호로서 departments 테이블의 dept_no를 참조하는 외래 키
emp_no: 직원 번호로서 employees 테이블의 emp_no를 참조하는 외래 키
from_date: 해당 직원이 부서 관리자로 시작한 날짜
to_date: 해당 직원이 부서 관리자로서의 역할을 마친 날짜


-- 테이블 간의 관계
-- employees와 salaries, titles, dept_emp, dept_manager 테이블은 
	emp_no를 통해 연결
-- departments는 dept_emp와 dept_manager 테이블과 
	dept_no를 통해 연결
*/
create database if not exists company_db;
use company_db;

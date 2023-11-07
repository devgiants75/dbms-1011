### DBMS 실습 ###
/* 
employees 테이블:

emp_no: 직원 번호를 나타내며 기본 키
birth_date: 직원의 생년월일
first_name: 직원의 이름
last_name: 직원의 성
gender: 직원의 성별 (M 또는 F).
-- enum타입: 열거형 타입(문자열 값 중에서 선택하도록 제한)
-- gender enum('M', 'F')
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

CREATE TABLE if not exists employees (
    emp_no      INT             NOT NULL,  -- UNSIGNED AUTO_INCREMENT??
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,  -- Enumeration of either 'M' or 'F'  
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)                   -- Index built automatically on primary-key column
                                           -- INDEX (first_name)
                                           -- INDEX (last_name)
);

CREATE TABLE if not exists departments (
    dept_no     CHAR(4)         NOT NULL,  -- in the form of 'dxxx'
    dept_name   VARCHAR(40)     NOT NULL,
    PRIMARY KEY (dept_no),                 -- Index built automatically
    UNIQUE  KEY (dept_name)                -- Build INDEX on this unique-value column
);

CREATE TABLE dept_emp (
    emp_no      INT         NOT NULL,
    dept_no     CHAR(4)     NOT NULL,
    from_date   DATE        NOT NULL,
    to_date     DATE        NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
   dept_no      CHAR(4)  NOT NULL,
   emp_no       INT      NOT NULL,
   from_date    DATE     NOT NULL,
   to_date      DATE     NOT NULL,
   KEY         (emp_no),
   KEY         (dept_no),
   FOREIGN KEY (emp_no)  REFERENCES employees (emp_no)    ON DELETE CASCADE,
                                  -- ON UPDATE CASCADE??
   FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
   PRIMARY KEY (emp_no, dept_no)  -- might not be unique?? Need from_date
);

CREATE TABLE titles (
    emp_no      INT          NOT NULL,
    title       VARCHAR(50)  NOT NULL,
    from_date   DATE         NOT NULL,
    to_date     DATE,
    KEY         (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
                         -- ON UPDATE CASCADE??
    PRIMARY KEY (emp_no, title, from_date)
);

CREATE TABLE salaries (
    emp_no      INT    NOT NULL,
    salary      INT    NOT NULL,
    from_date   DATE   NOT NULL,
    to_date     DATE   NOT NULL,
    KEY         (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no, from_date)
);

-- 데이터 입력
-- 직원 추가
INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date) VALUES
(10001, '1965-01-02', 'John', 'Doe', 'M', '1986-06-26'),
(10002, '1972-05-22', 'Jane', 'Smith', 'F', '1991-08-01');

-- 부서 추가
INSERT INTO departments (dept_no, dept_name) VALUES
('d001', 'Marketing'),
('d002', 'Finance');

-- 급여 추가
INSERT INTO salaries (emp_no, salary, from_date, to_date) VALUES
(10001, 50000, '1986-06-26', '1987-06-26'),
(10002, 60000, '1991-08-01', '1992-08-01');

-- 직급 추가
INSERT INTO titles (emp_no, title, from_date, to_date) VALUES
(10001, 'Senior Engineer', '1986-06-26', '9999-01-01'),
(10002, 'Staff', '1991-08-01', '9999-01-01');

-- 부서-직원 관계 추가
INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date) VALUES
(10001, 'd001', '1986-06-26', '9999-01-01'),
(10002, 'd002', '1991-08-01', '9999-01-01');

-- 부서-매니저 관계 추가
INSERT INTO dept_manager (dept_no, emp_no, from_date, to_date) VALUES
('d001', 10001, '1986-06-26', '9999-01-01'),
('d002', 10002, '1991-08-01', '9999-01-01');

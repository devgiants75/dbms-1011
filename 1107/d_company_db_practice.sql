### company_db 활용 ###

# 모든 직원의 이름과 급여를 선택(select & join)
select e.first_name, e.last_name, s.salary
from employees e
join salaries s on e.emp_no = s.emp_no;

# 특정 부서에서 일하는 직원들을 찾기(select & join & where)
select e.emp_no, e.first_name, e.last_name, d.dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
where d.dept_name = 'Marketing';

# 가장 많은 급여를 받는 상위 5명의 직원(select & join & order by & limit)
select e.first_name, e.last_name, s.salary
from employees e
join salaries s on e.emp_no = s.emp_no
order by s.salary desc
limit 5;

# 특정 기간 내에 고용된 직원 수(select & count)
select count(*) as "Number of Hires"
from employees
where hire_date between '1990-01-01' and '2023-11-07';

# 내부 조인
# 직원과 그들의 급여 정보를 내부 조인을 사용하여 가져오는 쿼리
select concat(e.first_name, ' ', e.last_name) name, s.salary
from employees e
inner join salaries s on e.emp_no = s.emp_no;

# 외부 조인
# 모든 부서와, 해당 부서를 관리하는 
# 매니저의 정보를 외부 조인을 사용하여 가져오는 쿼리
select d.dept_name, dm.emp_no
from departments d
left join dept_manager dm on d.dept_no = dm.dept_no;

# SQL 프로그래밍
-- 스토어드 프로시저
-- 직원의 급여를 업데이트하는 저장 프로시저

delimiter //

create procedure UpdateSalary(in emp_id int, in new_salary int)
begin
	update salaries
    set salary = new_salary
    where emp_no = emp_id;
end //

delimiter ;

-- emp_id와 new_salary를 사용하여 UpdateSalary 저장 프로시저를 호출
call UpdateSalary(10001, 80000);
call UpdateSalary(10002, 30000);

select * from salaries;

# 변수 사용
-- 사용자 정의 변수 @min_salary 생성
-- 해당 변수에 30000 값을 할당
-- := 연산자의 경우 변수에 값을 할당하는데 사용
set @min_salary := 30000;

select *
from employees e
join salaries s on e.emp_no = s.emp_no
where s.salary > @min_salary;

# 뷰 
# 뷰 생성
-- 현재 직원의 직책과 급여 정보를 보여주는 뷰 생성
-- employees 테이블의 emp_no, 이름을 concat()으로 묶어서 표시
-- titles 테이블의 title
-- salaries 테이블의 salary

create view current_emp_details as
	select e.emp_no
		, concat(e.first_name, ' ', e.last_name) "employee_name"
        , t.title, s.salary
	from employees e
    join titles t on e.emp_no = t.emp_no
    join salaries s on e.emp_no = s.emp_no;

# 뷰 사용
-- 생성된 뷰를 사용하여 특정 직책을 가진 직원 검색
-- 'Senior Engineer'
select *
	from current_emp_details
    where title = 'Senior Engineer';
    
# 트리거 생성
delimiter //

create trigger before_salary_insert
before insert on salaries for each row
begin
	if NEW.salary < 0 then
		set NEW.salary = 0;
	end if;
end //

delimiter ;

# 트리거 사용
-- 급여 정보를 삽입할 때 트리거가 작동하도록 급여 정보 삽입
-- 음숫값을 데이터로 삽입하는 경우

-- FK 오류를 없애기 위해 employees 테이블에 직원을 먼저 추가
insert into employees 
	(emp_no, birth_date, first_name, last_name, gender, hire_date)
values (10003, '1990-01-01', 'Alice', 'Brown', 'F', curdate());

insert into salaries (emp_no, salary, from_date, to_date)
values (10003, -50000, curdate(), '9999-01-01');

select * from salaries;
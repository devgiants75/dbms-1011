### 데이터 베이스의 제약 조건 ###
create database naver_db;

use naver_db;

drop table if exists buy, member;

# 제약조건
# : 데이터의 무결성을 지키기 위해 제한하는 조건
# : 제약 조건 설정 방법
#  - 테이블 생성 시 열 이름 데이터 타입 뒤에 명시

# MySQL에서 제공하는 제약조건
# Primary Key(기본 키)
# : 테이블의 많은 행 데이터 중에서 데이터를 구분할 수 있는 식별자
# : 회원 테이블의 아이디, 학생 테이블의 학번, 직원 테이블의 사번 등

# : 기본 키에 입력되는 값은 중복 X, Null값일 수 X
# : 하나의 테이블에 하나만 설정 가능

create table member
(
	mem_id char(8) not null,
    mem_name varchar(10) not null,
    height tinyint unsigned null,
    constraint primary key PK_member_mem_id (mem_id) 
    -- 테이블 생성 제일 마지막에 
    -- primary key (지정하고자 하는 열 이름)
);

create table member 
(
	mem_id char(8) not null,
    mem_name varchar(10) not null,
    height tinyint unsigned null
);

alter table member
	add constraint -- constraint: 제약조건
    primary key (mem_id);

-- 테이블 정보를 출력: describe
describe member;

# Foreign Key (외래 키)
# : 두 테이블 사이의 관계를 연결해주고
# : , 그 결과 데이터의 무결성을 보장해주는 역할

# 구매 테이블의 아이디(FK)는 반드시 회원 테이블의 아이디(PK)로 존재
# : buy테이블에서 제품을 구매한 기록이 있는 사람은
# : 해당 페이지의 회원이다

drop table if exists buy, member;
create table member 
(
	mem_id char(8) not null primary key,
    mem_name varchar(10) not null,
    height tinyint unsigned null
);

create table buy
(
	num int auto_increment not null primary key,
    mem_id char(8) not null,
    prod_name char(6) not null
    -- foreign key (mem_id) references member (mem_id)    
);

alter table buy
	add constraint
	foreign key (mem_id)
    references member (mem_id);

describe buy;

-- 기준 테이블의 열이 변경되는 경우
insert into member values('BLK', '블랙핑크', 163);

insert into buy values(null, 'BLK', '지갑');
insert into buy values(null, 'BLK', '노트북');

select M.mem_id, M.mem_name, B.prod_name
	from buy B
		inner join member M
        on B.mem_id = M.mem_id;
        
-- BLK의 아이디를 PINK로 변경
update member set mem_id = 'PINK' where mem_id = 'BLK';

-- BLK 아이디 데이터를 삭제
delete from member where mem_id = 'BLK';

-- 기본 키:외래 키로 맺어진 후에는 
-- 기준 테이블의 열 이름이 변경 되지X / 삭제도 불가

-- 기준 테이블의 열 이름이 변경될 때 
-- 참조 테이블의 열 이름이 자동으로 변경되도록 지정
-- : on update cascade, on delete cascade문

drop table if exists buy;
create table buy
(
	num int auto_increment not null primary key,
    mem_id char(8) not null,
    prod_name char(6) not null
);

alter table buy
	add constraint
    foreign key (mem_id) references member (mem_id)
    on update cascade
    on delete cascade;

insert into buy values (null, 'BLK', '지갑');
insert into buy values (null, 'BLK', '노트북');

update member set mem_id = 'PINK' where mem_id = 'BLK';

select M.mem_id, M.mem_name, B.prod_name
	from buy B
		inner join member M
        on B.mem_id = M.mem_id;

delete from member where mem_id = 'PINK';

select * from buy;
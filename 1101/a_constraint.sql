### 기타 제약조건 ###
# a_constraint

use naver_db;
# 1. 고유 키 (Unique)
# : 중복되지 않는 유일한 값을 입력해야하는 조건

# PK와의 차이
# : null값을 허용
# : 여러 개 설정 가능 (PK는 테이블에 1개만 설정)

-- 회원 테이블의 Email 설정 
-- 중복X, 필수입력 값X
drop table if exists buy, member;
create table member(
	mem_id char(8) not null primary key,
    mem_name varchar(10) not null,
    height tinyint unsigned null,
    email char(30) null unique
);

insert into member 
values ('BLK', '블랙핑크', 163, 'pink@gmail.com');
insert into member 
values ('TWC', '트와이스', 167, null);
insert into member 
values ('APN', '에이핑크', 164, 'Apink@gmail.com');

# 2. 체크(CHECK) 제약조건
# : 입력되는 데이터를 점검하는 기능

drop table if exists member;
create table member (
	mem_id char(8) not null primary key,
    mem_name varchar(10) not null,
    height tinyint unsigned null check (height >= 100),
    phone1 char(3) null
);

insert into member values ('BLK', '블랙핑크', 163, null);
insert into member values ('TWC', '트와이스', 167, null);

-- alter table로 제약조건 추가
-- 연락처(phone1)에 02, 031, 032, 054, 055, 061 중 하나만 입력되도록 설정
alter table member
	add constraint
    check (phone1 in (02, 031, 032, 054, 055, 061));
    
-- in()은 괄호 안에 있는 값 중 하나와 같아야 참
insert into member values ('OMY', '오마이걸', 167, '055');

# 3. 기본값 정의(Default)
# : 값을 입력하지 않았을 때 자동으로 입력될 값을 미리 지정해 놓는 방법

drop table if exists member;
create table member (
	mem_id char(8) not null primary key,
    mem_name varchar(10) not null,
    height tinyint unsigned null default 160,
    phone1 char(3) null
);

alter table member
	alter column phone1 set default '02';

insert into member
values ('RED', '레드벨벳', default, null);

insert into member
values ('TWC', '', null, default);

select * from member;

# 4. 널 값 허용
# : 널 값 허용을 위해서는 생략하거나(기본값) null을 사용

# 널 값 허용 X
# : not null 사용

# null: '아무 것도 없다'
# 공백('')이나 0과 다르다
### 인덱스 생성 ###
# c_index03

# 인덱스(index)
# : 테이블의 열 (컬럼) 단위에 생성
# : , 하나의 열에는 하나의 인덱스를 생성 가능

# '인터넷 마켓'의 회원 테이블(member)로 인덱스 정리
use market_db;
select * from member;

# 열 하나당 인덱스 하나를 생성하는 경우
# member 테이블은 8개의 서로 다른 인덱스 생성 가능

# member 테이블은 회원 아이디(mem_id)가 기본 키 설정
# : 자동으로 mem_id 열에 클러스터형 인덱스가 생성

use market_db;
create table table1 (
	col1 int primary key, -- 기본 키로 지정(클러스터형)
    col2 int,
    col3 int
);

# 테이블 인덱스 확인 SQL문법
# show index from 테이블명;

show index from table1;

# Key_name - PRIMARY
# : 기본 키로 설정해서 '자동으로 생성된 인덱스'의 의미
# : 클러스터형 인덱스

# Column_name - col1
# : col1 열에 인덱스가 만들어져 있다는 것을 의미

# Non_unique
# : 고유하지 않다, 중복이 허용되냐는 것을 의미
# 0 (False) - 중복이 허용되지 X
# 1 (True) - 중복이 허용 O

# 고유 키 인덱스 생성

create table table2 (
	col1 int primary key,
    col2 int unique, -- 고유 키 지정
    col3 int unique -- 고유 키 지정
);

show index from table2;
# Key_name에 열 이름 기재 시: 보조 인덱스 
# 고유 키는 중복값을 허용하지 않기 때문에
# , Non_unique가 0으로 지정

# 클러스터형 인덱스의 자동 정렬

drop table if exists buy, member;
create table member (
	mem_id char(8),
    mem_name varchar(10),
    mem_number int,
    addr char(2)
);

insert into member values ('TWC', '트와이스', 9, '서울');
insert into member values ('BLK', '블랙핑크', 4, '경남');
insert into member values ('WMN', '여자친구', 9, '경기');
insert into member values ('OMY', '오마이걸', 9, '서울');

select * from member;

alter table member
	add constraint
    primary key (mem_id);

select * from member; -- 아이디를 기준으로 정렬

alter table member drop primary key; -- 기본키 제거

alter table member
	add constraint
    primary key (mem_name); -- 클러스터형 인덱스 생성
    
select * from member;

insert into member values ('GRL', '소녀시대', 8, '서울');

select * from member;

# 정렬되지 않는 보조 인덱스

drop table if exists member;
create table member (
	mem_id char(8),
    mem_name varchar(10),
    mem_number int,
    addr char(2)
);

insert into member values ('TWC', '트와이스', 9, '서울');
insert into member values ('BLK', '블랙핑크', 4, '경남');
insert into member values ('WMN', '여자친구', 9, '경기');
insert into member values ('OMY', '오마이걸', 9, '서울');

select * from member;

alter table member
	add constraint
    unique (mem_id);
    
alter table member
	add constraint
    unique (mem_name);
    
select * from member;

insert into member value ('GRL', '소녀시대', 8, '서울');

select * from member;

# 고유 인덱스
# : 값이 중복되지 않는 인덱스
# : 기본 키가 고유 키로 지정하면 값이 자동으로
# : 중복되지 않기 때문에 고유 인덱스가 자동 생성

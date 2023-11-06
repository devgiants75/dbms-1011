### 인덱스의 실제 사용 ###

# 인덱스 생성 SQL
# create index문 사용

# create index를 사용하여 생성되는 인덱스는 보조 인덱스

-- create [unique] index 인덱스명
-- on 테이블명 (열이름) [asc | desc]

# unique: 중복이 안되는 고유 인덱스 생성
# >> 생략 시 중복이 허용

# asc | desc: 오름차순 | 내림차순으로 인덱스 정렬

# 인덱스 제거 SQL
# drop index문 사용

# 기본 키, 고유 키로 자동 생성된 인덱스의 경우
# drop index로 제거 할 수 X
# >> alter table로 기본 키나 고유 키를 제거 할 경우
#    , 자동으로 생성된 인덱스도 제거 가능 O

# 하나의 테이블에 클러스터형 인덱스와 보조 인덱스 모두 있는 경우
# , 보조 인덱스부터 제거하는 것을 권장

-- drop index 인덱스명 on 테이블명

# 인덱스 생성과 제거 실습
use market_db;
select * from member;

# show index문: 인덱스 설정 확인
show index from member;

# 인덱스의 크기 확인
show table status like 'member';

# show table status문 - Data_length
# : 클러스터형 인덱스(또는 데이터)의 크기를 Byte 단위로 표시
# : 16384Byte
# mySQL의 1개의 페이지 크기: 16KB이기 때문에
# , 16384Byte의 경우 1페이지가 할당되어 있다.

# show table status문 - Index_length 
# : 보조 인덱스의 크기
# : member 테이블에 보조 인덱스가 없기 때문에 표기 X

# 단순 보조 인덱스 생성
# 주소(addr) 값은 중복 가능

# Non_unique가 1로 설정 되어 있기 때문에
# , 고유 보조 인덱스 X (중복 가능 O)
create index idx_member_addr
	on member (addr);

show index from member;

# 생성한 인덱스를 실제로 적용 시키는 방법
# 테이블을 분석/처리
# analyze table문 사용

analyze table member;
show table status like 'member';

# 인원수에(mem_number) 중복을 허용하지 않는 고유 보조 인덱스 생성
-- create unique index idx_member_mem_number
-- 	on member (mem_number);

# 회원 이름(mem_name)에 고유 보조 인덱스 생성
create unique index idx_member_mem_name
	on member (mem_name);

show index from member;

-- insert into member 
-- values ('MOO', '마마무', 2, '부산', '001', '12341234'
-- 	, 155, '2020-10-10');

# unique 옵션을 통해 인덱스를 생성할 때에는
# 업무상 절대로!! 중복되지 않는 열
# (주민등록번호, 학번, 이메일 주소 등)에만 unique 옵션을 사용!!

analyze table member; -- 지금까지 생성한 인덱스를 모두 적용
show index from member;

# mem_id, mem_name, addr 3개의 행에 인덱스 설정

select * from member;

# 인덱스 사용을 위해서는 인덱스가 생성된 열 이름이
# SQL문에 작성되어야 함.

# 인덱스를 사용했는지 여부 확인
# 결과 창 중 [Execution Plan] 창을 확인
# : Full Table Scan(전체 테이블 검색)

select mem_id, mem_name, addr from member;

select mem_id, mem_name, addr from member
	where mem_name = '에이핑크';
    
# Single Row(constant)
# : '인덱스를 사용하여 결과를 얻었다'라는 의미
# Exection Plan창에서 Full Table Scan을 제외하고는
# 모두 인덱스를 사용했다는 의미

# where 절에 열 이름이 들어 있어야
# 인덱스를 사용 할 수 있다.
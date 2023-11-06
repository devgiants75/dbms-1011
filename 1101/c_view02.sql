### 뷰의 실제 작동 ###
# c_view02

use market_db;
# 뷰의 실제 생성, 수정, 삭제

# 뷰 생성 시 뷰의 열 이름을 테이블과 다르게 지정 가능 (as 사용)
# , 띄어쓰기 | 한글 가능

create view v_viewtest1
as
	select B.mem_id 'Member ID', M.mem_name as 'Member Name',
		B.prod_name 'Product Name',
        concat(M.phone1, M.phone2) as 'Office Phone'
    from buy B
		inner join member M
        on B.mem_id = M.mem_id;
        
# 뷰를 조회할 경우 열 이름에 공백이 있을 시
# , 백틱(`)으로 묶어서 조회

select distinct `Member ID`, `Member Name` 
from v_viewtest1;

# 뷰 수정 (alter)
alter view v_viewtest1
as
	select B.mem_id '회원 아이디', M.mem_name as '회원 이름',
		B.prod_name '제품 이름',
        concat(M.phone1, M.phone2) as '연락처'
	from buy B
		inner join member M
        on B.mem_id = M.mem_id;
    
select distinct `회원 아이디`, `회원 이름`
from v_viewtest1;
    
# 뷰의 삭제
# drop view
drop view v_viewtest1;

# 데이터베이스의 개체
# : 테이블, 뷰, 인덱스, 스토어드 프로시져, 스토어드 함수, 트리거 등

# 생성, 수정, 삭제
# create, alter, drop 개체_종류

# 뷰의 정보 확인
use market_db;

# create view는 기존에 뷰가 있으면 오류 발생
# create of replace view의 경우 기조에 뷰가 있어도
# , 덮어쓰는 효과를 내기 때문에 오류 발생 X

create or replace view v_viewtest2
as
	select mem_id, mem_name, addr from member;

# describe(desc)문으로 기존 뷰의 정보 확인
desc v_viewtest2;
desc member;

# show create view 문으로 뷰의 소스 코드 확인
show create view v_viewtest2;

# 뷰를 통한 데이터의 수정/삭제

update v_member set addr = '부산' 
where mem_id = 'BLK';

select mem_id, addr from member;

select * from v_member;

# 뷰를 통한 테이블 데이터 입력 시
# 전체 테이블에서 not null로 지정된 컬럼이 뷰에 없을 경우
# 데이터 입력 불가
insert into v_member(mem_id, mem_name, addr)
values('BTS', '방탄소년단', '경기');

create view v_height167
as
	select * from member where height >= 167;

select * from v_height167;

delete from v_height167 where height < 167;

select * from member;
insert into v_height167 
values ('TRA', '티아라', 6, '서울', null, null, 159, '2005-01-01');

select * from v_height167;

# with check option
# : 뷰에 설정된 값의 범위가 벗어나느 값은 입력되지 않도록 지정
alter view v_height167
as
	select * from member where height >= 167
    with check option;
    
insert into v_height167 
values('TOB', '텔레토비', 4, '영국', null, null, 140, '1995-01-01');

# 복합 뷰
# : 두 테이블을 조인한 결과를 뷰로 만들 때
# : 읽기 전용 (복합 뷰를 통하여 테이블에 데이터를 입력/삭제/수정 불가)

# 뷰가 참조하는 테이블 삭제
drop table if exists buy, member;

-- 오류 발생
-- : 참조하는 테이블이 없기 때문에 조회 불가
select * from v_height167;

# 뷰의 상태 확인
check table v_height167;
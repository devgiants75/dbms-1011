### 인덱스의 내부 작동 ###
# d_index04

# 1. 균형 트리
# : 클러스터형과 보조 인덱스는 모두 내부적으로 균형 트리로 생성
# : '자료 구조'에 나오는 데이터 구조 중 하나
# : 나무를 거꾸로 표현한 자료 구조
# : , 제일 상단의 뿌리를 루트, 줄기를 중간, 끝에 달린 잎을 리프

# 균형 트리의 개념

# 노드(node)
# : 균형 트리 구조에서 데이터가 저장되는 공간
# 루프 노드: 노드의 가장 상위 노드
#		   , 모든 출발은 루트 노드에서 시작
# 리프 노드: 제일 마지막에 존재하는 노드

# 노드 구조는 데이터의 양에 따라서 2단계, 3단계 또는 그 이상의
# , 구조로 나뉠 수 있음

# 중간 노드: 루트 노드와 리프 노드의 중간에 끼인 노드

# 노드(node)는 데이터 공간의 개념적 설명
# mySQL에서는 페이지(page)라고 불림.

# 페이지(page)
# : 최소한의 저장 단위, 16Kbyte(16383byte) 크기를 가짐
# ex. 데이터를 1건만 입력
# 	  , 1개의 페이지인 16Kbyte가 필요

# 모두 리프 페이지만 있는 경우
# : 해당 데이터를 찾기 위해서는 처음부터 끝까지 검색
# : 전체 테이블 검색(Full Table Scan)

# 데이터를 읽을 때, 데이터의 건수는 의미 X
# 몇 개의 페이지를 읽었느냐로 효율성을 판단 O

# 2. 균형 트리의 페이지 분할
# 인덱스 구성 시 데이터 변경 작업(insert, update, delete)을
# , 할 경우 성능 저하
# : 그 이유는 페이지 분할 작업 때문!

# 페이지 분할
# : 새로운 페이지를 준비해서 데이터를 나누는 작업
# : mySQL의 속도 저하

# 3. 인덱스의 구조

# 클러스터형 인덱스 구성
use market_db;
create table cluster (
	mem_id char(8),
    mem_name varchar(10)
);

insert into cluster values('TWC', '트와이스');
insert into cluster values('BLK', '블랙핑크');
insert into cluster values('WMN', '여자친구');
insert into cluster values('OMY', '오마이걸');
insert into cluster values('GRL', '소녀시대');
insert into cluster values('ITZ', '잇지');
insert into cluster values('RED', '레드벨벳');
insert into cluster values('APN', '에이핑크');
insert into cluster values('SPC', '우주소녀');
insert into cluster values('MMU', '마마무');

# 1개의 페이지에 4개의 행이 입력(가정)

select * from cluster;

# mem_id에 클러스터형 인덱스 구성
alter table cluster 
	add constraint
    primary key (mem_id);

select * from cluster;

# cluster 테이블의 인덱스 페이지의 경우
# 루트 페이지 1개
# APN, MMU, TWC

# 리프 페이지 (= 데이터 페이지) 3개

create table second (
	mem_id char(8),
    mem_name varchar(10)
);

insert into second values('TWC', '트와이스');
insert into second values('BLK', '블랙핑크');
insert into second values('WMN', '여자친구');
insert into second values('OMY', '오마이걸');
insert into second values('GRL', '소녀시대');
insert into second values('ITZ', '잇지');
insert into second values('RED', '레드벨벳');
insert into second values('APN', '에이핑크');
insert into second values('SPC', '우주소녀');
insert into second values('MMU', '마마무');

alter table second 
	add constraint
    unique (mem_id);
    
select * from second;

# 보조 인덱스의 경우 데이터 페이지가 바뀌지 X
# , 별도의 공간에 인덱스 페이지를 생성

# 보조 인덱스의 데이터 위치는
# : 페이지 번호 + #위치
# APN 2+#4

# 클러스터형 인덱스가 보조 인덱스 보다
# 속도가 조금 더 빠름.
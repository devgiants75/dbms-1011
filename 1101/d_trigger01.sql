### 트리거 ###
# d_trigger01

# 트리거(trigger)
# : 자동 실행
# : 자동으로 수행하여 사용자가 추가 작업을 잊어버리는 실수를 방지

# 트리거 사용 목적
# : 수동으로 처리하는 일련 동작을 
# : 자동으로 처리하여 데이터에 오류가 발생하는 것을 방지
# : , 데이터의 무결성 처리에 도움

# insert, update, delete가 실행되면
# 트리거를 자동으로 작동하게 작성

# 트리거의 기본 작동
# : 트리거는 테이블에서 DML(insert, update, delete)의
# : 이벤트가 발생할 때 작동

# 트리거 문법의 경우 스토어드 프로시져와 유사
# 차이점
# : call문으로 직접 실행 불가
# : 무조건 테이블에 insert, update, delete 등의 이벤트가
# : , 발생하는 경우에만 자동으로 실행

use market_db;
create table if not exists trigger_table 
(id int, txt varchar(10));

insert into trigger_table values(1, '레드벨벳');
insert into trigger_table values(2, '잇지');
insert into trigger_table values(3, '블랙핑크');

drop trigger if exists myTrigger;
delimiter $$
create trigger myTrigger
	after delete -- 해당 트리거는 delete문이 실행된 이후에 작동
    on trigger_table -- 해당 트리거를 부착할 테이블 지정
    for each row -- 각 행마다 적용시킴 (항상 작성)
begin
	set @msg = '가수 그룹이 삭제됨'; -- 트리거 실행 시 작동되는 코드
end $$
delimiter ;

set @msg = '';
insert into trigger_table values(4, '마마무');
select @msg;
update trigger_table set txt = '블핑' where id = 3;
select @msg;
delete from trigger_table where id = 4;
select @msg;
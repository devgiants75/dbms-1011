/*
	데이터베이스 & 테이블 설계
    - '인터넷 쇼핑몰' 데이터베이스
    
    - '회원 테이블'
    - 아이디 mem_id char(8) 널허용X (기본키)
    - 회원 이름 mem_name varchar(10) 널허용X
    - 인원수 mem_number tinyint 널허용X
    - 주소 address char(2) 널허용X
    - 연락처(국번) phone1 char(3) 널허용O
    - 전화번호 phone2 char(8) 널허용O
    - 평균 키 height tinyint 널허용O (unsigned)
    - 데뷔 일자 debut_date Date 널허용O
    
    - '구매 테이블'
*/
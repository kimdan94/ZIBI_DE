--회원 관리 (필수 입력 데이터)
create table member(
	mem_num number not null,
	mem_email varchar2(40) not null,
	mem_auth number(1) default 2 not null,
	mem_social number(1) default 0 not null, -- 0:사이트, 1:카카오, 2:네이버, 3:구글
	constraint member_pk primary key (mem_num)
);

--회원 상세 (선택 입력 데이터)
create table member_detail(
	mem_num number not null,
	mem_nickname varchar2(30) not null,
	mem_name varchar2(30),
	mem_password varchar2(12),
	mem_phone varchar2(15),
	mem_zipcode varchar2(5),
	mem_address1 varchar2(100),
	mem_address2 varchar2(100),
	mem_regdate date default sysdate not null,
	mem_modidate date,
	mem_photo blob,
	mem_photoname varchar2(100),
	mem_auid varchar2(36),
	constraint member_detail_pk primary key (mem_num),
	constraint member_detail_fk foreign key (mem_num) references member (mem_num)
);

--회원 식별용 primary key
create sequence member_seq;


--팔로우
create table follow(
	mem_num number not null, --나
	fmem_num number not null, --내가 팔로우 한 사람
	constraint member_follow_fk foreign key (mem_num) references member (mem_num)
	constraint member_follow_fk2 foreign key (fmem_num) references member (mem_num)
);
-------------- helper 재능기부 ----------------
-- 재능기부 게시판 테이블
create table helper(
 helper_num number not null,
 helper_category number not null,
 helper_hit number default 0 not null,
 helper_title varchar2(120) not null,
 helper_content clob not null,
 helper_filename varchar2(200),
 helper_address1 varchar2(100) not null,
 helper_address2 varchar2(100),
 helper_ip varchar2(40) not null,
 helper_reg_date date default sysdate not null,
 helper_modify_date date,
 helper_solution number default 0 not null, --0:해결중,1:해결완료
 helper_select number not null,
 mem_num number not null,
 constraint helper_pk primary key (helper_num),
 constraint helper foreign key (mem_num) references member (mem_num)
);

create sequence helper_seq;

-- 재능기부 게시판 스크랩 테이블
create table helper_scrap(
 helper_num number not null,
 mem_num number not null,
 constraint helper_scrap_fk1 foreign key (helper_num) references helper (helper_num),
 constraint helper_scrap_fk2 foreign key (mem_num) references member (mem_num)
);

-------------- helper 채팅 ----------------

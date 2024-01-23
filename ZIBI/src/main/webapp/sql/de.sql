-------------- rental 대여 ----------------
-- 대여 게시판 테이블
create table rental(
 rental_num number not null,
 rental_name varchar2(50) not null,
 rental_filename varchar2(200) not null,
 rental_detail clob not null,
 rental_category number not null,
 rental_address1 varchar2(100) not null,
 rental_address2 varchar2(100) not null,
 rental_zipcode varchar2(100) not null,
 rental_quantity number(30) not null,
 rental_ip varchar2(40) not null,
 rental_reg_date date default sysdate not null,
 rental_modify_date date,
 mem_num number not null,
 constraint rental_pk primary key (rental_num),
 constraint rental_fk foreign key (mem_num) references member (mem_num)
);

create sequence rental_seq;

-- 대여 게시판 댓글 테이블
create table rental_review(
 review_num number not null,
 review_content clob not null,
 review_reg_date date default sysdate not null,
 review_ip varchar2(40) not null,
 mem_num number not null,
 rental_num number not null,
 constraint rental_review_pk primary key (review_num),
 constraint rental_review_fk1 foreign key (rental_num) references rental (rental_num),
 constraint rental_review_fk2 foreign key (mem_num) references member (mem_num)
);

-- 대여 게시판 스크랩 테이블
create table rental_scrap(
 rental_num number not null,
 mem_num number not null,
 constraint rental_scrap_fk1 foreign key (rental_num) references rental (rental_num),
 constraint rental_scrap_fk2 foreign key (mem_num) references member (mem_num)
);

-------------- helper 재능기부 ----------------
-- 재능기부 게시판 테이블
create table helper(
 helper_num number not null,
 helper_category number not null,
 helper_hit number not null,
 helper_title varchar2(120) not null,
 helper_content clob not null,
 helper_filename varchar2(200) not null,
 helper_zipcode varchar2(100) not null,
 helper_address1 varchar2(100) not null,
 helper_address2 varchar2(100),
 helper_ip varchar2(40) not null,
 helper_reg_date date default sysdate not null,
 helper_modify_date date,
 helper_solution number not null,
 mem_num number not null,
 constraint helper_pk primary key (helper_num),
 constraint helper foreign key (mem_num) references member (mem_num)
);

-- 재능기부 게시판 스크랩 테이블
create table helper_scrap(
 helper_num number not null,
 mem_num number not null,
 constraint helper_scrap_fk1 foreign key (helper_num) references helper (helper_num),
 constraint helper_scrap_fk2 foreign key (mem_num) references member (mem_num)
);
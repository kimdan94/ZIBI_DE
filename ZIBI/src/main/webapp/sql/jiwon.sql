--중고거래
create table second(
 sc_num number not null,
 sc_title varchar2(150) not null,
 sc_content clob not null,
 sc_category number(1) not null,
 sc_price number(6) not null,
 sc_status number(1) not null,
 sc_way number(1) not null,
 sc_place varchar2(50),
 sc_hit number(9) default 0,
 sc_favcnt number(9) default 0,
 sc_reg_date date default sysdate not null,
 sc_modify_date date,
 sc_filename varchar2(200),
 sc_ip varchat2(40) not null,
 sc_show number(1) default 2 not null,
 mem_num number not null,
 constraint second_pk primary key (mem_num),
 constraint second_fk foreign key (mem_num) references member (mem_num)
);
 
create sequence second_seq;
 
-- 중고거래 거래 내역
create table secondhand_order(
 sc_order_num number not null,
 sc_buyer varchar2(30) not null,
 sc_order_reg_date date default sysdate not null,
 sc_order_status number(1) default 1 not null,
 sc_num number not null,
 constraint second_order_pk primary key (sc_order_num),
 constraint second_order_fk foreign key (sc_num) references secondhand (sc_num)
);
 
create sequence second_order_seq;

--내 동네
create table second_area(
 sc_area varchar2(70),
 mem_num number not null,
 constraint second_area_fk foreign key (mem_num) references member (mem_num)
);

--중고거래 거래 후기
create table second_review(
 sc_rev_num number not null,      
 sc_rev_star number(9,2) not null,
 sc_rev_content varchar2(500),       
 sc_num number not null,
 mem_num number not null,
 constraint second_review_pk primary key (sc_rev_num),
 constraint second_review_fk1 foreign key (sc_num) references second (sc_num)
 constraint second_review_fk2 foreign key (reviewer_num) references member (mem_num)
);

--중고거래 관심
create table second_fav(
 sc_num number not null,
 mem_num number not null,
 constraint fav_second_fk1 foreign key (sc_num) references spboard (sc_num),
 constraint fav_pmember_fk2 foreign key (mem_num) references spmember (mem_num)
);


--채팅
create table chatroom(
 chatroom_num number not null,
 sc_num number not null,
 seller_num number not null,
 buyer_num number not null,
 constraint chatroom_pk primary key (chatroom_num),
 constraint chatroom_fk1 foreign key (sc_num) references second (sc_num)
 constraint chatroom_fk2 foreign key (seller_num) references member (mem_num),
 constraint chatroom_fk3 foreign key (buyer_num) references member (mem_num)
 

);
















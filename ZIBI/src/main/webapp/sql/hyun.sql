-- 예매 --

--영화 정보 ent 테이블
create table performance(
 performance_num number not null,
 performance_title varchar2(60) not null,
 performance_poster varchar2(300) not null, -- file name
 performance_content clob not null,
 performance_start_date date not null,
 performance_age number not null,
 performance_category number not null,
 constraint ent_pk primary key(performance_num)
);

create sequence performance_seq;

--상영관 정보 cinema
create table cinema(
 cinema_num number not null,
 cinema_location1 varchar2(30) not null,
 cinema_location2 varchar2(40) not null,
 cinema_theater varchar2(40) not null,
 cinema_row number not null,
 cinema_col number not null,
 cinema_adult number not null,
 cinema_not_adult number not null,
 constraint cinema_pk primary key(cinema_num)
);

create sequence cinema_seq;

--상영관
create table seat(
 cinema_num number not null,
 seat_row number not null,
 seat_left number not null,
 seat_middle number not null,
 seat_right number not null,
 constraint seat_fk1 foreign key (cinema_num) references cinema (cinema_num)
);

--
create table ticketing(
 ticketing_num number not null,
 performance_num number not null,
 cinema_num number not null,
 ticketing_date date not null,
 ticketing_start_time varchar2(30) not null
);

create sequence ticketing_seq;

--
create table choose(
 choose_num number not null,
 choose_row number not null,
 choose_col number not null,
 mem_num number not null,
 ticketing_num number not null,
 constraint choose_fk1 foreign key (mem_num) references member (mem_num),
 constraint choose_fk2 foreign key (ticketing_num) references ticketing (ticketing_num)
);

create sequence choose_seq;
-- 결제 정보
create table payment(
 payment_num number not null,
 payment_type varchar2(30) not null,
 payment_price number not null,
 payment_state number not null,
 payment_date date not null,
 payment_modify_date date,
 mem_num number not null,
 seat_num number not null,
 constraint payment_fk1 foreign key (mem_num) references member (mem_num),
 constraint payment_fk2 foreign key (choose_num) references choose (choose_num)
);

create sequence payment_seq;


-- 고객센터 --

-- 일대일 문의
create table question(
 question_num number not null,
 question_title varchar2(100) not null,
 question_content clob not null,
 question_reg_date date default sysdate not null,
 question_photo_name varchar2(200),
 question_ip varchar2(40) not null,
 mem_num number not null,
 constraint notice_fk1 foreign key (mem_num) references member (mem_num)
);

create sequence question_seq;
-- 일대일 댓글
create table question_reply(
 quest_re_num number not null,
 quest_re_content varchar2(900) not null,
 quest_re_date date default sysdate not null,
 quest_re_ip varchar2(40) not null,
 mem_num number not null,
 question_num number not null,
 constraint question_reply_fk1 foreign key (mem_num) references member (mem_num)
 constraint question_reply_fk2 foreign key (question_num) references question (question_num)
 
);

create sequence question_reply_seq;
-- 공지
create table notice(
 notice_num number not null,
 notice_title varchar2(100) not null,
 notice_content clob not null,
 notice_photo_name varchar2(300) not null,
 notice_ip varchar2(40) not null,
 mem_num number not null,
 constraint notice_fk1 foreign key (mem_num) references member (mem_num)
);

create sequence notice_seq;

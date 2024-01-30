-- 소모임 예약
create table book(
 book_num number not null,
 mem_num number not null,
 book_thumbnailName varchar2(150),
 book_category number(1) not null, -- 0:취미 소모임, 1:원데이 클래스, 2:스터디 모임
 book_onoff number(1) default 0 not null, -- 0:모집중, 1:모임 완료, 2:모임 취소, 3:모집 완료
 book_title varchar2(120) not null,
 book_content clob not null,
 book_gatheringDate varchar2(100) not null,
 book_match number(1)not null, -- 1:예약 바로 확정, 2:주최자 승인 필요
 book_regDate date default sysdate not null,
 book_modifyDate date,
 book_address1 varchar2(100) not null,
 book_address2 varchar2(80) not null,
 book_zipcode varchar2(5) not null,
 book_kit varchar2(100) not null,
 book_maxcount number not null,
 book_headcount number default 0 not null,
 book_ip varchar2(40) not null,
 book_expense number(6),
 constraint book_pk primary key (book_num),
 constraint book_fk foreign key (mem_num) references member (mem_num)
);

create sequence book_seq;

-- 소모임 예약 매칭
create table book_matching(
 book_num number not null,
 apply_num number not null,
 book_state number(1) not null, -- 0:대기, 1:확정, 2: 거절
 book_matchDate date default sysdate not null,
 book_gatheringDate varchar2 100 not null,
 constraint book_matching_fk1 foreign key (book_num) references book (book_num),
 constraint book_matching_fk2 foreign key (apply_num) references member (mem_num)
);

-- 소모임 예약 리뷰
create table book_review(
 book_num number not null,
 mem_num number not null,
 book_rev varchar2(300) not null,
 book_grade number(1) not null, -- min:1, max:5
 constraint book_review_fk1 foreign key (book_num) references book (book_num),
 constraint book_review_fk2 foreign key (mem_num) references member (mem_num)
);

-- 소모임 스크랩
create table book_scrap(
 book_num number not null,
 mem_num number not null,
 constraint book_scrap_fk1 foreign key (book_num) references book (book_num),
 constraint book_scrap_fk2 foreign key (mem_num) references member (mem_num)
);
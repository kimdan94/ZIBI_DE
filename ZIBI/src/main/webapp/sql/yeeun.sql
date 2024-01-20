-- 커뮤니티
create table community(
community_num number not null,
community_title varchar2(150) not null,
community_content clob not null,
community_hit number(9) default 0 not null,
community_reg_date date default sysdate not null,
community_modify_date date,
community_filename varchar2(150),
mem_num number not null,
constraint member_pk primary key (community_num),
 constraint member_fk foreign key (mem_num) 
                             references member (mem_num)
);
create sequence member_seq;


-- 커뮤니티 좋아요
create table community_fav(
 community_num number not null,   --FK
 mem_num number not null,     --FK
 constraint community_fav_fk1 foreign key (community_num)
                                  references community (community_num),
 constraint community_fav_fk2 foreign key (mem_num)
                                  references member (mem_num)
 );
 
 
-- 커뮤니티 스크랩
create table community_scrap(
 community_num number not null,   --FK
 mem_num number not null,    --FK
 constraint community_scrap_fk1 foreign key (community_num)
                                  references community (community_num),
 constraint community_scrap_fk2 foreign key (mem_num)
                                  references member (mem_num)
);


-- 커뮤니티 댓글
create table community_reply(
 re_num number not null,    --PK
 re_content varchar2(900) not null,
 re_date date default sysdate not null,
 re_modifydate date,
 community_num number not null,   --FK
 mem_num number not null,     --FK
 constraint community_reply_pk primary key (re_num),
 constraint community_reply_fk1 foreign key (community_num) references community (community_num),
 constraint community_reply_fk2 foreign key (mem_num) references member (mem_num)
);
create sequence community_reply_seq;

-- 원룸 체크리스트
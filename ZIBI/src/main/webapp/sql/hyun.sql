--영화 정보 ent 테이블
create table ent(
 ent_num number not null,
 ent_title varchar2() not null,
 ent_poster_filename varchar2() not null,
 ent_content clob not null,
 end_start_date date not null,
 ent_age varchar2() not null
 constraint ent_pk primary key(ent_num)
);

create sequence ent_seq;

--상영관 정보 cinema
create table cinema(
 cinema_num number not null,
 cinema_location1 varchar2() not null,
 cinema_location2 varchar2() not null,
 cinema_theater varchar2() not null,
 cinema_row number not null,
 cinema_col number not null,
 cinema_adult number not null,
 cinema_not_adult number not null
 constraint cinema_pk primary key(cinema_num)
);

create sequence cinema_seq;

--상영관
create table seat(
 cinema_num number not null,
 seat_row number not null,
 seat_left number not null,
 seat_middle number not null,
 seat_right number not null
 constraint seat_fk foreign key (cinema_num) references cinema (cinema_num)
);

--

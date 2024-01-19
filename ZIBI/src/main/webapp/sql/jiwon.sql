--중고거래
create table secondhand(
 sc_num number not null,
 sc_title varchar2(150) not null,
 sc_content clob not null,
 sc_category number(1) not null,
 sc_price number(6) not null,
 sc_status number(1) not null,
 sc_way number(1) not null,
 sc_place varchar2(50),
 sc_hit number(9) default 0,
 sc_favcount number(9) default 0
);
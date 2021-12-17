create table user_basic (
    user_id varchar2(100) primary key,
    user_pw varchar2(100) not null,
    user_nm varchar2(100) not null
);

create table user_detail (
    user_id varchar2(100) references user_basic on delete cascade,
    birth varchar2(100),
    model varchar2(100),
    favorite varchar2(100)
);
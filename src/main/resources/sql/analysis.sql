create table analysis (
      num NUMBER
    , tags VARCHAR2(100)
    , elements VARCHAR2(100)
    , searchDate DATE default sysdate
    , make VARCHAR2(100)
    , model VARCHAR2(100)
);

create sequence anaSeq;

create table history (
    id varchar2(100) not null,
    views number default 1,
    favorites number default 0,
    comments number default 0
);
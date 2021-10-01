create table userBase (
    userid varchar2(100) primary key,
    userpwd varchar2(100) not null,
    username varchar2(100) not null
);

create table userDetail (
    userid varchar2(100) references userBase,
    birth varchar2(100),
    model varchar2(100),
    favorite varchar2(100)
);

create table modelBase (
    model varchar2(100) not null
);

create table modelDetail (
    maker varchar2(100) not null,
    model varchar2(100) primary key,
    imgUrl varchar2(100) not null,
    type varchar2(100),
    pixel varchar2(100),
    cmos varchar2(100),
    sensor varchar2(100),
    imageProcessor varchar2(100),
    screen varchar2(100),
    viewFinder varchar2(100),
    maxISO varchar2(100),
    shutterSpeed varchar2(100),
    continuousShooting varchar2(100),
    af varchar2(100),
    focusArea varchar2(100),
    flash varchar2(100),
    videoQuality varchar2(100),
    volume varchar2(100),
    weight varchar2(100),
    etc varchar2(100)
);

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
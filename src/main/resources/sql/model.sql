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
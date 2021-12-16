DROP TABLE analysis;
DROP SEQUENCE anaSeq;

CREATE TABLE analysis (
      num NUMBER
    , tags VARCHAR2(100)
    , elements VARCHAR2(100)
    , searchDate DATE
    , make VARCHAR2(100)
    , model VARCHAR2(100)
);

CREATE SEQUENCE anaSeq;
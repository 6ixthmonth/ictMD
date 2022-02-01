CREATE TABLE user_basic (
    user_id VARCHAR2(100) PRIMARY KEY,
    user_pw VARCHAR2(100) NOT NULL,
    user_nm VARCHAR2(100) NOT NULL
);

CREATE TABLE user_detail (
    user_id VARCHAR2(100) REFERENCES user_basic ON DELETE CASCADE,
    birth VARCHAR2(100),
    model VARCHAR2(100),
    favorite VARCHAR2(100)
);
CREATE TABLE jjim_user
( -- 회원테이블
    id                  varchar2(30) PRIMARY KEY,
    password            varchar2(30),
    user_email          varchar2(50),
    --이메일 인증 되었는지 안되었는지 변경사항
    email_certification number,
    nickname            varchar2(30),
    phone_number        varchar2(20),
    user_address        varchar2(50),
    user_auth           varchar2(20),
    no_show             number
)
create table access_Token(
    id varchar2(30) CONSTRAINT take_out_id_FK REFERENCES jjim_user(id),
    fbToken varchar2(40),
    kkoToken varchar2(40)
);
create table restaurant(--가게 테이블
    resNum varchar2(30) constraint restaurant_resNum_pk primary key,
    res_name varchar2(50),
    res_email varchar2(100),
    res_phoneNum varchar2(50),
    res_img varchar2(100),
    openTime varchar2(30),
    endTime varchar2(30),
    day_off varchar2(10),
    stBTime varchar2(30),
    edBTime varchar2(30), -- 끝 휴식시간
    convenient varchar2(100),
    introduce varchar2(500),
    deposit number -- 보증금
);

CREATE TABLE jjim_user( -- 회원테이블
   id varchar2(30) PRIMARY KEY,
   password varchar2(30),
   user_email varchar2(50),
   nickname varchar2(30),
   phone_number varchar2(20),
   user_address varchar2(50),
   no_show number,
   token varchar2(30) CONSTRAINT jjim_user_token_FK REFERENCES sns_user(token)
);
create table sns_user(
    token varchar2(30) constraint sns_user_token_pk primary key,
    kakao_auth varchar2(30),
    facebook_auth varchar2(30)
);
create table res_user(
    resNum varchar2(30) constraint res_user_resNum_fk references restaurant(resNum),
    password varchar2(30),
    email varchar2(100),
    res_name varchar2(20),
    phone_Num varchar2(50),
    res_adress varchar2(100)
);
--포장 테이블
CREATE TABLE take_out(
   id varchar2(30) CONSTRAINT take_out_id_FK REFERENCES jjim_user(id),
   resNum varchar2(30) constraint take_out_resNum_fk references restaurant(resNum),
   take_out_time DATE,
   receipt_time DATE
);
-- 예약 테이블
CREATE TABLE reservation(
   id varchar2(30) CONSTRAINT reservation_id_FK REFERENCES jjim_user(id),
   resNum varchar2(30) constraint reservation_resNum_fk references restaurant(resNum),
   reserve_apply_person NUMBER,
   reserve_start_time DATE,
   reserve_request varchar2(100)
);
-- 찜리뷰테이블
CREATE TABLE jjim_review(
   review_code varchar2(20) PRIMARY KEY,
   id varchar2(30) CONSTRAINT jjim_review_id_FK REFERENCES jjim_user(id),
   resNum varchar2(30) constraint jjim_review_resNum_fk references restaurant(resNum),
   star_sco NUMBER,
   review_date DATE,
   review_content varchar2(100),
   review_img varchar2(100)
);
-- 메뉴테이블
create table menu(
    resNum varchar2(30) constraint menu_resNum_fk references restaurant(resNum),
    mCategory varchar(30),
    menuName varchar2(30),
    price number,
    food_image varchar2(100)
);
-- 매장픽 테이블
create table resPick(
    resNum varchar2(30) constraint resPick_resNum_fk references restaurant(resNum),
    mood varchar2(20),
    purpose varchar2(20),
    food_type varchar2(20),
    table_type varchar2(20)
);

-- 줄서기 테이블
create table waiting
(
    resNum varchar2(30) constraint waiting_resNum_fk references restaurant (resNum),
    id varchar2(30) constraint waiting_id_kf references jjim_user(id),
    wStartTime varchar2(30),
    waiting_num number, --대기팀 수
    waiting_person number,
    cancel char check(cancel in('F','T')),
    enter_check char check(enter_check in('F','T'))
);
-- 정책 일부로 pk 안넣음
create table policy(
    refund varchar2(500)
);

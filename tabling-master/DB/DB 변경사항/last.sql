--DROP SEQUENCE review_code;
--DROP TABLE TAKE_OUT ;
--DROP TABLE JJIM_SCH;
--DROP TABLE policy;
--DROP TABLE waiting;
--DROP TABLE resPick;
--DROP TABLE menu;
--DROP TABLE jjim_review;
--DROP SEQUENCE review_code;
--DROP TABLE reservation;
--DROP TABLE res_user;
--DROP TABLE access_Token;
--DROP TABLE jjim_user CASCADE constraint;
--DROP TABLE sns_user;
--DROP TABLE restaurant CASCADE constraint;
<<<<<<< HEAD
<<<<<<< HEAD
--DROP TABLE TAKE_OUT;

=======
>>>>>>> 6af74e24f4e707c5de2f47551cd5852bf720ef52
=======
>>>>>>> ca965223c51baf90a32ef2ffa162b7eb321b5527

create table restaurant(--가게 테이블
    resNum varchar2(30) constraint restaurant_resNum_pk primary key,
    res_name varchar2(50),
    res_email varchar2(100),
    res_addresss varchar2(50),
    res_phoneNum varchar2(50),
    res_img varchar2(100),
    business_hours varchar2(30),
    day_off varchar2(10),
    break_time varchar2(30),
    convenient varchar2(100),
    introduce varchar2(500),
    deposit NUMBER, -- 보증금
    enroll_date DATE,
    wating NUMBER,
    reservation NUMBER
);
SELECT * FROM RESTAURANT;
INSERT INTO restaurant values('123-45-67890','연돈','alsn99@naver.com','서울특별시 마포구 서교동','010-8890-5234',
'img','11:00-22:00','화요일','15:00-16:00','단체석 완비/주차 이용가능','매장 전화문의가 많아 전화응대가 어렵습니다.',5000,
to_date('20221120','YYYY-MM-DD'),1,1);

INSERT INTO restaurant values('123-45-67895','런던베이글','abc123@naver.com','서울특별시 서대문구 신촌동','010-8890-5234',
'img','10:00-23:00','수요일','15:00-16:00','단체석 완비/주차 이용가능/남녀 화장실 구분','서비스 많이 드릴게요 놀러오세요.',5000,
to_date('20221020','YYYY-MM-DD'),1,1);

INSERT INTO restaurant values('123-45-67894','도원','aaa1222@naver.com','서울특별시 마포구 동교동','010-8890-5234',
'img','12:00-20:00','목요일','-','주차 이용가능/무선 인터넷','정말 맛있을걸요 일단 먹어보세요',5000,
to_date('20211120','YYYY-MM-DD'),1,0);

INSERT INTO restaurant values('123-45-67893','은희네 해장국','wejp33@naver.com','서울특별시 은평구 불광동','010-8890-5234',
'img','11:00-22:00','목요일','-','단체석 완비/반려동물 입장가능','은희가 하는 해장국집입니다.',5000,
to_date('20201120','YYYY-MM-DD'),1,0);

INSERT INTO restaurant values('123-45-67892','참이맛 감자탕','adsfasdf@naver.com','서울특별시 금천구 시흥동','010-8890-5234',
'img','09:00-22:00','월요일','-','유아 놀이방/유아용 의자','감자탕 하면 역시 참이맛',5000,
to_date('20220527','YYYY-MM-DD'),0,1);

INSERT INTO restaurant values('123-45-67891','동화가든','qwer12@naver.com','서울특별시 중구 광희동','010-8890-5234',
'img','10:00-22:00','월요일','15:00-16:00','단체석 완비/주차 이용가능','강릉을 대표하는 동화가든이 서울에 왔다.',5000,
to_date('20201219','YYYY-MM-DD'),0,1);

SELECT * FROM restaurant;
-- 회원테이블
CREATE TABLE jjim_user
( -- 회원테이블
    user_email            varchar2(50) PRIMARY KEY,
    user_pw            	  varchar2(30),
  -- 이메일 인증 유무 인증x = 0, 인증o = 1
    emailAuth number constraint jjim_user_emailAuth_ck check(emailAuth in(0,1)),
    nickname            varchar2(30),
    phone_number        varchar2(20),
    user_address        varchar2(50),
    no_show             number,
  -- 연결 계정 권한(일반 0,카톡 1,네이버 2)
    idAuth number constraint jjim_user_user_idAuth_ck check(idAuth in(0,1,2))
);
INSERT into jjim_user VALUES('alsn0527@naver.com','1234',0,'유민우','010-9204-5515','용오로 82',0,0);
INSERT into jjim_user VALUES('hds123@naver.com','1234',0,'허다솜','010-1234-5678','토금북로 24',0,0);
INSERT into jjim_user VALUES('ljw123@naver.com','1234',0,'이지원','010-9204-1234','문래로 180',0,0);
INSERT into jjim_user VALUES('hjw123@naver.com','1234',0,'한정우','010-9204-9999','백범로 790',0,0);
INSERT into jjim_user VALUES('jyh123@naver.com','1234',0,'전윤환','010-9204-7777','토금중로 54',0,0);


-- 액세스토큰 테이블
create table access_Token(
    user_email varchar2(30) CONSTRAINT access_Token_user_email_FK REFERENCES jjim_user(user_email),
    -- 네이버
    nvrToken varchar2(50),
    kkoToken varchar2(50)
);

-- 사업자 테이블
create table res_user(
    resNum varchar2(30) constraint res_user_resNum_fk references restaurant(resNum),
    password varchar2(30),
    email varchar2(100),
    res_name varchar2(20),
    phone_Num varchar2(50),
    res_adress varchar2(100)
);
INSERT INTO res_user values('123-45-67890','1234','dbalsdn@naver.com','연돈','010-9204-5515','용오로 84');
INSERT INTO res_user values('123-45-67895','1234','alsn0000@naver.com','런던베이글','010-1111-1111','용오로 84');
INSERT INTO res_user values('123-45-67894','1234','alsn0001@naver.com','도원','010-2222-2222','토금북로 30');
INSERT INTO res_user values('123-45-67893','1234','alsn0002@naver.com','은희네 해장국','010-3333-3333','토금북로 32');
INSERT INTO res_user values('123-45-67892','1234','alsn0003@naver.com','참이맛 감자탕','010-4444-4444','토금북로 20');
INSERT INTO res_user values('123-45-67891','1234','alsn0004@naver.com','동화가든','010-5555-5555','토금북로 22');

--포장 테이블
CREATE TABLE take_out(
   user_email varchar2(30) CONSTRAINT take_out_user_email_FK REFERENCES jjim_user(user_email),
   resNum varchar2(30) constraint take_out_resNum_fk references restaurant(resNum),
   take_out_time DATE,
   receipt_time DATE
);

-- 예약 테이블
CREATE TABLE reservation(
   user_email varchar2(30) CONSTRAINT reservation_user_email_FK REFERENCES jjim_user(user_email),
   resNum varchar2(30) constraint reservation_resNum_fk references restaurant(resNum),
   reserve_apply_person NUMBER,
   reserve_start_time DATE,
   reserve_request varchar2(100),
   -- 승인/거절 컬럼. 0이면 대기, 1이면 승인, 2면 대기
   reserve_state number
);
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> 6af74e24f4e707c5de2f47551cd5852bf720ef52
=======
>>>>>>> ca965223c51baf90a32ef2ffa162b7eb321b5527
INSERT INTO RESERVATION values('alsn0527@naver.com','123-45-67890',4,
to_date('2023-01-06 14:00','YYYY-MM-DD HH24:MI'),'아기 의자 준비해주세요',0);

INSERT INTO RESERVATION values('hjw123@naver.com','123-45-67894',2,
to_date('2023-01-07 18:00','YYYY-MM-DD HH24:MI'),'안 맵게 해주세요',0);

INSERT INTO RESERVATION values('jyh123@naver.com','123-45-67893',3,
to_date('2023-01-08 20:00','YYYY-MM-DD HH24:MI'),'견과류 알러지 있습니다. 빼주세요.',0);

-- 찜리뷰테이블
CREATE TABLE jjim_review(
   review_code varchar2(20) PRIMARY KEY,
   user_email varchar2(30) CONSTRAINT jjim_review_user_email_FK REFERENCES jjim_user(user_email),
   resNum varchar2(30) constraint jjim_review_resNum_fk references restaurant(resNum),
   star_sco NUMBER,
   review_date DATE,
   review_content varchar2(100),
   review_img varchar2(100)
);
CREATE SEQUENCE review_code INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9999;

INSERT INTO jjim_review values(REVIEW_CODE.nextval,'alsn0527@naver.com','123-45-67895',
5,to_date('20221223','YYYY-MM-DD'),'정말 맛집이네요~','img');
INSERT INTO jjim_review values(REVIEW_CODE.nextval,'hds123@naver.com','123-45-67895',
4,to_date('20221224','YYYY-MM-DD'),'바삭바삭하네요','img');
INSERT INTO jjim_review values(REVIEW_CODE.nextval,'ljw123@naver.com','123-45-67895',
5,to_date('20221225','YYYY-MM-DD'),'친구한테 추천할게요','img');
INSERT INTO jjim_review values(REVIEW_CODE.nextval,'hjw123@naver.com','123-45-67895',
5,to_date('20221226','YYYY-MM-DD'),'다음에 또 올게요','img');
INSERT INTO jjim_review values(REVIEW_CODE.nextval,'jyh123@naver.com','123-45-67895',
5,to_date('20221227','YYYY-MM-DD'),'느낌있네요 정말','img');

INSERT INTO jjim_review values(REVIEW_CODE.nextval,'hds123@naver.com','123-45-67894',
3,to_date('20221223','YYYY-MM-DD'),'좀 별론데요','img');
INSERT INTO jjim_review values(REVIEW_CODE.nextval,'ljw123@naver.com','123-45-67894',
3,to_date('20221224','YYYY-MM-DD'),'진짜 느낌 없는데..','img');
INSERT INTO jjim_review values(REVIEW_CODE.nextval,'hjw123@naver.com','123-45-67894',
1,to_date('20221225','YYYY-MM-DD'),'진짜 최악이야 최악!!','img');
INSERT INTO jjim_review values(REVIEW_CODE.nextval,'jyh123@naver.com','123-45-67894',
3,to_date('20221226','YYYY-MM-DD'),'기대 이하입니다','img');

INSERT INTO jjim_review values(REVIEW_CODE.nextval,'ljw123@naver.com','123-45-67893',
5,to_date('20221223','YYYY-MM-DD'),'정말 맛있네요','img');
INSERT INTO jjim_review values(REVIEW_CODE.nextval,'hjw123@naver.com','123-45-67893',
5,to_date('20221222','YYYY-MM-DD'),'진짜 느낌있어요 이 집은','img');
INSERT INTO jjim_review values(REVIEW_CODE.nextval,'jyh123@naver.com','123-45-67893',
5,to_date('20221221','YYYY-MM-DD'),'저희 엄마가 한 것보다 맛있네요','img');


-- 메뉴테이블
create table menu(
    resNum varchar2(30) constraint menu_resNum_fk references restaurant(resNum),
    mCategory varchar(30),
    menuName varchar2(1000),
    price varchar2(1000),
    food_image varchar2(100)
);
INSERT INTO menu values('123-45-67890','일식','등심돈까스/안심돈까스/치즈돈까스','15,000/17,000/18,000','img');
INSERT INTO menu values('123-45-67895','브런치식','아메리카노/카페라떼/플랫화이트','5,000/6,000/6,000','img');
INSERT INTO menu values('123-45-67894','중식','짜장면/짬뽕/쟁반짜장','6,000/7,000/13,000','img');
INSERT INTO menu values('123-45-67893','한식','해장국/내장탕/양무침','10,000/12,000/15,000','img');
INSERT INTO menu values('123-45-67892','한식','감자탕(소)/감자탕(중)/감자탕(대)','22,000/26,000/30,000','img');
INSERT INTO menu values('123-45-67891','한식','짬뽕순두부/초두부/모두부','12,000/10,000/10,000','img');

-- 매장픽 테이블
create table resPick(
    resNum varchar2(30) constraint resPick_resNum_fk references restaurant(resNum),
    mood varchar2(300),
    purpose varchar2(300),
    food_type varchar2(300),
    table_type varchar2(300)
);


INSERT INTO resPick values('123-45-67890','깔끔한/신나는/전망좋은','친구랑 같이 가기 좋은','일식','홀테이블');
INSERT INTO resPick values('123-45-67895','깔끔한','데이트하기 좋은/친구랑 같이 가기 좋은','브런치/카페','-');
INSERT INTO resPick values('123-45-67894','깔끔한','회식하기 좋은','중식','홀테이블/단체석 테이블');
INSERT INTO resPick values('123-45-67893','전통적인','한 잔 하기 좋은 집/낮 술이 가능한/친구랑 같이 가기 좋은/회식하기 좋은','한식','단체석구비');
INSERT INTO resPick values('123-45-67892','전통적인','친구랑 같이 가기 좋은','한식','홀테이블');
INSERT INTO resPick values('123-45-67891','전통적인','친구랑 같이 가기 좋은','한식','-');


-- 줄서기 테이블
create table waiting
(
    resNum varchar2(30) constraint waiting_resNum_fk references restaurant (resNum),
    user_email varchar2(30) constraint waiting_user_email_kf references jjim_user(user_email),
    wStartTime date,
    waiting_num number, --대기팀 수
    waiting_person number,
    cancel char check(cancel in('F','T')),
    enter_check char check(enter_check in('F','T'))
);

INSERT INTO WAITING VALUES('123-45-67895','alsn0527@naver.com',
to_date('2023-01-06 14:00','YYYY-MM-DD HH24:MI'),0,4,'F','F');
INSERT INTO WAITING VALUES('123-45-67895','hds123@naver.com',
to_date('2023-01-06 14:30','YYYY-MM-DD HH24:MI'),0,2,'F','F');
INSERT INTO WAITING VALUES('123-45-67895','ljw123@naver.com',
to_date('2023-01-06 15:00','YYYY-MM-DD HH24:MI'),0,3,'F','F');
INSERT INTO WAITING VALUES('123-45-67895','hjw123@naver.com',
to_date('2023-01-06 15:30','YYYY-MM-DD HH24:MI'),0,6,'F','F');
INSERT INTO WAITING VALUES('123-45-67895','jyh123@naver.com',
to_date('2023-01-06 16:00','YYYY-MM-DD HH24:MI'),0,4,'F','F');

INSERT INTO WAITING VALUES('123-45-67890','ljw123@naver.com',
to_date('2023-01-05 15:00','YYYY-MM-DD HH24:MI'),0,4,'F','F');
INSERT INTO WAITING VALUES('123-45-67890','hjw123@naver.com',
to_date('2023-01-05 15:30','YYYY-MM-DD HH24:MI'),0,3,'F','F');
INSERT INTO WAITING VALUES('123-45-67890','jyh123@naver.com',
to_date('2023-01-05 16:00','YYYY-MM-DD HH24:MI'),0,2,'F','F');




-- 정책 일부로 pk 안넣음
create table policy(
    refund varchar2(500)
);

-- 검색기록 테이블
CREATE TABLE jjim_sch(
	user_email varchar2(30) CONSTRAINT jjim_sch_user_email_FK REFERENCES jjim_user(user_email),
	search_word varchar2(100),
	search_date date
);

INSERT INTO jjim_sch values('alsn0527@naver.com','연돈',sysdate);
INSERT INTO jjim_sch values('alsn0527@naver.com','런던베이글',sysdate);
INSERT INTO jjim_sch values('alsn0527@naver.com','숙성도',sysdate);
INSERT INTO jjim_sch values('alsn0527@naver.com','톤쇼우',sysdate);
INSERT INTO jjim_sch values('alsn0527@naver.com','해목',sysdate);
INSERT INTO jjim_sch values('alsn0527@naver.com','아웃백',sysdate);
INSERT INTO jjim_sch values('alsn0527@naver.com','송계옥',sysdate);
INSERT INTO jjim_sch values('alsn0527@naver.com','천돈가',sysdate);
INSERT INTO jjim_sch values('alsn0527@naver.com','해운대',sysdate);
INSERT INTO jjim_sch values('alsn0527@naver.com','성수',sysdate);
INSERT INTO jjim_sch values('alsn0527@naver.com','인천',sysdate);





-- 인기검색어 최근 7일 10개
-- SELECT SEARCH_WORD  FROM (
-- SELECT SEARCH_WORD , count(SEARCH_WORD) cnt 
-- FROM (SELECT * FROM JJIM_SCH WHERE (sysdate-SEARCH_DATE) <8 )
-- GROUP BY SEARCH_WORD 
-- ORDER BY cnt DESC)
-- WHERE ROWNUM<=10;
--- DB 유저(tns) 만들기 ---

alter session set "_oracle_script"=true;
create user tns identified by tnco;
grant connect, resource, unlimited tablespace to tns;
conn tns/tnco;


--- 구 테이블 ---

drop table GU;
purge recyclebin;

create table GU(
   GUID number constraint GU_PK primary key, 
   GUNAME varchar2(30)
);

insert into GU values(1, '기타 매물');
insert into GU values(2, '아파트(직접입력)');
insert into GU values(11110, '종로구');
insert into GU values(11140, '중구');
insert into GU values(11170, '용산구');
insert into GU values(11200, '성동구');
insert into GU values(11215, '광진구');
insert into GU values(11230, '동대문구');
insert into GU values(11260, '중랑구');
insert into GU values(11290, '성북구');
insert into GU values(11305, '강북구');
insert into GU values(11320, '도봉구');
insert into GU values(11350, '노원구');
insert into GU values(11380, '은평구');
insert into GU values(11410, '서대문구');
insert into GU values(11440, '마포구');
insert into GU values(11470, '양천구');
insert into GU values(11500, '강서구');
insert into GU values(11530, '구로구');
insert into GU values(11545, '금천구');
insert into GU values(11560, '영등포구');
insert into GU values(11590, '동작구');
insert into GU values(11620, '관악구');
insert into GU values(11650, '서초구');
insert into GU values(11680, '강남구');
insert into GU values(11710, '송파구');
insert into GU values(11740, '강동구');

select * from GU;

commit;
--------------------------------------------------
------ 유저, 게시판, 댓글, 대댓글, 거래정보 테이블 -------

drop table SCOMMENT;
drop sequence SCID_SEQ;
drop table FCOMMENT;
drop sequence FCID_SEQ;
drop table FILEUP;
drop sequence FILEUP_SEQ;
drop table POST;
drop sequence POSTID_SEQ;
drop table INFO;
drop sequence INFOID_SEQ;
drop table MAINPOST;
drop sequence MPID_SEQ;
drop table LOGIN;

purge recyclebin;


--- 유저 ---
create table LOGIN(
  EMAIL varchar2(50) constraint LOGIN_PK primary key,
  PWD varchar2(40) constraint LOGIN_NN not null,
  NICKNAME varchar2(30) constraint LOGIN_NICK_UQ unique,
  PHONE varchar2(15) constraint LOGIN_PHONE_UQ unique,
  LCDATE date,
  LWDATE date,
  ISADMIN varchar2(5)
);

--ALTER TABLE LOGIN ADD ISADMIN VARCHAR2(5);

select * from LOGIN;


--- 실거래 정보 ---
create table INFO(
  INFOID number constraint INFO_PK primary key,
  APT varchar2(60),
  IGUID number references GU(GUID) on delete cascade,
  DONG varchar2(30),
  PRICE varchar2(30),
  EAREA number(6,3),
  DYEAR number(4),
  DMONTH number(2)
);

create sequence INFOID_SEQ increment by 1 start with 1 nocache;

insert into INFO values(INFOID_SEQ.nextval, '해당없음', 1, null, null, null, null, null);
insert into INFO values(INFOID_SEQ.nextval, '해당없음', 2, null, null, null, null, null);
commit;

select * from INFO;
desc INFO;


--- 게시판 ---
create table POST(
  POSTID number constraint POST_PK primary key,
  SUBJECT varchar2(120) constraint POST_SUB_NN not null,
  CONTENT clob constraint POST_CON_NN not null,
  PEMAIL varchar2(50) references LOGIN(EMAIL) on delete cascade,
  PINFOID number references INFO(INFOID) on delete cascade,
  STATUS varchar2(12),
  PVIEW number,
  PCDATE date,
  PUDATE date
);

create sequence POSTID_SEQ increment by 1 start with 1 nocache;

desc POST;


--- 파일업로드 (필요없음)---
create table FILEUP(
  FUID number constraint FILEUP_PK primary key, 
  ORGNM varchar2(50), 
  SAVEDNM varchar2(50),
  SAVEDPATH varchar2(100),
  FPOSTID number references POST(POSTID) on delete cascade
);

create sequence FILEUP_SEQ increment by 1 start with 1 nocache;

desc FILEUP;

--- 댓글 ---
create table FCOMMENT(
  FCID number constraint FCOMMENT_PK primary key,
  FCCOMMENT varchar2(300) constraint FC_FCCOM_NN not null,
  FCPOSTID number references POST(POSTID) on delete cascade,
  FCEMAIL varchar2(50) references LOGIN(EMAIL) on delete cascade,
  FCCDATE date
);

create sequence FCID_SEQ increment by 1 start with 1 nocache;

select * from FCOMMENT;

--- 대댓글 ---
create table SCOMMENT(
  SCID number constraint SCOMMENT_PK primary key,
  SCCOMMENT varchar2(300) constraint SC_SCCOM_NN not null,
  SCFCID number references FCOMMENT(FCID) on delete cascade,
  SCEMAIL varchar2(50) references LOGIN(EMAIL) on delete cascade,
  SCCDATE date
);

create sequence SCID_SEQ increment by 1 start with 1 nocache;

select * from SCOMMENT;

--- 공지사항 ---
create table MAINPOST(
  MPID number constraint MAINPOST_PK primary key,
  MPSUB varchar2(120) constraint MAINPOST_SUB_NN not null,
  MPCON clob constraint MAINPOST_CON_NN not null,
  MPEMAIL varchar2(50) references LOGIN(EMAIL) on delete cascade,
  MPVIEW number,
  MPCDATE date,
  MPUDATE date
);

create sequence MPID_SEQ increment by 1 start with 1 nocache;

--- 확인하기 ---
select * from TAB;
select CONSTRAINT_NAME, CONSTRAINT_TYPE from user_constraints;
select * from SYS.USER_SEQUENCES;


--- TEST용 샘플 ---
insert into LOGIN values('woo@naver.com', 'a!23', '우', '01010001000', SYSDATE, null, null);
insert into LOGIN values('park@naver.com', 'a!23', '박', '01020002000', SYSDATE, null, null);
insert into LOGIN values('lee@naver.com', 'a!23', '이', '01030003000', SYSDATE, null, null);
insert into LOGIN values('admin@naver.com', 'a!23', '관리자1', '01000000000', SYSDATE, null, 'admin');
select * from LOGIN;
commit;
rollback;

insert into INFO values(INFOID_SEQ.nextval, '은마아파트', 11680, '대치동', '2,285,000,000', 76.79, 2023, 3);
insert into INFO values(INFOID_SEQ.nextval, '반포자이', 11650, '반포동', '5,300,000,000', 59.98, 2023, 2);
insert into INFO values(INFOID_SEQ.nextval, '청담자이', 11680, '청담동', '3,300,000,000', 49.59, 2023, 2);
insert into INFO values(INFOID_SEQ.nextval, '한강맨션', 11170, '이촌동', '3,950,000,000', 87.54, 2023, 2);
insert into INFO values(INFOID_SEQ.nextval, '신촌숲아이파크', 11440, '신수동', '1,600,000,000', 59.75, 2023, 3);
select * from INFO;
commit;

insert into POST values(POSTID_SEQ.nextval, '제목1', '내용1', 'woo@naver.com', 3, '판매중', 0, SYSDATE, SYSDATE);
insert into POST values(POSTID_SEQ.nextval, '제목2', '내용2', 'park@naver.com', 3, '판매중', 0, SYSDATE, SYSDATE);
insert into POST values(POSTID_SEQ.nextval, '제목3', '내용3', 'woo@naver.com', 2, '판매중', 0, SYSDATE, SYSDATE);
insert into POST values(POSTID_SEQ.nextval, '제목4', '내용4', 'lee@naver.com', 4, '판매중', 0, SYSDATE, SYSDATE);
insert into POST values(POSTID_SEQ.nextval, '제목5', '내용5', 'park@naver.com', 1, '예약중', 0, SYSDATE, SYSDATE);
insert into POST values(POSTID_SEQ.nextval, '제목6', '내용6', 'lee@naver.com', 5, '판매중', 0, SYSDATE, SYSDATE);
insert into POST values(POSTID_SEQ.nextval, '제목7', '내용7', 'woo@naver.com', 4, '판매중', 0, SYSDATE, SYSDATE);
insert into POST values(POSTID_SEQ.nextval, '제목8', '내용8', 'park@naver.com', 5, '판매중', 0, SYSDATE, SYSDATE);
insert into POST values(POSTID_SEQ.nextval, '제목9', '내용9', 'woo@naver.com', 2, '판매중', 0, SYSDATE, SYSDATE);
insert into POST values(POSTID_SEQ.nextval, '제목10', '내용10', 'lee@naver.com', 1, '판매중', 0, SYSDATE, SYSDATE);
select * from POST;
commit;

insert into FCOMMENT values(FCID_SEQ.nextval, '댓글1', 1, 'park@naver.com', SYSDATE);
insert into FCOMMENT values(FCID_SEQ.nextval, '댓글2', 3, 'park@naver.com', SYSDATE);
insert into FCOMMENT values(FCID_SEQ.nextval, '댓글3', 4, 'woo@naver.com', SYSDATE);
insert into FCOMMENT values(FCID_SEQ.nextval, '댓글4', 6, 'woo@naver.com', SYSDATE);
insert into FCOMMENT values(FCID_SEQ.nextval, '댓글5', 9, 'lee@naver.com', SYSDATE);
insert into FCOMMENT values(FCID_SEQ.nextval, '댓글6', 3, 'lee@naver.com', SYSDATE);
insert into FCOMMENT values(FCID_SEQ.nextval, '댓글7', 3, 'park@naver.com', SYSDATE);
insert into FCOMMENT values(FCID_SEQ.nextval, '댓글8', 3, 'lee@naver.com', SYSDATE);
select * from FCOMMENT;
commit;

insert into SCOMMENT values(SCID_SEQ.nextval, '대댓글1', 1, 'woo@naver.com', SYSDATE);
insert into SCOMMENT values(SCID_SEQ.nextval, '대댓글2', 3, 'lee@naver.com', SYSDATE);
insert into SCOMMENT values(SCID_SEQ.nextval, '대댓글3', 5, 'woo@naver.com', SYSDATE);
select * from SCOMMENT;
commit;

insert into MAINPOST values(MPID_SEQ.nextval, '공지1', '내용1', 'admin@naver.com', 0, SYSDATE, SYSDATE);
insert into MAINPOST values(MPID_SEQ.nextval, '공지2', '내용2', 'admin@naver.com', 0, SYSDATE, SYSDATE);
insert into MAINPOST values(MPID_SEQ.nextval, '공지3', '내용3', 'admin@naver.com', 0, SYSDATE, SYSDATE);
insert into MAINPOST values(MPID_SEQ.nextval, '공지4', '내용4', 'admin@naver.com', 0, SYSDATE, SYSDATE);
select * from MAINPOST;
commit;

--- 최종 확인 ---
select * from LOGIN;
select * from GU;
select * from INFO;
select * from POST;
select * from MAINPOST;
select * from FCOMMENT;
select * from SCOMMENT;

update Login set nickname='도' where email='do@naver.com';
SELECT * FROM LOGIN WHERE EMAIL != 'do@naver.com';
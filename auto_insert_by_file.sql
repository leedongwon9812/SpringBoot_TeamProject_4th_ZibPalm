-- 시스템 계정으로 접속
conn / as sysdba

-- TNS 계정에 디렉토리 생성 권한 부여
grant create any directory to tns;
grant drop any directory to tns;
conn tns/tnco

-- XML 파일이 담긴 디렉토리에 alias 지정
drop directory xml;
create directory xml as 'C:\SpringBootProject\xml_files\xml';

-- 강남구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangnam202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangnam202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangnam202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangnam202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangnam202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangnam202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 강동구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangdong202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangdong202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangdong202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangdong202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangdong202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangdong202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 강북구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangbuk202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangbuk202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangbuk202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangbuk202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangbuk202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangbuk202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 강서구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangseo202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangseo202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangseo202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangseo202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangseo202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gangseo202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 관악구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gwanak202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gwanak202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gwanak202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gwanak202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gwanak202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gwanak202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 광진구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gwangjin202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gwangjin202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gwangjin202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gwangjin202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gwangjin202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','gwangjin202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 구로구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','guro202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','guro202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','guro202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','guro202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','guro202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','guro202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 금천구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','geumcheon202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','geumcheon202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','geumcheon202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','geumcheon202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','geumcheon202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','geumcheon202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 노원구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','nowon202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','nowon202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','nowon202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','nowon202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','nowon202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','nowon202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 도봉구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','dobong202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','dobong202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','dobong202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','dobong202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','dobong202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','dobong202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 동대문구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','dongdaemun202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','dongdaemun202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','dongdaemun202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','dongdaemun202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','dongdaemun202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','dongdaemun202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 동작구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','dongjak202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','dongjak202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','dongjak202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','dongjak202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','dongjak202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','dongjak202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 마포구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','mapo202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','mapo202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','mapo202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','mapo202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','mapo202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','mapo202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 서대문구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seodaemun202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seodaemun202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seodaemun202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seodaemun202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seodaemun202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seodaemun202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 서초구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seocho202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seocho202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seocho202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seocho202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seocho202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seocho202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 성동구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seongdong202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seongdong202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seongdong202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seongdong202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seongdong202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seongdong202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 성북구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seongbuk202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seongbuk202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seongbuk202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seongbuk202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seongbuk202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','seongbuk202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 송파구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','songpa202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','songpa202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','songpa202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','songpa202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','songpa202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','songpa202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 양천구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','yangcheon202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','yangcheon202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','yangcheon202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','yangcheon202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','yangcheon202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','yangcheon202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 영등포구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','yeongdeungpo202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','yeongdeungpo202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','yeongdeungpo202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','yeongdeungpo202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','yeongdeungpo202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','yeongdeungpo202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 용산구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','yongsan202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','yongsan202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','yongsan202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','yongsan202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','yongsan202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','yongsan202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 은평구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','eunpyeong202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','eunpyeong202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','eunpyeong202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','eunpyeong202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','eunpyeong202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','eunpyeong202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 종로구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','jongno202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','jongno202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','jongno202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','jongno202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','jongno202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','jongno202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 중구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','jung202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','jung202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','jung202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','jung202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','jung202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','jung202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

-- 중랑구의 2023년 2월 매매정보를 파일로 입력
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','jungnang202302.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','jungnang202301.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','jungnang202212.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','jungnang202211.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','jungnang202210.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);
insert into INFO
select INFOID_SEQ.nextval, 아파트, 법정동시군구코드, 법정동, 거래금액, 전용면적, 년, 월
from XMLTable(
	'/response/body/items/item' 
passing
	XMLType(bfilename('XML','jungnang202209.xml'), nls_charset_id('AL32UTF8'))
	columns
		아파트 VARCHAR2(60) path '아파트',
		법정동시군구코드 NUMBER path '법정동시군구코드',
		법정동 VARCHAR2(30) path '법정동',
		거래금액 VARCHAR2(30) path '거래금액',
		전용면적 NUMBER(6,3) path '전용면적',
		년 NUMBER(4) path '년',
		월 NUMBER(2) path '월'
);

select * from INFO order by INFOID;
commit;

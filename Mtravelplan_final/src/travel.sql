

------------------------------------------------------
CREATE TABLE TRIP_MEMBER (
   ID        VARCHAR2(20)   PRIMARY KEY,
   PWD       VARCHAR2(20)   NOT NULL,
   NAME    VARCHAR2(20)   NOT NULL,
   NICKNAME VARCHAR2(20)    NOT NULL,
   EMAIL    VARCHAR2(40)    NOT NULL,
   AUTH    NUMBER       DEFAULT 3
);

select * from TRIP_poll


insert into TRIP_MEMBER values ('admin', '1234', '������', '������', 'admin@naver.com', '1');



CREATE TABLE TRIP (
   TSEQ   NUMBER         PRIMARY KEY,
   TNAME   VARCHAR2(200)   NOT NULL,
   SDATE   DATE         NOT NULL,
   EDATE   DATE         NOT NULL,
   ID      VARCHAR2(20)   NOT NULL,
   FILENAME	VARCHAR2(50)
);

CREATE SEQUENCE SEQ_TRIP START WITH 1 INCREMENT BY 1;

ALTER TABLE TRIP ADD CONSTRAINT FK_MEMBER_TRIP
FOREIGN KEY (ID)  REFERENCES TRIP_MEMBER (ID);

---------------------------------------------------------------
--���� �ϴ� ����
CREATE TABLE TRIP_GROUP (
   TGSEQ   NUMBER          PRIMARY KEY,
   TSEQ    NUMBER          NOT NULL,
   ID      VARCHAR2(20)   NOT NULL,
   GROUPIN NUMBER DEFAULT 0 --���߿� �̸� Ȯ��
);
CREATE SEQUENCE SEQ_TRIP_GROUP START WITH 1 INCREMENT BY 1;

ALTER TABLE TRIP_GROUP ADD CONSTRAINT FK_TGROUP_TRIP
FOREIGN KEY (TSEQ) REFERENCES TRIP (TSEQ);

ALTER TABLE TRIP_GROUP ADD CONSTRAINT FK_TGROUP_MEMBER
FOREIGN KEY (ID) REFERENCES TRIP_MEMBER (ID);

select * from trip;
-- 2017. 05. 23 �ۼ�
CREATE TABLE TRIP_CITY (  -- ���� ���� ���� ���̺�
   TCSEQ          NUMBER          PRIMARY KEY,
   TSEQ           NUMBER          NOT NULL,   -- ��� �Ҽ��� �������� ��Ÿ���� ����
   CITYNAME       VARCHAR2(20)    NOT NULL,   -- ���� �̸�
   CITYSDATE    DATE             NOT NULL,   -- ���� ���۳�
   CITYEDATE    DATE             NOT NULL,    -- ���� ����
   CITYLAT		NUMBER         NOT NULL,   -- ���� 
   CITYLNG		NUMBER         NOT NULL   -- �浵
);

insert Into TRIP_CITY
(TCSEQ , TSEQ, CITYNAME, CITYSDATE, CITYEDATE, CITYLAT, CITYLNG)
VALUES (SEQ_TRIP_CITY.NEXTVAL, 1, 'seoul', '2017-05-24', '2017-05-27', 37.50075507977441, 127.03690767288208);

select TCSEQ , TSEQ, CITYNAME, CITYSDATE, CITYEDATE, CITYLAT, CITYLNG
from TRIP_CITY where tseq=1;

CREATE SEQUENCE SEQ_TRIP_CITY START WITH 1 INCREMENT BY 1;

ALTER TABLE TRIP_CITY ADD CONSTRAINT FK_TCITY_TRIP
FOREIGN KEY (TSEQ) REFERENCES TRIP (TSEQ);

select * from TRIP;
select * from TRIP_CITY;
select * from TRIP_DAILY;
-- 30�ϳ� �߰�
DELETE TRIP_DAILY WHERE TSEQ =6

CREATE TABLE TRIP_DAILY (
   TDSEQ      NUMBER         PRIMARY KEY,
   TSEQ          NUMBER         NOT NULL,   -- ��� �Ҽ��� �������� ��Ÿ���� ����
   TCSEQ      NUMBER          	NOT NULL,   -- ��� ���� �������� �˾Ƴ�
   TDDATE      VARCHAR2(100)    	NOT NULL,   -- �ش� ��¥
   TDNUM	NUMBER			NOT NULL,	-- ���° ��Ŀ������ ���� ����
   TDPLACE      VARCHAR2(100)    ,   -- ��� �̸�
   TDSTIME      VARCHAR2(20)    ,   -- ���� �ð� (VARCHAR2������ DATE�� ���� �𸣰���)
   TDETIME      VARCHAR2(20)    ,   -- �� �ð�               //
   TDMONEY      NUMBER          DEFAULT 0,  -- ���� �� (�⺻�� 0)
   TDWORK      VARCHAR2(200)          ,  -- ���� (�Ƚᵵ�ǰ��س���)
   TDLAT      NUMBER          NOT NULL,   -- ���� 
   TDLNG      NUMBER          NOT NULL    -- �浵 
);

drop table TRIP_DAILY;
select * from TRIP_DAILY;
--tdnum=1, tdlat=37.93473538392394, tdlng=-91.76397719941406, tdplace=, tdwork=, 
--tddate=2017-05-29, tdmoney=0, tseq=4, tcseq=2, tdstime=0, tdetime=0
INSERT INTO TRIP_DAILY
(TDSEQ, TSEQ, TCSEQ, TDDATE, TDNUM, TDPLACE, TDSTIME, TDETIME, TDMONEY, TDWORK, TDLAT, TDLNG) 
VALUES(SEQ_TRIP_DAILY.NEXTVAL,
#{tname},#{sdate},#{edate},#{id},#{filename})		
SELECT * FROM TRIP_DAILY 
ORDER BY TDDATE, TDNUM

CREATE SEQUENCE SEQ_TRIP_DAILY START WITH 1 INCREMENT BY 1;

ALTER TABLE TRIP_DAILY ADD CONSTRAINT FK_TDAILY_TRIP
FOREIGN KEY (TSEQ) REFERENCES TRIP (TSEQ);

ALTER TABLE TRIP_DAILY ADD CONSTRAINT FK_TDAILY_TCITY
FOREIGN KEY (TCSEQ) REFERENCES TRIP_CITY (TCSEQ);

-------------------------------------6/2�� ��ħ
CREATE TABLE TRIP_BOARD_REPLY(
TBRSEQ	NUMBER	PRIMARY KEY,
id		varchar2(50) not null,
TBSEQ	NUMBER	NOT NULL,
CONTENT	VARCHAR2(500) NOT NULL
)

CREATE SEQUENCE TBRSEQ_TRIP_BOARD_REPLY
START WITH 1 INCREMENT BY 1;

ALTER TABLE TRIP_BOARD_REPLY
ADD CONSTRAINT FK_TBSEQ_TRIP_BOARD_REPLY FOREIGN KEY(TBSEQ)
REFERENCES TRIP_BOARD(TBSEQ);

ALTER TABLE TRIP_BOARD_REPLY ADD CONSTRAINT FK_TRIP_BOARD_REPLY
FOREIGN KEY (ID)  REFERENCES TRIP_MEMBER (ID);
----------------------------------------------------------------------------







----------------------------------------------------------------------------
create table trip_board(
tbseq 	number primary key,
tseq	number not null,
replycount	number	not null,
id 		varchar2(50) not null,
title 	varchar2(200) not null,
content varchar2(4000) not null,
filename varchar2(100) not null,
wdate 	date not null,
readcount number(8) not null
); 

drop table trip_board cascade constraint; 

CREATE SEQUENCE TBSEQ_TRIP_BOARD
START WITH 1 INCREMENT BY 1;

ALTER TABLE TRIP_BOARD
ADD CONSTRAINT FK_tseq_TRIP_BOARD FOREIGN KEY(tseq)
REFERENCES TRIP(tseq);
----------------------------------------------------------------------------

----------------------------------------------------------------------------
CREATE TABLE TRIP_ALBUM	(
SEQ NUMBER(8) PRIMARY KEY,
tseq	 NUMBER NOT NULL,
ID VARCHAR2(50) NOT NULL,
TITLE VARCHAR2(200) NOT NULL,

FILENAME VARCHAR2(50) NOT NULL,

DOWNCOUNT NUMBER(8) NOT NULL,
REGDATE DATE NOT NULL
);	

drop table trip_album cascade constraint




CREATE SEQUENCE SEQ_TRIP_ALBUM
START WITH 1 INCREMENT BY 1;

ALTER TABLE TRIP_ALBUM
ADD CONSTRAINT FK_TRIP_ALBUM_MEMBER FOREIGN KEY(ID)
REFERENCES TRIP_MEMBER(ID);

ALTER TABLE TRIP_ALBUM
ADD CONSTRAINT FK_tseq_TRIP_ALBUM FOREIGN KEY(tseq)
REFERENCES TRIP(tseq);
----------------------------------------------------------------------------




---------------------------------------share_board
--------6�� 2��
CREATE TABLE SHARE_BOARD(
	SBSEQ	NUMBER			PRIMARY KEY,
	ID		VARCHAR2(20)	NOT NULL,
	TSEQ	NUMBER      	NOT NULL,
	SBNAME	VARCHAR2(200)   NOT NULL,
	SBCITY	VARCHAR2(200)   NOT NULL,
	TOTALLIKE NUMBER		DEFAULT 0
);

select * from SHARE_BOARD;
update SHARE_BOARD set totallike = 0;
update SHARE_BOARD set totallike = (select count(*) from TRIP_LIKE where tseq =9) where tseq=9;

CREATE SEQUENCE SEQ_SHARE_BOARD START WITH 1 INCREMENT BY 1;

ALTER TABLE SHARE_BOARD ADD CONSTRAINT FK_SHARE_MEMBER
FOREIGN KEY (ID) REFERENCES TRIP_MEMBER (ID);
			
ALTER TABLE SHARE_BOARD ADD CONSTRAINT FK_SHARE_TRIP
FOREIGN KEY (TSEQ) REFERENCES TRIP (TSEQ);

-------------6�� 5��
CREATE TABLE TRIP_POLL(
TPSEQ      NUMBER    PRIMARY KEY,
tseq      NUMBER NOT NULL,
ID         VARCHAR2(50) NOT NULL,
QUESTION   VARCHAR2(1000) NOT NULL,
SDATE      DATE NOT NULL,
EDATE      DATE NOT NULL,
ITEMCOUNT  NUMBER NOT NULL,
POLLTOTAL  NUMBER NOT NULL,
REGDATE    DATE NOT NULL
);

CREATE SEQUENCE TPSEQ_TRIP_POLL START WITH 1 INCREMENT BY 1;

ALTER TABLE TRIP_POLL
ADD CONSTRAINT FK_tseq_TRIP_POLL FOREIGN KEY(tseq)
REFERENCES TRIP(tseq);

ALTER TABLE TRIP_POLL 
ADD CONSTRAINT FK_TRIP_POLL_MEMBER FOREIGN KEY (ID)
REFERENCES TRIP_MEMBER (ID);


----------------------------------------------------------------------------



----------------------------------------------------------------------------
CREATE TABLE TRIP_POLLSUB (
    POLLSUBSEQ  NUMBER PRIMARY KEY,
    TPSEQ      NUMBER NOT NULL,
    ANSWER     VARCHAR2(1000) NOT NULL,
    ACOUNT     NUMBER NOT NULL
);

CREATE SEQUENCE POLLSUBSEQ_TRIP_POLLSUB START WITH 1 INCREMENT BY 1;
  
ALTER TABLE TRIP_POLLSUB 
ADD CONSTRAINT FK_TPSEQ_TRIP_POLLSUB FOREIGN KEY (TPSEQ)
REFERENCES TRIP_POLL (TPSEQ);
----------------------------------------------------------------------------

----------------------------------------------------------------------------
CREATE TABLE TRIP_VOTER (
    VOTERSEQ    NUMBER PRIMARY KEY,
    TPSEQ     NUMBER,
    POLLSUBSEQ  NUMBER NOT NULL,
    ID         VARCHAR2(50) NOT NULL,
    REGDATE    DATE NOT NULL
);

CREATE SEQUENCE SEQ_TRIP_VOTER START WITH 1 INCREMENT BY 1;


ALTER TABLE TRIP_VOTER ADD CONSTRAINT FK_TPSEQ_TRIP_VOTER
FOREIGN KEY (TPSEQ)
REFERENCES TRIP_POLL (TPSEQ);

ALTER TABLE TRIP_VOTER ADD CONSTRAINT FK2_POLLSUBSEQ_TRIP_VOTER
FOREIGN KEY (POLLSUBSEQ)
REFERENCES TRIP_POLLSUB (POLLSUBSEQ);

ALTER TABLE TRIP_VOTER ADD CONSTRAINT FK3_ID_TRIP_VOTER
FOREIGN KEY (ID)
REFERENCES TRIP_MEMBER (ID);

-------------------------------------
CREATE TABLE TRIP_LIKE(
	LSEQ 	NUMBER	PRIMARY KEY,
	TSEQ	NUMBER	NOT NULL,
	ID		VARCHAR2(20)   NOT NULL
);



CREATE SEQUENCE SEQ_TRIP_LIKE START WITH 1 INCREMENT BY 1;

ALTER TABLE TRIP_LIKE ADD CONSTRAINT FK_TRIP_LIKE_MEMBER
FOREIGN KEY (ID)  REFERENCES TRIP_MEMBER (ID);

ALTER TABLE TRIP_LIKE ADD CONSTRAINT FK_TRIP_LIKE_TRIP
FOREIGN KEY (TSEQ)  REFERENCES TRIP (TSEQ);
-----------------------------------------
CREATE TABLE PLAN_BASKET(
	PLANSEQ 	NUMBER	PRIMARY KEY,
	BASKETNAME		VARCHAR2(100)   NOT NULL,
	SOMEDAY VARCHAR2(20),
	ID		VARCHAR2(20)   NOT NULL
);
--delete PLAN_BASKET where planseq = 1;
select * from PLAN_BASKET;

CREATE SEQUENCE SEQ_PLAN_BASKET START WITH 1 INCREMENT BY 1;

ALTER TABLE plan_basket ADD CONSTRAINT FK_plan_basket_MEMBER
FOREIGN KEY (ID)  REFERENCES TRIP_MEMBER (ID);

------------------------------------------
CREATE TABLE BASKET_DAILY (
   BTDSEQ      NUMBER         PRIMARY KEY,
   TSEQ          NUMBER         NOT NULL,   -- ��� �Ҽ��� �������� ��Ÿ���� ����
   TCSEQ      NUMBER          	NOT NULL,   -- ��� ���� �������� �˾Ƴ�
   BTDDATE      VARCHAR2(100)    	NOT NULL,   -- �ش� ��¥
   BTDNUM	NUMBER			NOT NULL,	-- ���° ��Ŀ������ ���� ����
   BTDPLACE      VARCHAR2(100)    ,   -- ��� �̸�
   BTDSTIME      VARCHAR2(20)    ,   -- ���� �ð� (VARCHAR2������ DATE�� ���� �𸣰���)
   BTDETIME      VARCHAR2(20)    ,   -- �� �ð�               //
   BTDMONEY      NUMBER          DEFAULT 0,  -- ���� �� (�⺻�� 0)
   BTDWORK      VARCHAR2(200)          ,  -- ���� (�Ƚᵵ�ǰ��س���)
   BTDLAT      NUMBER          NOT NULL,   -- ���� 
   BTDLNG      NUMBER          NOT NULL,    -- �浵
   PLANSEQ 	NUMBER		NOT NULL
);
--select * from plan_basket;
--select * from BASKET_DAILY;
CREATE SEQUENCE SEQ_BASKET_DAILY START WITH 1 INCREMENT BY 1;

ALTER TABLE BASKET_DAILY ADD CONSTRAINT FK_BASKET_DAILY_TRIP
FOREIGN KEY (TSEQ) REFERENCES TRIP (TSEQ);

ALTER TABLE BASKET_DAILY ADD CONSTRAINT FK_BASKET_DAILY_TCITY
FOREIGN KEY (TCSEQ) REFERENCES TRIP_CITY (TCSEQ);

ALTER TABLE BASKET_DAILY ADD CONSTRAINT FK_TDAILY_PLAN_BASKET
FOREIGN KEY (PLANSEQ) REFERENCES PLAN_BASKET (PLANSEQ);
------------------------------------------
select * from trip_member;
select * from trip;
select * from trip_city;

delete trip where tseq=1;
delete trip_city where tseq=1;
delete trip_group where tseq=1;
delete trip_album where tseq=1;


--��� �ٱ��Ͽ� DB ������ admin, tseq = 1, tcseq = 1
insert into trip values (1, 'plan basket', '2000-01-01', '2999-12-31', 'admin', 'noimage.png');
insert into trip_city values (1, 1, '����', '2000-01-01', '2000-01-02', 37.5, 37.5);

select * from PLAN_BASKET;
select * from trip;

CREATE TABLE TRIP_PAGING(
   TSEQ   NUMBER         PRIMARY KEY,
   TNAME   VARCHAR2(200)   NOT NULL,
   SDATE   DATE         NOT NULL,
   EDATE   DATE         NOT NULL,
   ID      VARCHAR2(20)   NOT NULL,
   FILENAME   VARCHAR2(50)
)    

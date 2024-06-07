
DROP TABLE BOOKMARK;
DROP TABLE FAQ;
DROP TABLE CS_COMMENT;
DROP TABLE CUSTOMERSERVICE;
DROP TABLE ATTACHMENT;
DROP TABLE NOTICE;
DROP TABLE CATEGORY;
DROP TABLE DETAIL;
DROP TABLE REPORT;
DROP TABLE GIFT;
DROP TABLE PAYMENT;
DROP TABLE KAKAO_PAYMENT;
DROP TABLE PRODUCT_ODR;
DROP TABLE APP_STORE_IMAGE;
DROP TABLE EVENT_IMAGE;
DROP TABLE REVIEW_IMAGE;
DROP TABLE STORE_IMAGE;
DROP TABLE REVIEW;
DROP TABLE APPLICATION;
DROP TABLE STORE;
DROP TABLE MEMBER;
DROP TABLE TYPE;
DROP TABLE EVENT;
DROP TABLE APP_TYPE;


DROP SEQUENCE SEQ_KAKAOPAY_NO;
DROP SEQUENCE SEQ_MEM;
DROP SEQUENCE EVE_SEQ;
DROP SEQUENCE APP_SEQ;
DROP SEQUENCE SEQ_REVNO;
DROP SEQUENCE SEQ_REV_IMG_NO;
DROP SEQUENCE SEQ_REPNO;
DROP SEQUENCE ASI_SEQ;
DROP SEQUENCE CAT_SEQ;
DROP SEQUENCE CUS_SEQ;
DROP SEQUENCE FAQ_SEQ;
DROP SEQUENCE NOT_SEQ;
DROP SEQUENCE SEQ_ODR_NO;
DROP SEQUENCE SEQ_PAY_NO;
DROP SEQUENCE SEQ_COM_NO;
DROP SEQUENCE SEQ_DET_NO;
DROP SEQUENCE STI_SEQ;
DROP SEQUENCE SEQ_STORE;
DROP SEQUENCE EVI_SEQ;
DROP SEQUENCE APP_TYPE_SEQ;

--------------------------------------------------
--------------     회원 관련  	------------------	
--------------------------------------------------
CREATE TABLE MEMBER(
USER_NO NUMBER CONSTRAINT USER_PK PRIMARY KEY,
USER_ID VARCHAR2(50) CONSTRAINT U_ID_NN NOT NULL CONSTRAINT U_ID_UQ UNIQUE,
USER_PWD VARCHAR2(100) CONSTRAINT U_PWD_NN NOT NULL,
USER_NAME VARCHAR2(50) CONSTRAINT U_NAME_NN NOT NULL,
EMAIL VARCHAR2(50)CONSTRAINT EMA_NN NOT NULL CONSTRAINT EMA_UQ UNIQUE,
PHONE VARCHAR2(13)CONSTRAINT PHO_NN NOT NULL,
ADDRESS VARCHAR2(50) CONSTRAINT ADD_NN NOT NULL,
ENROLL_DATE DATE DEFAULT SYSDATE CONSTRAINT ENR_NN NOT NULL,
BALANCE NUMBER DEFAULT 0 CONSTRAINT BAL_NN NOT NULL,
BLACKLIST CHAR(1) DEFAULT 'N' CONSTRAINT BLA_CK CHECK(BLACKLIST IN('Y','N'))  CONSTRAINT BLA_NN NOT NULL,
STATUS CHAR(1) DEFAULT 'Y' CONSTRAINT STA_CK CHECK(STATUS IN('Y','N')) NOT NULL

);

COMMENT ON COLUMN MEMBER.USER_NO IS '회원번호';
COMMENT ON COLUMN MEMBER.USER_ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.USER_PWD IS '회원PW';
COMMENT ON COLUMN MEMBER.USER_NAME IS '회원이름';
COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.PHONE IS '전화번호';
COMMENT ON COLUMN MEMBER.ADDRESS IS '주소';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '가입일';
COMMENT ON COLUMN MEMBER.BALANCE IS '잔액';
COMMENT ON COLUMN MEMBER.BLACKLIST IS '블랙리스트 여부';
COMMENT ON COLUMN MEMBER.STATUS IS '탈퇴 여부';

CREATE SEQUENCE SEQ_MEM
NOCACHE;


--------------------------------------------------
---------------     주문 관련	   -------------------	
--------------------------------------------------
CREATE TABLE PRODUCT_ODR(
ORDER_NO NUMBER CONSTRAINT PRO_PK PRIMARY KEY,
ORDER_QTY NUMBER NOT NULL,
ORDER_PRICE NUMBER NOT NULL,
USER_NO NUMBER CONSTRAINT PRO_FK REFERENCES MEMBER(USER_NO)NOT NULL,
TOTAL_PRICE NUMBER NOT NULL,
ORDER_ENROLL DATE DEFAULT SYSDATE NOT NULL,
GIFT_YN CHAR(1) DEFAULT 'N' CHECK(GIFT_YN IN('Y','N'))
);

COMMENT ON COLUMN PRODUCT_ODR.ORDER_NO IS '주문번호';
COMMENT ON COLUMN PRODUCT_ODR.USER_NO IS '회원번호';
COMMENT ON COLUMN PRODUCT_ODR.ORDER_QTY IS '상품수량';
COMMENT ON COLUMN PRODUCT_ODR.ORDER_PRICE IS '상품권금액';
COMMENT ON COLUMN PRODUCT_ODR.TOTAL_PRICE IS '총가격';
COMMENT ON COLUMN PRODUCT_ODR.ORDER_ENROLL IS '주문날짜';
COMMENT ON COLUMN PRODUCT_ODR.GIFT_YN IS '선물여부';

CREATE SEQUENCE SEQ_ODR_NO
NOCACHE;

--------------------------------------------------
---------------  카카오 페이 관련  ------------------
---------------------------------------------------
CREATE TABLE KAKAO_PAYMENT(
PAY_NO_K NUMBER CONSTRAINT PAY_PK_K PRIMARY KEY,
ORDER_NO_K NUMBER UNIQUE NOT NULL REFERENCES PRODUCT_ODR(ORDER_NO),
PAY_DATE_K DATE DEFAULT SYSDATE NOT NULL,
PAY_COMPANY_K VARCHAR2(30) NOT NULL,
PAY_PRICE_K NUMBER NOT NULL,
PAY_IMP_UID VARCHAR2(50) NOT NULL,
PAY_MERCHANT_UID VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN KAKAO_PAYMENT.PAY_NO_K IS '결제번호';
COMMENT ON COLUMN KAKAO_PAYMENT.ORDER_NO_K IS '주문번호';
COMMENT ON COLUMN KAKAO_PAYMENT.PAY_DATE_K IS '결제날짜';
COMMENT ON COLUMN KAKAO_PAYMENT.PAY_COMPANY_K IS '카드사';
COMMENT ON COLUMN KAKAO_PAYMENT.PAY_PRICE_K IS '결제가격';
COMMENT ON COLUMN KAKAO_PAYMENT.PAY_IMP_UID IS '포트원 거래고유번호';
COMMENT ON COLUMN KAKAO_PAYMENT.PAY_MERCHANT_UID IS '가맹점 주문번호';

CREATE SEQUENCE SEQ_KAKAOPAY_NO
NOCACHE;


--------------------------------------------------
---------------     결제 관련	   -------------------	
--------------------------------------------------
CREATE TABLE PAYMENT(
PAY_NO NUMBER CONSTRAINT PAY_PK PRIMARY KEY,
ORDER_NO NUMBER UNIQUE NOT NULL REFERENCES PRODUCT_ODR(ORDER_NO),
PAY_DATE DATE DEFAULT SYSDATE NOT NULL,
PAY_COMPANY VARCHAR2(30) NOT NULL,
PAY_PRICE NUMBER NOT NULL
);

COMMENT ON COLUMN PAYMENT.PAY_NO IS '결제번호';
COMMENT ON COLUMN PAYMENT.ORDER_NO IS '주문번호';
COMMENT ON COLUMN PAYMENT.PAY_DATE IS '결제날짜';
COMMENT ON COLUMN PAYMENT.PAY_COMPANY IS '카드사';
COMMENT ON COLUMN PAYMENT.PAY_PRICE IS '결제가격';

CREATE SEQUENCE SEQ_PAY_NO
NOCACHE;


--------------------------------------------------
---------------     선물 관련	   -------------------	
--------------------------------------------------
CREATE TABLE GIFT(
ORDER_NO NUMBER CONSTRAINT ORDER_PK PRIMARY KEY REFERENCES PRODUCT_ODR(ORDER_NO),
SEND_NO NUMBER  NOT NULL REFERENCES MEMBER(USER_NO),
RECEIVE_NO NUMBER NOT NULL REFERENCES MEMBER(USER_NO)

);

COMMENT ON COLUMN GIFT.ORDER_NO IS '주분번호';
COMMENT ON COLUMN GIFT.SEND_NO IS '보낸사람회원번호';
COMMENT ON COLUMN GIFT.RECEIVE_NO IS '받는사람회원번호';


--------------------------------------------------
---------------     매장타입 관련    -------------------	
--------------------------------------------------
CREATE TABLE TYPE(
STORE_TYPE CHAR(2) CONSTRAINT TY_PK PRIMARY KEY,
TYPE_NAME VARCHAR2(20) CONSTRAINT TYPE_NAME_NN NOT NULL
);

COMMENT ON COLUMN TYPE.STORE_TYPE IS '매장타입';
COMMENT ON COLUMN TYPE.TYPE_NAME IS '타입종류';


--------------------------------------------------
---------------     매장 관련    -------------------	
--------------------------------------------------
CREATE TABLE STORE(
STORE_NO NUMBER CONSTRAINT STORE_PK PRIMARY KEY,
STORE_NAME VARCHAR2(50)CONSTRAINT SNAME_NN NOT NULL,
STORE_TYPE CHAR(2) CONSTRAINT STYPE_NN NOT NULL CONSTRAINT STYPE_FK REFERENCES TYPE(STORE_TYPE) ON DELETE CASCADE,
STORE_ADDRESS VARCHAR2(100) CONSTRAINT SADD_NN NOT NULL,
STORE_PHONE VARCHAR2(15)CONSTRAINT SPHONE_NN NOT NULL CONSTRAINT SPHONE_UQ UNIQUE,
STORE_TIME VARCHAR2(30) CONSTRAINT STIME_NN NOT NULL,
BUSINESS_NO VARCHAR2(15) CONSTRAINT BNO_NN NOT NULL CONSTRAINT BNO_UQ UNIQUE,
STORE_PRICE VARCHAR2(4000) CONSTRAINT SPRICE_NN NOT NULL,
STORE_STATUS VARCHAR2(1) DEFAULT 'N' CHECK(STORE_STATUS IN('Y','N'))
);

COMMENT ON COLUMN STORE.STORE_NO IS '매장번호';
COMMENT ON COLUMN STORE.STORE_NAME IS '매장이름';
COMMENT ON COLUMN STORE.STORE_TYPE IS '매장타입';
COMMENT ON COLUMN STORE.STORE_ADDRESS IS '매장주소';
COMMENT ON COLUMN STORE.STORE_PHONE IS '매장전화번호';
COMMENT ON COLUMN STORE.STORE_TIME IS '영업시간';
COMMENT ON COLUMN STORE.STORE_PRICE IS '가격';
COMMENT ON COLUMN STORE.BUSINESS_NO IS '사업자번호';

CREATE SEQUENCE SEQ_STORE
NOCACHE;

--------------------------------------------------
---------------     리뷰 관련    -------------------	
--------------------------------------------------
CREATE TABLE REVIEW(
REVIEW_NO NUMBER CONSTRAINT REV_PK PRIMARY KEY,
USER_NO NUMBER CONSTRAINT REV_USER_NN NOT NULL
CONSTRAINT REV_USER_FK REFERENCES MEMBER(USER_NO) ON DELETE CASCADE,
STORE_NO NUMBER CONSTRAINT REV_STORE_NN NOT NULL
CONSTRAINT REV_STORE_FK REFERENCES STORE(STORE_NO) ON DELETE CASCADE,
CONTENT VARCHAR2(500) CONSTRAINT REV_CT_NN NOT NULL,
GRADE NUMBER CONSTRAINT REV_GR_NN NOT NULL,
ISSUE_DATE DATE DEFAULT SYSDATE CONSTRAINT REV_DATE_NN NOT NULL,
MODIFY_DATE DATE DEFAULT SYSDATE,
REPORT_COUNT NUMBER DEFAULT 0,
REVIEW_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(REVIEW_STATUS IN('Y','N'))
);

COMMENT ON COLUMN REVIEW.REVIEW_NO IS '리뷰번호';
COMMENT ON COLUMN REVIEW.USER_NO IS '회원번호';
COMMENT ON COLUMN REVIEW.STORE_NO IS '매장번호';
COMMENT ON COLUMN REVIEW.CONTENT IS '리뷰내용';
COMMENT ON COLUMN REVIEW.GRADE IS '평점';
COMMENT ON COLUMN REVIEW.ISSUE_DATE IS '작성일자';
COMMENT ON COLUMN REVIEW.MODIFY_DATE IS '수정일자';
COMMENT ON COLUMN REVIEW.REPORT_COUNT IS '신고당한 횟수';
COMMENT ON COLUMN REVIEW.REVIEW_STATUS IS '리뷰상태';

CREATE SEQUENCE SEQ_REVNO
NOCACHE;


--------------------------------------------------
---------------     신고 관련    -------------------	
--------------------------------------------------
CREATE TABLE REPORT(
REPORT_NO NUMBER CONSTRAINT REP_PK PRIMARY KEY,
REVIEW_NO NUMBER CONSTRAINT REP_REVNO_NN NOT NULL
CONSTRAINT REP_REVNO_FK REFERENCES REVIEW(REVIEW_NO) ON DELETE CASCADE,
REPORT_REASON VARCHAR2(50) CONSTRAINT REP_RE_NN NOT NULL,
REPORT_DATE DATE DEFAULT SYSDATE CONSTRAINT REP_DATE_NN NOT NULL,
REPORTER_NO NUMBER CONSTRAINT REP_USERNO_NN NOT NULL
CONSTRAINT REP_USERNO_FK REFERENCES MEMBER(USER_NO) ON DELETE CASCADE,
SUSPECT_NO NUMBER CONSTRAINT REP_PUSERNO_NN NOT NULL
CONSTRAINT REP_PUSERNO_FK REFERENCES MEMBER(USER_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN REPORT.REPORT_NO IS '신고번호';
COMMENT ON COLUMN REPORT.REVIEW_NO IS '리뷰번호';
COMMENT ON COLUMN REPORT.REPORT_REASON IS '신고사유';
COMMENT ON COLUMN REPORT.REPORT_DATE IS '신고일시';
COMMENT ON COLUMN REPORT.REPORTER_NO IS '신고자 회원번호';
COMMENT ON COLUMN REPORT.SUSPECT_NO IS '피신고자 회원번호';

CREATE SEQUENCE SEQ_REPNO
NOCACHE;


--------------------------------------------------
---------------    사용내역 관련  -------------------	
--------------------------------------------------
CREATE TABLE DETAIL(
DET_NO NUMBER CONSTRAINT DET_PK PRIMARY KEY,
USER_NO NUMBER NOT NULL UNIQUE REFERENCES MEMBER(USER_NO),
STORE_NO NUMBER NOT NULL UNIQUE REFERENCES STORE(STORE_NO),
DET_PAY NUMBER NOT NULL,
DET_DATE DATE DEFAULT SYSDATE NOT NULL
);

COMMENT ON COLUMN DETAIL.DET_NO IS '사용번호';
COMMENT ON COLUMN DETAIL.USER_NO IS '회원번호';
COMMENT ON COLUMN DETAIL.STORE_NO IS '매장번호';
COMMENT ON COLUMN DETAIL.DET_PAY IS '사용금액';
COMMENT ON COLUMN DETAIL.DET_DATE IS '사용일';
CREATE SEQUENCE SEQ_DET_NO
NOCACHE;


--------------------------------------------------
---------------    이벤트  관련  -------------------	
--------------------------------------------------
CREATE TABLE EVENT(
EV_NO NUMBER CONSTRAINT   EV_PK PRIMARY KEY,
EV_TITLE VARCHAR2(50) CONSTRAINT V_FF_NN NOT NULL,
EV_DETAIL VARCHAR2(4000) CONSTRAINT V_GG_NN NOT NULL,
EV_DATE DATE DEFAULT SYSDATE CONSTRAINT V_SS_NN NOT NULL,
EV_FIN DATE CONSTRAINT V_WW_NN NOT NULL,
EV_COUNT INTEGER DEFAULT 0 NULL

);

COMMENT ON COLUMN EVENT.EV_NO IS '등록번호';
COMMENT ON COLUMN EVENT.EV_TITLE IS '제목';
COMMENT ON COLUMN EVENT.EV_DETAIL IS '내용';
COMMENT ON COLUMN EVENT.EV_DATE IS '등록일자';
COMMENT ON COLUMN EVENT.EV_FIN IS '마감일자';
COMMENT ON COLUMN EVENT.EV_COUNT IS '이벤트 조회수';

CREATE SEQUENCE EVE_SEQ

NOCACHE;


--------------------------------------------------
---------------   카테고리  관련  -------------------	
--------------------------------------------------
CREATE TABLE CATEGORY(
CG_NO NUMBER CONSTRAINT CG_PK PRIMARY KEY,
CG_TYPE VARCHAR2(20) CONSTRAINT  T_LL_NN NOT NULL
);

COMMENT ON COLUMN CATEGORY.CG_NO IS '카테고리번호';
COMMENT ON COLUMN CATEGORY.CG_TYPE IS '유형';

CREATE SEQUENCE CAT_SEQ

NOCACHE;

--------------------------------------------------
---------------   공지사항  관련  -------------------	
--------------------------------------------------
CREATE TABLE NOTICE(
NOTI_CODE NUMBER CONSTRAINT NOTI_PK PRIMARY KEY,
NOTI_TITLE VARCHAR2(500) CONSTRAINT N_TITLE_NN NOT NULL,
NOTI_CONTENT VARCHAR2(3000) CONSTRAINT N_CONTENT_NN NOT NULL,
NOTI_DATE DATE DEFAULT SYSDATE CONSTRAINT N_DATE_NN NOT NULL,
NOTI_COUNT NUMBER CONSTRAINT  N_COUNT_NN  NOT NULL,
USER_NO NUMBER  CONSTRAINT N_US_NN  NOT NULL  CONSTRAINT N_US_FK  REFERENCES MEMBER(USER_NO) ON DELETE CASCADE

);

COMMENT ON COLUMN NOTICE.NOTI_CODE IS '공지사항등록번호';
COMMENT ON COLUMN NOTICE.NOTI_TITLE IS '공지사항제목';
COMMENT ON COLUMN NOTICE.NOTI_CONTENT IS '공지사항내용';
COMMENT ON COLUMN NOTICE.NOTI_DATE IS '작성날짜';
COMMENT ON COLUMN NOTICE.NOTI_COUNT IS '공지사항조회수';
COMMENT ON COLUMN NOTICE.USER_NO IS '작성자';

CREATE SEQUENCE NOT_SEQ
NOCACHE;



--------------------------------------------------
---------------   입점신청  관련  -------------------	
--------------------------------------------------
CREATE TABLE APPLICATION(
APP_NO NUMBER CONSTRAINT APP_PK PRIMARY KEY,
USER_NO NUMBER CONSTRAINT USER_NN NOT NULL CONSTRAINT USER_FK REFERENCES MEMBER(USER_NO),
STORE_TYPE CHAR(2) CONSTRAINT APP_ST_NN NOT NULL CONSTRAINT APP_ST_FK REFERENCES TYPE(STORE_TYPE),
STORE_NAME VARCHAR2(50) CONSTRAINT APP_SNAME_NN NOT NULL,
STORE_ADDRESS VARCHAR2(100) CONSTRAINT APP_SADD_NN NOT NULL,
STORE_PHONE VARCHAR2(15) CONSTRAINT APP_SPHONE_NN NOT NULL,
STORE_TIME VARCHAR2(30) CONSTRAINT APP_STIME_NN NOT NULL,
BUSINESS_NO VARCHAR2(15) CONSTRAINT APP_BUSI_NN NOT NULL,
STORE_PRICE VARCHAR2(4000) CONSTRAINT APP_SPRICE_NN NOT NULL,
APP_DATE DATE DEFAULT SYSDATE CONSTRAINT APP_DATE_NN NOT NULL,
APP_YN CHAR(1) DEFAULT 'P' CHECK(APP_YN IN('Y','N','P')),
REFUSE VARCHAR2(150)
);

COMMENT ON COLUMN APPLICATION.APP_NO IS '신청번호';
COMMENT ON COLUMN APPLICATION.USER_NO IS '신청자번호';
COMMENT ON COLUMN APPLICATION.STORE_TYPE IS '매장타입';
COMMENT ON COLUMN APPLICATION.STORE_NAME IS '매장이름';
COMMENT ON COLUMN APPLICATION.STORE_ADDRESS IS '매장주소';
COMMENT ON COLUMN APPLICATION.STORE_PHONE IS '매장전화번호';
COMMENT ON COLUMN APPLICATION.STORE_TIME IS '영업시간';
COMMENT ON COLUMN APPLICATION.BUSINESS_NO IS '사업자번호';
COMMENT ON COLUMN APPLICATION.STORE_PRICE IS '가격';
COMMENT ON COLUMN APPLICATION.APP_DATE IS '신청일자';
COMMENT ON COLUMN APPLICATION.APP_YN IS '승인여부';
COMMENT ON COLUMN APPLICATION.REFUSE IS '거절사유';

CREATE SEQUENCE APP_SEQ
NOCACHE;


--------------------------------------------------
---------------   고객센터파일  관련  -------------------	
--------------------------------------------------
CREATE TABLE ATTACHMENT(
ATT_NO NUMBER CONSTRAINT ATT_PK PRIMARY KEY,
ATT_ROUTE VARCHAR2(100) NOT NULL,
ATT_TITLE VARCHAR2(200) NOT NULL
);

COMMENT ON COLUMN ATTACHMENT.ATT_NO IS '첨부파일번호';
COMMENT ON COLUMN ATTACHMENT.ATT_ROUTE IS '파일저장경로';
COMMENT ON COLUMN ATTACHMENT.ATT_TITLE IS '파일제목';




--------------------------------------------------
---------------   고객센터  관련  -------------------	
--------------------------------------------------
CREATE TABLE CUSTOMERSERVICE(
CS_NO NUMBER CONSTRAINT CS_PK PRIMARY KEY,
USER_NO NUMBER CONSTRAINT C_SE_NN NOT NULL  CONSTRAINT C_SE_FK  REFERENCES MEMBER(USER_NO) ON DELETE CASCADE,
CS_TITLE VARCHAR2(200) CONSTRAINT C_TITLE_NN NOT NULL,
CS_DETAIL VARCHAR2(4000) CONSTRAINT C_DETAIL_NN NOT NULL,
CS_DATE DATE DEFAULT SYSDATE CONSTRAINT C_DATE_NN NOT NULL,
CS_SECRET CHAR(1) DEFAULT 'N' CHECK(CS_SECRET IN ('Y','N')) NOT NULL,
CS_PWD VARCHAR2(20),
CG_NO NUMBER CONSTRAINT C_CG_NN NOT NULL CONSTRAINT C_CG_FK REFERENCES  CATEGORY(CG_NO) ON DELETE CASCADE,
ATT_NO INTEGER NULL 
);

COMMENT ON COLUMN CUSTOMERSERVICE.CS_NO IS '문의글 게시번호';
COMMENT ON COLUMN CUSTOMERSERVICE.USER_NO IS '회원번호';
COMMENT ON COLUMN CUSTOMERSERVICE.CS_TITLE IS '문의글제목';
COMMENT ON COLUMN CUSTOMERSERVICE.CS_DETAIL IS '문의글내용';
COMMENT ON COLUMN CUSTOMERSERVICE.CS_DATE IS '문의글등록일';
COMMENT ON COLUMN CUSTOMERSERVICE.CS_SECRET IS '비밀글여부';
COMMENT ON COLUMN CUSTOMERSERVICE.CS_PWD IS '비밀글 비밀번호';
COMMENT ON COLUMN CUSTOMERSERVICE.CG_NO IS '카테고리번호';
COMMENT ON COLUMN CUSTOMERSERVICE.ATT_NO IS '첨부파일번호'; 

CREATE SEQUENCE CUS_SEQ
NOCACHE;


--------------------------------------------------
---------------  고객센터 댓글 관련-------------------	
--------------------------------------------------
CREATE TABLE CS_COMMENT(
COM_NO NUMBER CONSTRAINT COM_PK PRIMARY KEY,
CS_NO NUMBER NOT NULL UNIQUE REFERENCES CUSTOMERSERVICE(CS_NO),
COM_DATE DATE DEFAULT SYSDATE NOT NULL,
COM_COMMENT VARCHAR2(4000) NOT NULL,
USER_NO NUMBER NOT NULL REFERENCES MEMBER(USER_NO)
);

COMMENT ON COLUMN CS_COMMENT.COM_NO IS '문의글 댓글번호';
COMMENT ON COLUMN CS_COMMENT.CS_NO IS '문의글 게시글번호';
COMMENT ON COLUMN CS_COMMENT.COM_DATE IS '댓글 작성일';
COMMENT ON COLUMN CS_COMMENT.COM_COMMENT IS '댓글 내용';
COMMENT ON COLUMN CS_COMMENT.USER_NO IS '작성자';

CREATE SEQUENCE SEQ_COM_NO
NOCACHE;



--------------------------------------------------
---------------  자주묻는질문  관련-------------------	
--------------------------------------------------
CREATE TABLE FAQ(
FAQ_NO NUMBER CONSTRAINT FAQ_PK PRIMARY KEY,
FAQ_TITLE VARCHAR2(50) CONSTRAINT F_TITEL_NN NOT NULL,
FAQ_DETAIL VARCHAR2(4000) CONSTRAINT F_DETAIL_NN NOT NULL,
FAQ_COUNT INTEGER NULL, 
FAQ_CATE VARCHAR2(100) NULL 
);

COMMENT ON COLUMN FAQ.FAQ_NO IS '등록번호';
COMMENT ON COLUMN FAQ.FAQ_TITLE IS '제목';
COMMENT ON COLUMN FAQ.FAQ_DETAIL IS '내용';
COMMENT ON COLUMN FAQ.FAQ_COUNT IS '조회수';
COMMENT ON COLUMN FAQ.FAQ_CATE IS '카테고리';

CREATE SEQUENCE FAQ_SEQ

NOCACHE;


--------------------------------------------------
---------------  북마크      관련-------------------	
--------------------------------------------------
CREATE TABLE BOOKMARK(
USER_NO NUMBER CONSTRAINT BOOKMARK_FK1 REFERENCES MEMBER(USER_NO) ON DELETE CASCADE,
STORE_NO NUMBER CONSTRAINT BOOKMARK_FK2 REFERENCES STORE(STORE_NO) ON DELETE CASCADE,
CONSTRAINT BOOKMARK_PK PRIMARY KEY(USER_NO, STORE_NO)
);

COMMENT ON COLUMN BOOKMARK.USER_NO IS '회원번호';
COMMENT ON COLUMN BOOKMARK.STORE_NO IS '매장번호';


--------------------------------------------------
---------------  리뷰 이미지 관련 -------------------	
--------------------------------------------------
CREATE TABLE REVIEW_IMAGE(
IMG_NO NUMBER CONSTRAINT IMG_PK PRIMARY KEY,
REVIEW_NO NUMBER NOT NULL REFERENCES REVIEW(REVIEW_NO),
IMG_ROOT VARCHAR2(150) NOT NULL,
ORIGIN_NAME VARCHAR2(150) NOT NULL,
CHANGE_NAME VARCHAR2(150)  NOT NULL,
IMG_LEVEL NUMBER NOT NULL
);

COMMENT ON COLUMN REVIEW_IMAGE.IMG_NO IS '리뷰사진번호';
COMMENT ON COLUMN REVIEW_IMAGE.REVIEW_NO IS '참조리뷰번호';
COMMENT ON COLUMN REVIEW_IMAGE.IMG_ROOT IS '사진저장경로';
COMMENT ON COLUMN REVIEW_IMAGE.ORIGIN_NAME IS '원본제목';
COMMENT ON COLUMN REVIEW_IMAGE.CHANGE_NAME IS '변경제목';
COMMENT ON COLUMN REVIEW_IMAGE.IMG_LEVEL IS '리뷰사진레벨';

CREATE SEQUENCE SEQ_REV_IMG_NO
NOCACHE;

--------------------------------------------------
---------------  입점신청 이미지 관련 -------------------	
--------------------------------------------------
CREATE TABLE APP_STORE_IMAGE(
IMG_NO NUMBER CONSTRAINT APPS_PK PRIMARY KEY,
APP_NO NUMBER NOT NULL REFERENCES APPLICATION(APP_NO),
IMG_ROOT VARCHAR2(150) NOT NULL,
ORIGIN_NAME VARCHAR2(150) NOT NULL,
CHANGE_NAME VARCHAR2(150) NOT NULL,
IMG_LEVEL NUMBER  NOT NULL,
STATUS VARCHAR2(1) DEFAULT 'N' CHECK(STATUS IN ('Y','N')) NOT NULL);

COMMENT ON COLUMN APP_STORE_IMAGE.IMG_NO IS '사진경로번호';
COMMENT ON COLUMN APP_STORE_IMAGE.APP_NO IS '리뷰번호';
COMMENT ON COLUMN APP_STORE_IMAGE.IMG_ROOT IS '사진경로';
COMMENT ON COLUMN APP_STORE_IMAGE.ORIGIN_NAME IS '원본제목';
COMMENT ON COLUMN APP_STORE_IMAGE.CHANGE_NAME IS '변경제목';
COMMENT ON COLUMN APP_STORE_IMAGE.IMG_LEVEL IS '파일레벨';
COMMENT ON COLUMN APP_STORE_IMAGE.STATUS IS '삭제여부';
CREATE SEQUENCE ASI_SEQ
NOCACHE;


--------------------------------------------------
---------------  매장 이미지 관련 -------------------	
--------------------------------------------------
CREATE TABLE STORE_IMAGE(
IMG_NO NUMBER CONSTRAINT STI_PK PRIMARY KEY,
APP_NO NUMBER NOT NULL,
IMG_ROOT VARCHAR2(150) CONSTRAINT IMGS_NN NOT NULL,
ORIGIN_NAME VARCHAR2(150) CONSTRAINT ORIS_NN NOT NULL,
CHANGE_NAME VARCHAR2(150) CONSTRAINT CHAS_NN NOT NULL,
IMG_LEVEL NUMBER CONSTRAINT ILEVS_NN NOT NULL,
STATUS VARCHAR2(1) DEFAULT 'N' CONSTRAINT STS_CK CHECK(STATUS IN ('Y','N')) CONSTRAINT STAS_NN NOT NULL);

COMMENT ON COLUMN STORE_IMAGE.IMG_NO IS '사진경로번호';
COMMENT ON COLUMN STORE_IMAGE.APP_NO IS '리뷰번호';
COMMENT ON COLUMN STORE_IMAGE.IMG_ROOT IS '사진경로';
COMMENT ON COLUMN STORE_IMAGE.ORIGIN_NAME IS '원본제목';
COMMENT ON COLUMN STORE_IMAGE.CHANGE_NAME IS '변경제목';
COMMENT ON COLUMN STORE_IMAGE.IMG_LEVEL IS '파일레벨';
COMMENT ON COLUMN STORE_IMAGE.STATUS IS '삭제여부';

CREATE SEQUENCE STI_SEQ
NOCACHE;


--------------------------------------------------
---------------  이벤트 이미지 관련 -------------------	
--------------------------------------------------
CREATE TABLE EVENT_IMAGE(
IMG_NO NUMBER CONSTRAINT EVI_PK PRIMARY KEY,
IMG_ROOT VARCHAR2(150)  NOT NULL,
ORIGIN_NAME VARCHAR2(150)  NOT NULL,
CHANGE_NAME VARCHAR2(32)  NOT NULL, 
IMG_LEVEL NUMBER NOT NULL,
STATUS CHAR(1) DEFAULT 'N'  NOT NULL CHECK(STATUS IN('Y','N')),
EV_NO NUMBER NOT NULL  REFERENCES EVENT(EV_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN EVENT_IMAGE.IMG_NO IS '사진경로번호';
COMMENT ON COLUMN EVENT_IMAGE.IMG_ROOT IS '사진경로';
COMMENT ON COLUMN EVENT_IMAGE.ORIGIN_NAME IS '원본제목';
COMMENT ON COLUMN EVENT_IMAGE.CHANGE_NAME IS '변경제목';
COMMENT ON COLUMN EVENT_IMAGE.IMG_LEVEL IS '파일레벨';
COMMENT ON COLUMN EVENT_IMAGE.STATUS IS '삭제여부';
COMMENT ON COLUMN EVENT_IMAGE.EV_NO IS '등록번호';


CREATE SEQUENCE EVI_SEQ
NOCACHE;

--------------------------------------------------
---------------     입점승인여부 관련    -------------------   
--------------------------------------------------
CREATE TABLE APP_TYPE (
    APP_YN CHAR(2) CONSTRAINT APP_TYPE_PK PRIMARY KEY, 
    APP_TYPENAME VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN APP_TYPE.APP_YN IS '승인여부'; 
COMMENT ON COLUMN APP_TYPE.APP_TYPENAME IS '타입종류';

CREATE SEQUENCE APP_TYPE_SEQ
NOCACHE;


--------------------------------------------------------------
------------               insert                ------------------
------------------------------------------------------------------


INSERT INTO TYPE
VALUES('S1','손세차');
INSERT INTO TYPE
VALUES('S2','기계세차');
INSERT INTO TYPE
VALUES('S3','셀프세차');


INSERT INTO STORE
VALUES(SEQ_STORE.NEXTVAL,'동재네 세차장','S1','서울시 강서구 공항대로65가길 25','010-2784-3845','24시간','01027-843845','1회 10000원, 하부세차 2000원',DEFAULT);
INSERT INTO STORE
VALUES(SEQ_STORE.NEXTVAL,'동건이네 세차장','S1','서울특별시 강남구 봉은사로26길 22-11','010-8799-1063','08:00~21:00','01087-99-1063','1회 12000원, 하부세차 2000원 왁싱 3000원',DEFAULT);
INSERT INTO STORE
VALUES(SEQ_STORE.NEXTVAL,'콘초네 세차장','S2','서울 강남구 삼성동 111-8','010-8751-1654','08:00~20:00','0108-751-1654','실내세차 15000원, 외부세차 10000원, 실내+외부 20000원 ',DEFAULT);
INSERT INTO STORE
VALUES(SEQ_STORE.NEXTVAL,'종민이네깔끄미','S2','전남 해남군 송지면 송호길 35 송호리사무소경로당','010-1645-7843','10:00~21:00','0101-645-7843','프리미엄실내세차 20000원,일반실내세차 16000원, 프리미엄외부세차 12000원, 일반외부세차 10000원',DEFAULT);
INSERT INTO STORE
VALUES(SEQ_STORE.NEXTVAL,'한기의 차사랑','S3','경기도 수원시 장안구 이목로 24','010-8314-2168','10:30~22:00','0108-314-2168','고압세차 2분당 1000원, 버블세차 2분당 1500원, 왁스세차 2분당 2000원',DEFAULT);


INSERT INTO DETAIL
VALUES (SEQ_DET_NO.NEXTVAL, 1 , 1 , 34200, DEFAULT );
INSERT INTO DETAIL
VALUES (SEQ_DET_NO.NEXTVAL, 2 , 2 , 11200, DEFAULT );
INSERT INTO DETAIL
VALUES (SEQ_DET_NO.NEXTVAL, 3 , 3 , 33200, DEFAULT );
INSERT INTO DETAIL
VALUES (SEQ_DET_NO.NEXTVAL, 4 , 4 , 44200, DEFAULT );
INSERT INTO DETAIL
VALUES (SEQ_DET_NO.NEXTVAL, 5 , 5 , 54200, DEFAULT );

INSERT INTO PRODUCT_ODR
VALUES (SEQ_ODR_NO.NEXTVAL, 1, 50000, 1,50000,DEFAULT, 'Y');

INSERT INTO PAYMENT
VALUES (SEQ_PAY_NO.NEXTVAL, SEQ_ODR_NO.CURRVAL , DEFAULT, '현대카드' , 50000);

INSERT INTO GIFT
VALUES (SEQ_ODR_NO.CURRVAL, 1 , 2);

INSERT INTO PRODUCT_ODR
VALUES (SEQ_ODR_NO.NEXTVAL, 2,5000, 2  , 10000, DEFAULT, 'N');

INSERT INTO PAYMENT
VALUES (SEQ_PAY_NO.NEXTVAL, SEQ_ODR_NO.CURRVAL , DEFAULT, '하나카드' , 10000);

INSERT INTO PRODUCT_ODR
VALUES (SEQ_ODR_NO.NEXTVAL, 3,30000,1, 30000 , DEFAULT, 'N');

INSERT INTO PAYMENT
VALUES (SEQ_PAY_NO.NEXTVAL, SEQ_ODR_NO.CURRVAL , DEFAULT, '카카오카드' , 30000);

INSERT INTO PRODUCT_ODR
VALUES (SEQ_ODR_NO.NEXTVAL, 4, 10000,1,10000, DEFAULT ,'N');

INSERT INTO PAYMENT
VALUES (SEQ_PAY_NO.NEXTVAL, SEQ_ODR_NO.CURRVAL , DEFAULT, '현대카드' , 30000);

INSERT INTO PRODUCT_ODR
VALUES (SEQ_ODR_NO.NEXTVAL, 1,5000,1,  5000,DEFAULT,'N');

INSERT INTO PAYMENT
VALUES (SEQ_PAY_NO.NEXTVAL, SEQ_ODR_NO.CURRVAL , DEFAULT, '하나카드' , 20000);


INSERT INTO CATEGORY
VALUES(CAT_SEQ.NEXTVAL,'유형1');
INSERT INTO CATEGORY
VALUES(CAT_SEQ.NEXTVAL,'유형2');

INSERT INTO CUSTOMERSERVICE
VALUES(CUS_SEQ.NEXTVAL,1,'문의글입니다1','내용입니다1',DEFAULT,DEFAULT,NULL,1);
INSERT INTO CUSTOMERSERVICE
VALUES(CUS_SEQ.NEXTVAL,1,'문의글입니다2','내용입니다2',DEFAULT,DEFAULT,NULL,1);
INSERT INTO CUSTOMERSERVICE
VALUES(CUS_SEQ.NEXTVAL,1,'문의글입니다3','내용입니다3',DEFAULT,DEFAULT,NULL,1);
INSERT INTO CUSTOMERSERVICE
VALUES(CUS_SEQ.NEXTVAL,1,'문의글입니다4','내용입니다4',DEFAULT,DEFAULT,NULL,1);
INSERT INTO CUSTOMERSERVICE
VALUES(CUS_SEQ.NEXTVAL,1,'문의글입니다5','내용입니다5',DEFAULT,DEFAULT,NULL,1);

INSERT INTO CS_COMMENT
VALUES (SEQ_COM_NO.NEXTVAL,1, DEFAULT , '아 환불안된다고요;', 2 ); --문의글번호SEQ.CURRVAL 넣으면될듯함 몰루
INSERT INTO CS_COMMENT
VALUES (SEQ_COM_NO.NEXTVAL,2, DEFAULT , '댓글내용2', 2 );
INSERT INTO CS_COMMENT
VALUES (SEQ_COM_NO.NEXTVAL,3, DEFAULT , '댓글내용3', 2 );
INSERT INTO CS_COMMENT
VALUES (SEQ_COM_NO.NEXTVAL,4, DEFAULT , '댓글내용4', 2 );
INSERT INTO CS_COMMENT
VALUES (SEQ_COM_NO.NEXTVAL,5, DEFAULT , '댓글내용5', 2 );

INSERT INTO NOTICE
VALUES(NOT_SEQ.NEXTVAL, '공지사항입니다1', '내용~~',DEFAULT,1,1);
INSERT INTO NOTICE
VALUES(NOT_SEQ.NEXTVAL, '공지사항입니다2', '내용~2',DEFAULT,2,2);
INSERT INTO NOTICE
VALUES(NOT_SEQ.NEXTVAL, '공지사항입니다3', '내용~3',DEFAULT,3,3);
INSERT INTO NOTICE
VALUES(NOT_SEQ.NEXTVAL, '공지사항입니다4', '내용~4',DEFAULT,4,4);
INSERT INTO NOTICE
VALUES(NOT_SEQ.NEXTVAL, '공지사항입니다5', '내용~5',DEFAULT,5,5);



INSERT INTO FAQ
VALUES(FAQ_SEQ.NEXTVAL,'제목1','내용1');
INSERT INTO FAQ
VALUES(FAQ_SEQ.NEXTVAL,'제목2','내용2');
INSERT INTO FAQ
VALUES(FAQ_SEQ.NEXTVAL,'제목3','내용3');
INSERT INTO FAQ
VALUES(FAQ_SEQ.NEXTVAL,'제목4','내용4');
INSERT INTO FAQ
VALUES(FAQ_SEQ.NEXTVAL,'제목5','내용5');

INSERT INTO EVENT
VALUES(EVE_SEQ.NEXTVAL,'제목1','내용1',DEFAULT,'2026-02-11');
INSERT INTO EVENT
VALUES(EVE_SEQ.NEXTVAL,'제목2','내용2',DEFAULT,'2025-03-12');
INSERT INTO EVENT
VALUES(EVE_SEQ.NEXTVAL,'제목3','내용3',DEFAULT,'2024-04-13');
INSERT INTO EVENT
VALUES(EVE_SEQ.NEXTVAL,'제목4','내용4',DEFAULT,'2023-05-14');
INSERT INTO EVENT
VALUES(EVE_SEQ.NEXTVAL,'제목5','내용5',DEFAULT,'2022-06-15');


INSERT INTO APP_TYPE
VALUES('Y', '승인');

INSERT INTO APP_TYPE
VALUES('P', '대기');

INSERT INTO APP_TYPE
VALUES('N', '거절');

COMMIT;



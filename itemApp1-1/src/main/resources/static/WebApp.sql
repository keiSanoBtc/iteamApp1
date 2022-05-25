#利用者テーブル
CREATE TABLE USER_TABLE (
  USER_ID           INT(9)          NOT NULL PRIMARY KEY    COMMENT '利用者ID',
  USER_NAME         VARCHAR(100)    NOT NULL                COMMENT '利用者名'
);
INSERT INTO USER_TABLE (USER_ID , USER_NAME)
VALUES (1  , 'OI') ;
INSERT INTO USER_TABLE (USER_ID , USER_NAME)
VALUES (2  , 'KAWAKITA') ;
INSERT INTO USER_TABLE (USER_ID , USER_NAME)
VALUES (3  , 'SANO') ;
INSERT INTO USER_TABLE (USER_ID , USER_NAME)
VALUES (4  , 'HAYASHI') ;
INSERT INTO USER_TABLE (USER_ID , USER_NAME)
VALUES (5  , 'MAMIYA') ;


#本読了状況テーブル
CREATE TABLE BOOK_PLAN_TABLE (
  USER_ID           INT(9)           NOT NULL    COMMENT '利用者ID',
  BOOK_RECORD_NO    INT(3)        NOT NULL    COMMENT '本の履歴数',
  BOOK_NAME         VARCHAR(100)     NOT NULL    COMMENT '本の名前',
  READ_FLAG         INT(1)           DEFAULT 0   COMMENT '既読フラグ',
  PRIMARY KEY(USER_ID, BOOK_RECORD_NO)
);

#テストデータ
INSERT INTO BOOK_PLAN_TABLE (USER_ID, BOOK_RECORD_NO, BOOK_NAME, READ_FLAG)
VALUES (1  ,1 ,'ワンピース', 0) ;
INSERT INTO BOOK_PLAN_TABLE (USER_ID, BOOK_RECORD_NO, BOOK_NAME, READ_FLAG)
VALUES (1  ,2 ,'スパイファミリー', 0) ;
INSERT INTO BOOK_PLAN_TABLE (USER_ID, BOOK_RECORD_NO, BOOK_NAME, READ_FLAG)
VALUES (1  ,3 ,'ハリーポッターと賢者の石', 1) ;
INSERT INTO BOOK_PLAN_TABLE (USER_ID, BOOK_RECORD_NO, BOOK_NAME, READ_FLAG)
VALUES (2  ,1 ,'Java入門', 0) ;
INSERT INTO BOOK_PLAN_TABLE (USER_ID, BOOK_RECORD_NO, BOOK_NAME, READ_FLAG)
VALUES (2  ,2 ,'springboot参考書', 0) ;
INSERT INTO BOOK_PLAN_TABLE (USER_ID, BOOK_RECORD_NO, BOOK_NAME, READ_FLAG)
VALUES (3  ,1 ,'7つの習慣', 0) ;


#読みたい本の追加
INSERT INTO BOOK_PLAN_TABLE (USER_ID, BOOK_RECORD_NO, BOOK_NAME, READ_FLAG)
VALUES (1  ,1 ,'追加したい本のタイトル', 0) ;


#読みたい本のタイトル編集
UPDATE BOOK_PLAN_TABLE
SET READ_NAME ='変更後のタイトル'
WHERE USER_ID = 1
AND BOOK_RECORD_NO = 1 ;


#本の削除
DELETE FROM BOOK_PLAN_TABLE
WHERE USER_ID = 1
AND BOOK_RECORD_NO = 2;


#読みたい本の一覧
SELECT b.READ_NAME
FROM USER_TABLE a INNER JOIN BOOK_PLAN_TABLE b ON b.USER_ID = a.USER_ID
WHERE b.USER_ID = 1
AND b.READ_FLAG = 0
ORDER BY b.BOOK_RECORD_NO ;


#読んだ本の一覧
SELECT b.BOOK_NAME
FROM USER_TABLE a INNER JOIN BOOK_PLAN_TABLE b ON b.USER_ID = a.USER_ID
WHERE b.USER_ID = 1
AND b.READ_FLAG = 1
ORDER BY b.BOOK_RECORD_NO ;


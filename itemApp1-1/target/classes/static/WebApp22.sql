﻿-- 利用者テーブル
CREATE TABLE USER_TABLE (
  USER_ID           INT(9)          NOT NULL PRIMARY KEY    COMMENT '利用者ID',
  USER_NAME         VARCHAR(100)    NOT NULL                COMMENT '利用者名'
);
INSERT INTO USER_TABLE (USER_ID , USER_NAME)
VALUES (1, 'OI') ;
INSERT INTO USER_TABLE (USER_ID , USER_NAME)
VALUES (2, 'KAWAKITA') ;
INSERT INTO USER_TABLE (USER_ID , USER_NAME)
VALUES (3, 'SANO') ;
INSERT INTO USER_TABLE (USER_ID , USER_NAME)
VALUES (4, 'HAYASHI') ;
INSERT INTO USER_TABLE (USER_ID , USER_NAME)
VALUES (5, 'MAMIYA') ;

-- 本テーブル
CREATE TABLE BOOK_TABLE (
  BOOK_ID           INT(9)          NOT NULL PRIMARY KEY    COMMENT '本ID',
  BOOK_TITLE         VARCHAR(100)    NOT NULL                COMMENT '本のタイトル'
);
INSERT INTO BOOK_TABLE (BOOK_ID, BOOK_TITLE)
VALUES (1, 'ワンピース') ;
INSERT INTO BOOK_TABLE (BOOK_ID, BOOK_TITLE)
VALUES (2, 'スパイファミリー') ;
INSERT INTO BOOK_TABLE (BOOK_ID, BOOK_TITLE)
VALUES (3, 'ハリーポッターと賢者の石') ;
INSERT INTO BOOK_TABLE (BOOK_ID, BOOK_TITLE)
VALUES (4, 'Java入門');
INSERT INTO BOOK_TABLE (BOOK_ID, BOOK_TITLE)
VALUES (5, 'springboot参考書') ;


-- 本読了状況テーブル
CREATE TABLE BOOK_PLAN_TABLE (
  USER_ID           INT(9)           NOT NULL    COMMENT '利用者ID',
  BOOK_ID           INT(9)           NOT NULL    COMMENT '本ID',
  READ_FLAG         INT(1)           DEFAULT 0   COMMENT '既読フラグ',
  DELETE_FLAG       INT(1)           DEFAULT 0   COMMENT '削除フラグ',
  PRIMARY KEY(USER_ID, BOOK_ID)
);

-- テストデータ
INSERT INTO BOOK_PLAN_TABLE (USER_ID, BOOK_ID, READ_FLAG)
VALUES (1, 1, 0) ;
INSERT INTO BOOK_PLAN_TABLE (USER_ID, BOOK_ID, READ_FLAG)
VALUES (1, 2, 0) ;
INSERT INTO BOOK_PLAN_TABLE (USER_ID, BOOK_ID, READ_FLAG)
VALUES (2, 1, 1) ;
INSERT INTO BOOK_PLAN_TABLE (USER_ID, BOOK_ID, READ_FLAG)
VALUES (2, 2, 0) ;
INSERT INTO BOOK_PLAN_TABLE (USER_ID, BOOK_ID, READ_FLAG)
VALUES (2, 4, 0) ;
INSERT INTO BOOK_PLAN_TABLE (USER_ID, BOOK_ID, READ_FLAG)
VALUES (3, 1, 0) ;

-- 読みたい本の追加
INSERT INTO BOOK_PLAN_TABLE (USER_ID, BOOK_ID)
VALUES (1, 4) ;



#読みたい本の一覧
SELECT a.USER_NAME , c.BOOK_TITLE
  FROM (USER_TABLE a INNER JOIN BOOK_PLAN_TABLE b ON b.USER_ID = a.USER_ID)
                     INNER JOIN BOOK_TABLE c ON b.BOOK_ID = c.BOOK_ID
  WHERE b.USER_ID = 1
  AND b.READ_FLAG = 0
  AND b.DELETE_FLAG = 0
 ORDER BY b.BOOK_ID ;


#既読した本の一覧
SELECT a.USER_NAME , c.BOOK_TITLE
  FROM (USER_TABLE a INNER JOIN BOOK_PLAN_TABLE b ON b.USER_ID = a.USER_ID)
                     INNER JOIN BOOK_TABLE c ON b.BOOK_ID = c.BOOK_ID
  WHERE b.USER_ID = 2
  AND b.READ_FLAG = 1
  AND b.DELETE_FLAG = 0
 ORDER BY b.BOOK_ID ;

#読みたい本の編集
UPDATE BOOK_TABLE
SET c.BOOK_TITLE = '変更後のタイトル'
FROM (USER_TABLE a INNER JOIN BOOK_PLAN_TABLE b ON b.USER_ID = a.USER_ID)
                     INNER JOIN BOOK_TABLE c ON b.BOOK_ID = c.BOOK_ID
WHERE USER_ID = 1
  AND BOOK_ID = 1 ;
ORDER BY b.BOOK_ID ;


#読みたい本の削除
UPDATE BOOK_PLAN_TABLE
SET DELETE_FLAG = 1
WHERE USER_ID = 1
  AND BOOK_ID = 2
  AND DELETE_FLAG = 0 ;


#読みたい本の既読
UPDATE BOOK_PLAN_TABLE
SET READ_FLAG = 1
WHERE USER_ID = 1
  AND BOOK_ID = 2
  AND READ_FLAG = 0 ;


#読んだ本を未読へ
UPDATE BOOK_PLAN_TABLE
SET READ_FLAG = 0
WHERE USER_ID = 1
  AND BOOK_ID = 2
  AND READ_FLAG = 1 ;
#########ãEååEçEãE#########################################################################################

#å©ç¨èEã¼ãã«
CREATE TABLE USER_TABLE (
  USER_ID           INT(9)          NOT NULL PRIMARY KEY    COMMENT 'å©ç¨èED',
  USER_NAME         VARCHAR(100)    NOT NULL                COMMENT 'å©ç¨èE'
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

#æ¬ãEEãã«
CREATE TABLE BOOK_TABLE (
  BOOK_ID           INT(9)          NOT NULL PRIMARY KEY    COMMENT 'æ¬ID',
  BOOK_TITLE         VARCHAR(100)    NOT NULL                COMMENT 'æ¬ã®ã¿ã¤ãã«'
);
INSERT INTO BOOK_TABLE (BOOK_ID, BOOK_TITLE)
VALUES (1, 'ã¯ã³ããEã¹') ;
INSERT INTO BOOK_TABLE (BOOK_ID, BOOK_TITLE)
VALUES (2, 'ã¹ãã¤ãã¡ããªã¼') ;
INSERT INTO BOOK_TABLE (BOOK_ID, BOOK_TITLE)
VALUES (3, 'ããªã¼ããã¿ã¼ã¨è³¢èEEç³') ;
INSERT INTO BOOK_TABLE (BOOK_ID, BOOK_TITLE)
VALUES (4, 'Javaå¥é') ;
INSERT INTO BOOK_TABLE (BOOK_ID, BOOK_TITLE)
VALUES (5, 'springbootåèE¸') ;


#æ¬èª­äºE¶æ³ãã¼ãã«
CREATE TABLE BOOK_PLAN_TABLE (
  ID                INT(9)           NOT NULL    COMMENT 'ID',
  USER_ID           INT(9)           NOT NULL    COMMENT 'å©ç¨èED',
  BOOK_ID           INT(9)           NOT NULL    COMMENT 'æ¬ID',
  BOOK_TITLE        VARCHAR(100)     NOT NULL    COMMENT 'æ¬ã®ã¿ã¤ãã«',
  READ_FLAG         INT(1)           DEFAULT 0   COMMENT 'æ¢èª­ãã©ã°',
  DELETE_FLAG       INT(1)           DEFAULT 0   COMMENT 'åé¤ãã©ã°',
  PRIMARY KEY(ID, USER_ID, BOOK_ID)
);

#ãE¹ããã¼ã¿
INSERT INTO BOOK_PLAN_TABLE (ID, USER_ID, BOOK_ID, BOOK_TITLE)
VALUES (1, 1, 1, 'ã¯ã³ããEã¹') ;
INSERT INTO BOOK_PLAN_TABLE (ID, USER_ID, BOOK_ID, BOOK_TITLE)
VALUES (2, 1, 2, 'ã¹ãã¤ãã¡ããªã¼') ;
INSERT INTO BOOK_PLAN_TABLE (ID, USER_ID, BOOK_ID, BOOK_TITLE)
VALUES (3, 2, 1, 'ã¯ã³ããEã¹') ;
INSERT INTO BOOK_PLAN_TABLE (ID, USER_ID, BOOK_ID, BOOK_TITLE)
VALUES (4, 2, 2, 'ã¹ãã¤ãã¡ããªã¼') ;
INSERT INTO BOOK_PLAN_TABLE (ID, USER_ID, BOOK_ID, BOOK_TITLE)
VALUES (5, 2, 4, 'Javaå¥é') ;
INSERT INTO BOOK_PLAN_TABLE (ID, USER_ID, BOOK_ID, BOOK_TITLE)
VALUES (6, 3, 1, 'ã¯ã³ããEã¹') ;


#########ãEç·¨éEãE#########################################################################################
#èª­ã¿ããæ¬ã®è¿½å 
INSERT INTO BOOK_PLAN_TABLE (ID, USER_ID, BOOK_ID, BOOK_TITLE)
VALUES (10, 1, 2, 'é²æEEå·¨äºº')


#èª­ã¿ããæ¬ã®ä¸è¦§
SELECT a.USER_NAME , c.BOOK_TITLE
  FROM (USER_TABLE a INNER JOIN BOOK_PLAN_TABLE b ON b.USER_ID = a.USER_ID)
                     INNER JOIN BOOK_TABLE c ON b.BOOK_ID = c.BOOK_ID
  WHERE b.USER_ID = 2
  AND b.READ_FLAG = 0
  AND b.DELETE_FLAG = 0
 ORDER BY b.BOOK_ID ;


#æ¢èª­ããæ¬ã®ä¸è¦§
SELECT a.USER_NAME , c.BOOK_TITLE
  FROM (USER_TABLE a INNER JOIN BOOK_PLAN_TABLE b ON b.USER_ID = a.USER_ID)
                     INNER JOIN BOOK_TABLE c ON b.BOOK_ID = c.BOOK_ID
  WHERE b.USER_ID = 1
  AND b.READ_FLAG = 1
  AND b.DELETE_FLAG = 0
 ORDER BY b.BOOK_ID ;



#èª­ã¿ããæ¬ã®ç·¨éE
INSERT INTO BOOK_PLAN_TABLE (ID, USER_ID, BOOK_ID, BOOK_TITLE)
VALUES (11, 1, 2, 'é²æEEå·¨äºº')

UPDATE BOOK_PLAN_TABLE
SET BOOK_TITLE = 'å¤æ´å¾ãEã¿ã¤ãã«3',
    DELETE_FLAG = 1
WHERE USER_ID = 1
  AND BOOK_ID = 2;

/*
UPDATE BOOK_TABLE
SET c.BOOK_TITLE = 'å¤æ´å¾ãEã¿ã¤ãã«'
FROM (USER_TABLE a INNER JOIN BOOK_PLAN_TABLE b ON b.USER_ID = a.USER_ID)
                     INNER JOIN BOOK_TABLE c ON b.BOOK_ID = c.BOOK_ID
WHERE USER_ID = 1
  AND BOOK_ID = 1 ;
ORDER BY b.BOOK_ID ;
*/


#èª­ã¿ããæ¬ã®åé¤
UPDATE BOOK_PLAN_TABLE
SET DELETE_FLAG = 1
WHERE USER_ID = 1
  AND BOOK_ID = 2
  AND DELETE_FLAG = 0 ;


#èª­ã¿ããæ¬ã®æ¢èª­
UPDATE BOOK_PLAN_TABLE
SET READ_FLAG = 1
WHERE USER_ID = 1
  AND BOOK_ID = 2
  AND READ_FLAG = 0 ;


#èª­ãã æ¬ãæªèª­ã¸
UPDATE BOOK_PLAN_TABLE
SET READ_FLAG = 0
WHERE USER_ID = 1
  AND BOOK_ID = 2
  AND READ_FLAG = 1 ;
=======
--DROP TABLE book_plan_table;


#########ãEååEçEãE#########################################################################################

#å©ç¨èEã¼ãã«
CREATE TABLE USER_TABLE (
  USER_ID           INT(9)          NOT NULL PRIMARY KEY    COMMENT 'å©ç¨èED',
  USER_NAME         VARCHAR(100)    NOT NULL                COMMENT 'å©ç¨èE'
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

#æ¬ãEEãã«
CREATE TABLE BOOK_TABLE (
  BOOK_ID           INT(9)          NOT NULL PRIMARY KEY    COMMENT 'æ¬ID',
  BOOK_TITLE         VARCHAR(100)    NOT NULL                COMMENT 'æ¬ã®ã¿ã¤ãã«'
);
INSERT INTO BOOK_TABLE (BOOK_ID, BOOK_TITLE)
VALUES (1, 'ã¯ã³ããEã¹') ;
INSERT INTO BOOK_TABLE (BOOK_ID, BOOK_TITLE)
VALUES (2, 'ã¹ãã¤ãã¡ããªã¼') ;
INSERT INTO BOOK_TABLE (BOOK_ID, BOOK_TITLE)
VALUES (3, 'ããªã¼ããã¿ã¼ã¨è³¢èEEç³') ;
INSERT INTO BOOK_TABLE (BOOK_ID, BOOK_TITLE)
VALUES (4, 'Javaå¥é') ;
INSERT INTO BOOK_TABLE (BOOK_ID, BOOK_TITLE)
VALUES (5, 'springbootåèE¸') ;


#æ¬èª­äºE¶æ³ãã¼ãã«
CREATE TABLE BOOK_PLAN_TABLE (
  ID                INT(9)           NOT NULL    COMMENT 'ID',
  USER_ID           INT(9)           NOT NULL    COMMENT 'å©ç¨èED',
  BOOK_ID           INT(9)           NOT NULL    COMMENT 'æ¬ID',
  BOOK_TITLE        VARCHAR(100)     NOT NULL    COMMENT 'æ¬ã®ã¿ã¤ãã«',
  READ_FLAG         INT(1)           DEFAULT 0   COMMENT 'æ¢èª­ãã©ã°',
  DELETE_FLAG       INT(1)           DEFAULT 0   COMMENT 'åé¤ãã©ã°',
  PRIMARY KEY(ID, USER_ID, BOOK_ID)
);

#ãE¹ããã¼ã¿
INSERT INTO BOOK_PLAN_TABLE (ID, USER_ID, BOOK_ID, BOOK_TITLE)
VALUES (1, 1, 1, 'ã¯ã³ããEã¹') ;
INSERT INTO BOOK_PLAN_TABLE (ID, USER_ID, BOOK_ID, BOOK_TITLE)
VALUES (2, 1, 2, 'ã¹ãã¤ãã¡ããªã¼') ;
INSERT INTO BOOK_PLAN_TABLE (ID, USER_ID, BOOK_ID, BOOK_TITLE)
VALUES (3, 2, 1, 'ã¯ã³ããEã¹') ;
INSERT INTO BOOK_PLAN_TABLE (ID, USER_ID, BOOK_ID, BOOK_TITLE)
VALUES (4, 2, 2, 'ã¹ãã¤ãã¡ããªã¼') ;
INSERT INTO BOOK_PLAN_TABLE (ID, USER_ID, BOOK_ID, BOOK_TITLE)
VALUES (5, 2, 4, 'Javaå¥é') ;
INSERT INTO BOOK_PLAN_TABLE (ID, USER_ID, BOOK_ID, BOOK_TITLE)
VALUES (6, 3, 1, 'ã¯ã³ããEã¹') ;


#########ãEç·¨éEãE#########################################################################################
#èª­ã¿ããæ¬ã®è¿½å 
INSERT INTO BOOK_PLAN_TABLE (ID, USER_ID, BOOK_ID, BOOK_TITLE)
VALUES (10, 1, 2, 'é²æEEå·¨äºº')


#èª­ã¿ããæ¬ã®ä¸è¦§
SELECT a.USER_NAME , c.BOOK_TITLE
  FROM (USER_TABLE a INNER JOIN BOOK_PLAN_TABLE b ON b.USER_ID = a.USER_ID)
                     INNER JOIN BOOK_TABLE c ON b.BOOK_ID = c.BOOK_ID
  WHERE b.USER_ID = 2
  AND b.READ_FLAG = 0
  AND b.DELETE_FLAG = 0
 ORDER BY b.BOOK_ID ;


#æ¢èª­ããæ¬ã®ä¸è¦§
SELECT a.USER_NAME , c.BOOK_TITLE
  FROM (USER_TABLE a INNER JOIN BOOK_PLAN_TABLE b ON b.USER_ID = a.USER_ID)
                     INNER JOIN BOOK_TABLE c ON b.BOOK_ID = c.BOOK_ID
  WHERE b.USER_ID = 1
  AND b.READ_FLAG = 1
  AND b.DELETE_FLAG = 0
 ORDER BY b.BOOK_ID ;



#èª­ã¿ããæ¬ã®ç·¨éE
INSERT INTO BOOK_PLAN_TABLE (ID, USER_ID, BOOK_ID, BOOK_TITLE)
VALUES (11, 1, 2, 'é²æEEå·¨äºº')

UPDATE BOOK_PLAN_TABLE
SET BOOK_TITLE = 'å¤æ´å¾ãEã¿ã¤ãã«3',
    DELETE_FLAG = 1
WHERE USER_ID = 1
  AND BOOK_ID = 2;

/*
UPDATE BOOK_TABLE
SET c.BOOK_TITLE = 'å¤æ´å¾ãEã¿ã¤ãã«'
FROM (USER_TABLE a INNER JOIN BOOK_PLAN_TABLE b ON b.USER_ID = a.USER_ID)
                     INNER JOIN BOOK_TABLE c ON b.BOOK_ID = c.BOOK_ID
WHERE USER_ID = 1
  AND BOOK_ID = 1 ;
ORDER BY b.BOOK_ID ;
*/


#èª­ã¿ããæ¬ã®åé¤
UPDATE BOOK_PLAN_TABLE
SET DELETE_FLAG = 1
WHERE USER_ID = 1
  AND BOOK_ID = 2
  AND DELETE_FLAG = 0 ;


#èª­ã¿ããæ¬ã®æ¢èª­
UPDATE BOOK_PLAN_TABLE
SET READ_FLAG = 1
WHERE USER_ID = 1
  AND BOOK_ID = 2
  AND READ_FLAG = 0 ;


#èª­ãã æ¬ãæªèª­ã¸
UPDATE BOOK_PLAN_TABLE
SET READ_FLAG = 0
WHERE USER_ID = 1
  AND BOOK_ID = 2
  AND READ_FLAG = 1 

                 
SELECT a.USER_NAME, IFNULL(SUM(b.READ_FLAG),0)
FROM (USER_TABLE a LEFT OUTER JOIN BOOK_PLAN_TABLE b ON b.USER_ID = a.USER_ID)
LEFT OUTER JOIN BOOK_TABLE c ON b.BOOK_ID = c.BOOK_ID
GROUP BY a.USER_NAME;

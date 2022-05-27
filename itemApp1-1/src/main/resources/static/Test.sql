#���p�҃e�[�u��
CREATE TABLE USER_TABLE (
  USER_ID           INT(9)          NOT NULL PRIMARY KEY    COMMENT '���p��ID',
  USER_NAME         VARCHAR(100)    NOT NULL                COMMENT '���p�Җ�'
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


#�{�Ǘ��󋵃e�[�u��
CREATE TABLE BOOK_PLAN_TABLE2 (
  USER_ID           INT(9)           NOT NULL    COMMENT '���p��ID',
  BOOK_RECORD_NO    INT(3)        NOT NULL    COMMENT '�{�̗�����',
  READ_NAME         VARCHAR(100)     NOT NULL    COMMENT '�{�̖��O',
  READ_FLAG         INT(1)           DEFAULT 0   COMMENT '���ǃt���O',
  PRIMARY KEY(USER_ID, BOOK_RECORD_NO)
);

#�e�X�g�f�[�^
INSERT INTO BOOK_PLAN_TABLE2 (USER_ID, BOOK_RECORD_NO, READ_NAME, READ_FLAG)
VALUES (1  ,1 ,'�����s�[�X', 0) ;
INSERT INTO BOOK_PLAN_TABLE2 (USER_ID, BOOK_RECORD_NO, READ_NAME, READ_FLAG)
VALUES (1  ,2 ,'�X�p�C�t�@�~���[', 0) ;
INSERT INTO BOOK_PLAN_TABLE2 (USER_ID, BOOK_RECORD_NO, READ_NAME, READ_FLAG)
VALUES (1  ,3 ,'�n���[�|�b�^�[�ƌ��҂̐�', 1) ;
INSERT INTO BOOK_PLAN_TABLE2 (USER_ID, BOOK_RECORD_NO, READ_NAME, READ_FLAG)
VALUES (2  ,1 ,'Java����', 0) ;
INSERT INTO BOOK_PLAN_TABLE2 (USER_ID, BOOK_RECORD_NO, READ_NAME, READ_FLAG)
VALUES (2  ,2 ,'springboot�Q�l��', 0) ;
INSERT INTO BOOK_PLAN_TABLE2 (USER_ID, BOOK_RECORD_NO, READ_NAME, READ_FLAG)
VALUES (3  ,1 ,'7�̏K��', 0) ;


#�ǂ݂����{�̒ǉ�
INSERT INTO BOOK_PLAN_TABLE2 (USER_ID, BOOK_RECORD_NO, READ_NAME, READ_FLAG)
VALUES (1  ,1 ,'�ǉ��������{�̃^�C�g��', 0) ;


#�ǂ݂����{�̕ҏW
UPDATE BOOK_PLAN_TABLE2
SET READ_NAME ='�ύX���̃^�C�g��'
WHERE USER_ID = 1
  AND BOOK_RECORD_NO = 1 ;



#�ǂ݂����{�̈ꗗ
SELECT b.READ_NAME
  FROM USER_TABLE a INNER JOIN BOOK_PLAN_TABLE2 b ON b.USER_ID = a.USER_ID
  WHERE b.USER_ID = 1
  AND b.READ_FLAG = 0
 ORDER BY b.BOOK_RECORD_NO ;


#�ǂ񂾖{�̈ꗗ
SELECT b.READ_NAME
  FROM USER_TABLE a INNER JOIN BOOK_PLAN_TABLE2 b ON b.USER_ID = a.USER_ID
  WHERE b.USER_ID = 1
  AND b.READ_FLAG = 1
 ORDER BY b.BOOK_RECORD_NO ;

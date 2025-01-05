DECLARE
    V_EXIST NUMBER;
BEGIN
    SELECT COUNT(*)
      INTO V_EXIST
      FROM USER_TABLES
     WHERE TABLE_NAME = 'JOBS';
    IF V_EXIST <> 0 THEN
        EXECUTE IMMEDIATE 'DROP TABLE JOBS CASCADE CONSTRAINT PURGE';
    END IF; 

    SELECT COUNT(*)
      INTO V_EXIST
      FROM USER_SEQUENCES
     WHERE SEQUENCE_NAME = 'SEQ_JOBS';

    IF V_EXIST <> 0 THEN
       EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_JOBS'; 
    END IF;
END;
/

CREATE TABLE JOBS(
    JOB_ID NUMBER(5,0) NOT NULL,
    JOB_DESCRIPTION VARCHAR2(50) DEFAULT 'New Position - title not formalized yet' NOT NULL,
    MIN_LEVEL NUMBER(3,0) NOT NULL,
    MAX_LEVEL NUMBER(3,0) NOT NULL,
    CONSTRAINT PK_JOBS PRIMARY KEY (JOB_ID),
    CONSTRAINT CK_JOBS_MIN_LEVEL CHECK (MIN_LEVEL >= 10),
    CONSTRAINT CK_JOBS_MAX_LEVEL CHECK (MAX_LEVEL <= 250)
);

CREATE SEQUENCE SEQ_JOBS MINVALUE 1 MAXVALUE 99999;

CREATE OR REPLACE TRIGGER TRI_JOBS_AUTO_INCREMENT
BEFORE INSERT ON JOBS
FOR EACH ROW
BEGIN
    IF :NEW.JOB_ID IS NULL THEN
        SELECT SEQ_JOBS.NEXTVAL 
            INTO :NEW.JOB_ID 
          FROM DUAL;
    END IF;
END;
/

INSERT INTO JOBS VALUES (NULL, 'New Hire - Job not specified', 10, 10);
INSERT INTO JOBS VALUES (NULL, 'Chief Executive Officer', 200, 250);
INSERT INTO JOBS VALUES (NULL, 'Business Operations Manager', 175, 225);
INSERT INTO JOBS VALUES (NULL, 'Chief Financial Officier', 175, 250);
INSERT INTO JOBS VALUES (NULL, 'Publisher', 150, 250);
INSERT INTO JOBS VALUES (NULL, 'Managing Editor', 140, 225);
INSERT INTO JOBS VALUES (NULL, 'Marketing Manager', 120, 200);
INSERT INTO JOBS VALUES (NULL, 'Public Relations Manager', 100, 175);
INSERT INTO JOBS VALUES (NULL, 'Acquisitions Manager', 75, 175);
INSERT INTO JOBS VALUES (NULL, 'Productions Manager', 75, 165);
INSERT INTO JOBS VALUES (NULL, 'Operations Manager', 75, 150);
INSERT INTO JOBS VALUES (NULL, 'Editor', 25, 100);
INSERT INTO JOBS VALUES (NULL, 'Sales Representative', 25, 100);
INSERT INTO JOBS VALUES (NULL, 'Designer', 25, 100);
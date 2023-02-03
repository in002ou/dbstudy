DROP TABLE PROCEEDING;
DROP TABLE PROJECT;
DROP TABLE EMPLOYEE;
DROP TABLE DEPARTMENT;

CREATE TABLE DEPARTMENT (
    DEPT_NO        VARCHAR2(15 BYTE)  NOT NULL,
    DEPT_NAME      VARCHAR2(30 BYTE)  NULL,
    DEPT_LOCATION  VARCHAR2(50 BYTE)  NULL,
    
    CONSTRAINT PK_DEPT PRIMARY KEY(DEPT_NO)
);

CREATE TABLE EMPLOYEE (
    EMP_NO     NUMBER             NOT NULL,
    DEPT_NO    VARCHAR2(15 BYTE)  NULL,
    POSITION   CHAR(10 BYTE)      NULL,
    NAME       VARCHAR2(15 BYTE)  NULL,
    HIRE_DATE  DATE               NULL,
    SALARY     NUMBER             NULL,
    
    CONSTRAINT PK_EMP      PRIMARY KEY(EMP_NO),
    CONSTRAINT FK_EMP_DEPT FOREIGN KEY(DEPT_NO) REFERENCES DEPARTMENT(DEPT_NO) 
);

CREATE TABLE PROJECT (
    PJT_NO      NUMBER             NOT NULL,
    PJT_NAME    VARCHAR2(30 BYTE)  NULL,
    BEGIN_DATE  DATE               NULL,
    END_DATE    DATE               NULL,
    
    CONSTRAINT PK_PJT PRIMARY KEY(PJT_NO)
);

CREATE TABLE PROCEEDING (
    PCD_NO     NUMBER  NOT NULL,
    EMP_NO     NUMBER  NULL,
    PJT_NO     NUMBER  NULL,
    PJT_STATE  NUMBER  NOT NULL,
    
    CONSTRAINT PK_PCD     PRIMARY KEY(PCD_NO),
    CONSTRAINT FK_PCD_EMP FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO),
    CONSTRAINT FK_PCD_PJT FOREIGN KEY(PJT_NO) REFERENCES PROJECT(PJT_NO)
);
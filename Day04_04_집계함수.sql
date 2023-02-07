-- 샘플 데이터
DROP TABLE SAMPLE_TBL;
CREATE TABLE SAMPLE_TBL (
    NAME VARCHAR2(10 BYTE),
    KOR  NUMBER(3),
    ENG  NUMBER(3),
    MAT  NUMBER(3)
);

INSERT INTO SAMPLE_TBL(NAME, KOR, ENG, MAT) VALUES(NULL, 100, 100, 100);
INSERT INTO SAMPLE_TBL(NAME, KOR, ENG, MAT) VALUES('정숙', NULL, 90, 90);
INSERT INTO SAMPLE_TBL(NAME, KOR, ENG, MAT) VALUES('미희', 80, NULL, 80);
INSERT INTO SAMPLE_TBL(NAME, KOR, ENG, MAT) VALUES('철수', 70, 70, NULL);
COMMIT;

/*
    집계 함수(그룹별 통계)
    1. 통계(합계, 평균, 개수, 최대, 최소 등)
    2. GROUP BY절에서 주로 사용.
    3. 종류
        1) 합계 : SUM(칼럼)
        2) 평균 : AVG(칼럼)
        3) 개수 : COUNT(칼럼)
        4) 최대 : MAX(칼럼)
        5) 최소 : MIN(칼럼)
    4. NULL 값은 연산에서 제외.
*/

/*
     이름 국어  영어 수학 합계
     NULL, 100, 100, 100  300
    '정숙', NULL, 90, 90  180
    '미희', 80, NULL, 80  160
    '철수', 70, 70, NULL  140
    --------------------------
    합계   250  260  270 
*/
SELECT
       SUM(KOR)
     , SUM(ENG)
     , SUM(MAT)
 --    , SUM(KOR, ENG, MAT)   -- SUM 함수의 인수는 1개만 가능.
  FROM SAMPLE_TBL;

-- 평균
SELECT
       AVG(NVL(ENG, 0))     -- NULL이 들어오면 계산에서 제외 하기에 4가 아닌 3으로 나눠졌다. 따라서 NULL을 0으로 표기하여 계산.
     , AVG(NVL(KOR, 0))
     , AVG(NVL(MAT, 0))
  FROM
       SAMPLE_TBL;

-- 개수
SELECT
       COUNT(KOR)   -- 국어 시험에 응시한 인원 수
     , COUNT(ENG)   -- 영어 시험에 응시한 인원 수
     , COUNT(MAT)   -- 수학 시험에 응시한 인원 수
     , COUNT(*)     -- 모든 칼럼을 참조해서 어느 한 칼럼이라도 값을 가지고 있으면 개수에 포함
  FROM
       SAMPLE_TBL;

-- 개수 정리
-- 테이블에 포함된 데이터(행, ROW)의 개수는 COUNT(*)로 구현.
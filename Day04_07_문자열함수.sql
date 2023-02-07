-- 문자열 함수


-- 1. 대소문자 변환 함수
SELECT
       UPPER(EMAIL)     -- 대문자
     , LOWER(EMAIL)     -- 소문자
     , INITCAP(EMAIL)   -- 첫 자 대문자, 나머지 소문자
  FROM
       EMPLOYEES;


-- 글자 수(바이트 수) 반환 함수
SELECT
       LENGTH('HELLO')  -- 글자 수 : 5
     , LENGTH('안녕')   -- 글자 수 : 2
     , LENGTHB('HELLO') -- 바이트 수 : 5
     , LENGTHB('안녕')  -- 바이트 수 : 6
  FROM
       DUAL;


-- 3. 문자열 연결 함수/연산자
--    1) 함수 : CONCAT(A, B) 주의! 인수가 2개만 전달 가능
--    2) 연산자 : || 주의! OR 연산 X 오라클 전용!!
SELECT
       CONCAT(FIRST_NAME, LAST_NAME)
     , CONCAT(CONCAT(FIRST_NAME, ' '), LAST_NAME)
     , FIRST_NAME || ' ' || LAST_NAME  
  FROM
       EMPLOYEES;
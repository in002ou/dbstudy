/*
    테이블
    1. 데이터베이스의 가장 대표적인 객체
    2. 데이터를 보관하는 객체
    3. 표 형식으로 데이터를 보관
        1) 열 : column, 속성(attribute), 필드(field)
        2) 행 : row,    개체(entity),    레코드(record)
*/

/*
    오라클의 데이터 타입
    1. CHAR(size)    : 고정 길이 문자 타입(size : 1 ~ 2000바이트) -> 데이터 길이가 고정 되어있을 때 사용하면 좋다 ex. 주민등록번호
    2. VARCHAR2(size) : 가변 길이 문자 타입(size : 1 ~ 4000바이트)
    3. DATE          : 날짜/시간 타입
    4. TIMESTAMP     : 날짜/시간 타입(조금 더 정밀)
    5. NUMBER(p,s)   : 정밀도(p), 스케일(s)로 표현하는 숫자 타입
        1) 정밀도 : 정수부와 소수부를 모두 포함하는 전체 유효 숫자가 몇 개인가?
        2) 스케일 : 소수부의 전체 유효 숫자가 몇 개인가?
        ex) 
            (1) NUMBER      : 최대 38자리 숫자를 표현(22바이트)
            (2) NUMBER(3)   : 정수부가 최대 3자인 숫자(0 ~ 999)
            (3) NUMBER(5,2) : 전체 5자리, 소수부 2자리 숫자(123.45)
            (4) NUMBER(2,2) : 1 미만의 소수부 2자리인 실수(0.15) -> 0은 유효 숫자로 취급하지 않는다. 즉, 정수부와 소수부가 같다면 실수를 얘기.
*/

/*
    제약조건(Constraint)
    1. 널
        1) NULL 또는 생략
        2) NOT NULL
    2. 중복 데이터 방지
        UNIQUE
    3. 값의 제한
        CHECK
    4. pk (primary key 기본키) 특성으로 유니크와 낫 널을 자동으로 부여 받는다. 개체 무결성
*/



-- 예시 테이블
DROP TABLE PRODUCT;
CREATE TABLE PRODUCT(
    CODE            VARCHAR2(2 BYTE)  NOT NULL UNIQUE,  --NOT NULL 값이 꼭 들어가야 한다를 표시.
    MODEL           VARCHAR2(10 BYTE) NULL,          --대문자로 적어도 소문자로 적어도 상관 없으나, 통일해서 적어야 한다.
    CATEGORY        VARCHAR2(5 BYTE)  CHECK(CATEGORY = 'MAIN' OR CATEGORY = 'SUB'),     -- 대체문법 CHECK(CATEGORY IN('MAIN', 'SUB')) 추천
    PRICE           NUMBER            CHECK(PRICE >= 0),                                
    AMOUNT          NUMBER(2)         CHECK(AMOUNT >=0 AND AMOUNT <= 100),              -- CHECK(AMOUNT BETWEEN 0 AND 100) 추천
    MANUFACTURED    DATE
);


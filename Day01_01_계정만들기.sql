--  단일행 주석(싱글 코멘트)
/*
    다중 행 주석(멀티 코멘트)
*/
/*
    기본 원칙
    1. SYS, SYSTEM 계정은 관리 계정이므로 해당 계정에서 작업하지 않는다.
    2. 새로운 계정을 만들고, 해당 계정으로 접속해서 작업을 수행.
    3. 새로운 계정을 만드는 작업-> SYS, SYSTEM 계정에서 처리.
    4. 새로운 계정 만드는 방법
        1) DROP USER 계정이름 CASCADE   : 기존에 생성된 계정이 있다면 삭제. CASCADE는 계정이 가진 데이터도 함께 삭제 선택 옵션
        2) CREATE USER 계정이름 IDENTIFIED BY 비밀번호  : 계정 만들기 
        3) GRANT 권한 TO 계정   : 생성된 계정에 권한 부여(CONNECT(접속만), RESOCRE(각종 데이터베이스 사용 일부 불가), DBA(데이터베이스 관리자)
*/

/*
    쿼리문 실행 방법
    1. 선택 쿼리 실행 : Ctrl + Enter  (다중 행 블록 후 실행, 또는 단일 행은 커서만 위치해 둔 후 실행)
    2. 모든 쿼리 실행 : F5 (새로 고침 아님 주의, 오류가 있어도 끝까지 실행)
*/
DROP USER SCOTT CASCADE;DROP USER GDJ61 CASCADE;
CREATE USER GDJ61 IDENTIFIED BY 1111;
GRANT DBA TO GDJ61;

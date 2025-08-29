/*
 * 시퀀스 SEQUENCE
 * 자동으로 번호를 발생시켜주는 역할을 하는 객체
 * 정수값을 자동으로 순차증가시켜 생성 해줌
 * 
 * 회원번호 , 사원번호, 게시글번호 , 예약번호 , 주문번호 등등 채번(고유한순서를 매김) 할 때 주로 사용
 * 
 * 1. 시퀀스 객체 생성 구문
 * 객체 생성 하려면 CREAT 
 * [표현법]
 * CREAT SEQUENCE 시퀀스 명
 * START WITH 시작 숫자-> 시작값을 지정 하는 옵션
 * INCREMENT BY 증가값 -> 값을 증가시킬 때 몇 씩 증가할건지 지정하는 옵션
 * MAXVALUE 최대깂 -> 최대값 지정 옵션
 * MINVALUE 최소값 -> 최소값 지정 옵션
 * CYCLE/ NOCYCLE -> 순환 여부 지정
 * --------여기까지는 생략 가능
 * CACHE 바이트 크기 / NOCAGHE -> 캐시메모리 쓸건지 말건지
 * 								기본값은 20BYTE
 * CACHE : 미리 발생할 값을 생성해서 저장을 해둘건지 말건지 여부 지정
 * 값이 필요할 때 마다 매 번 새롭게 값을 생성해내는것 보다는
 * 캐시공간에 미리 생성된 값들을 가져다 쓰는것이 훤씬 속도 적인 측면에서 이득이 있음
 * 단 .. 접속이 끊기고 나서 재접속 후 기존 생성된 값들이 다 날아가고 있음
 * 
 * 접두사
 * 테이블명 :TB_
 * 뷰: vw_
 * 시퀀스 : SEQ_
 * 트리거 : TRG_
 */
SELECT
	    *
  FROM
        EMPLOYEE;

CREATE SEQUENCE SEQ_EMPNOALTER 
START WITH 224
NOCACHE;
--여기까지 시작값이 224인 시퀀스를 만든거임

/*시퀀스를 사용하는방법
 * 시퀀스명.CURRVAL : 현재 시퀀스의 값(마지막을 성공적으로 만들어진 NEXTVAL값)
 * 					시퀀스값을 증가시킨 뒤 증가된 시퀀스의 값
 * 					기존 시퀀스 값에서 INCREMENT BY 값만큼 증가한 값
 * 					(시퀀스 명.CURRVAL + INCREMUNT BY값 (기본값1))
 * 시퀀스 생성 시 첫 NEXTVAL은 STARTWITH로 지정한 시작값으로 발생
 * 
 */


SELECT SEQ_EMPNO.CURRVAL FROM DUAL;
--NEXTVAL를 한번이라도 수행하지 않으면 CRUUVAL을 사용할 수 없음
--CURRVAL은 마지막에 성공적으로 만들어진 NWXTVAL를 보여주는 임시 값

SELECT SEQ_EMPNO.NEXTVAL FROM DUAL;

SELECT * FROM USER_SEQUENCES;
--LAST_NUMBER: 지금 NEXTVAL하면 나오는 값
--수정 : ALTER --> START WITH는 변경 불가능 바꾸고 싶으면 DROP하고 다시 CREATE
--삭제 : DROP



CREATE SEQUENCE SEQ_EIDALTER  
 START WITH 224;
--사원을 추가해야할 때마다 수행하는 INSERT
INSERT 
  INTO 
       EMPLOYEE
       (EMP_ID
      , EMP_NAME
      , EMP_NO
      , JOB_CODE
      , SAL_LEVEL
      )
VALUES 
       (SEQ_EID.NEXTVAL
      , '유재석'
      , '22342423=2342'
      , '33'
      , '52'
        );
SELECT* FROM EMPLOYEE;   
--------------------------
/*
 * DCL : DATA CONTROL LANGUAGE
 *        데이터 제어     언어
 * 
 * 
 *계정에게 시스템 권한 또는 객체 접근 권한을 부여(GRANT) 하거나 회수(REVOKE)하는 언어
 *권한 부여(GRANT)
 *시스템 권한 : DB에 접근하는 권한 , 객체를 생성할 수 있는 권한
 *객체 접근 권한 : 특정 객체들에 접근해서 조작할 수 있는 권한
 */
--객체 접근권한 부여하는 법
/*
 * [표현법]
 * GRANT 권한종휴 (SELECT, INSERT ,UPDATE , DELETE) ON 객체명 (테이블명) TO 계정명;
 * 시스템권한 종류
 * CREATE SESSION : 계정에 접속할 수 있는 권한
 * CREATE TABLE : 테이블을 생성할 수 있는 권한
 * CREATE VIEW : 뷰를 생성할 수 있는 권한
 * CREATE SEQUENCE : 시퀀스를 생성할 수 있는 권한
 * GRANT 권한 1,권한 2....
 * ROLE
 * 특정 권한들을 하나의 집합으로 모아놓은 것
 * CONNECT, RESOURCE
 * 권환 회수 REVOKE
 * [표현법]
 * REVOKE 권한1, 권한2...... FROM 사용자명;
 */
SELECT
       *
  FROM 
       ROLE_SYS_PRIVS;
 WHERE
       
    


























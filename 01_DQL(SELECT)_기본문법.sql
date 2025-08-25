--주석 적는법 
/*다중 주석 자바와 같음
*/
/*<SELECT>
 * 데이터를 조회하거나 검색할 때 사용하는 명령어
 * Table은 데이터가 들어가는 푶 엑셀의 시트같은 것
 * <표현법>
 * SELECT 조회하고자 하는 컬럼명을 입력 맨위에 머리줄에 있는게 컬럼명
 * SELECT문의 결과는 행 단위로 조회가 된다.
 * ,조회하고자 하는 컬럼명
 * ,조회하고자 하는 컬럼 명
 * FROM절이 옴 마지막에 작성 
 * 테이블 명을 작성; 
 * -ResultSet : 조회된 행들의 집합 // SELECT문을 통해 조회된 데이터 결과물을 의미함
 */ 
--EMPLOYEE테이블에서 모든 컬럼을 전부 다 조회하겠다.
-- * : 모든 컬럼을 의미 이거를 사용하면 안됨 이유는 성능의 영향을 끼침 때문에 모든 컬럼명을 작성해야 함.
 SELECT * FROM EMPLOYEE;--이 방법은 사용해서는 안됨
--사원명과 이메일이랑 급여를 조회하겠다.
 SELECT
 	    EMP_NAME --조회할 행  작성
 	  , EMAIL
 	  , SALARY
 	FROM
 		EMPLOYEE; --테이블 명
 		--실행은 ctrl + enter 
SELECT emp_name, email, salary FROM employee; --이렇게 작성해도 되지만 위의 방법을 권장 함.
  --대소문자를 고려 안함
--갈색은 키워드고 키워드는 왼쪽 
--오른쪽은 식별자
--정리 : 명령어,키워드,테이블명 ,컬럼명은 대/소문자를 가리지 않음
--소문자로 작성을 해도 잘 동작을 하지만 대문자로 작성하는 습관을 들이는것이 좋음

--실습문제 
--1.JOB테이블에서 JOB_CODE,JOB_NAME컬럼을 조회하세요.
--2.JOB테이블에서 직급명만 조회되게 SELECT문을 작성해보세요.
--3.DEPARTMENT테이블에서 DEPT_ID<DEPT_TITLE,LOCAITION_ID컬럼을 조회하세요.
--4.EMPLOYEE테이블에서 EMP_NAME,EMAIL,PHONE컬럼을 조회하세요.
--5.EMPLOYEE테이블에서 HIRE_DATE, EMP_NAME,SALARY컬럼을 조회하세요.
SELECT
	   JOB_CODE
	 , JOB_NAME
  FROM 
       JOB;

SELECT 
	   JOB_NAME
  FROM 
       JOB;
SELECT 
       DEPT_ID
     , DEPT_TITLE
     , LOCATION_ID
  FROM 
	   DEPARTMENT;
	   
SELECT
	   EMP_NAME
	 , EMAIL
	 , PHONE
  FROM 
	   EMPLOYEE;
SELECT 
 	   HIRE_DATE
 	 , EMP_NAME
 	 , SALARY
  FROM 
       EMPLOYEE;
----------------------------------------------------------------------------
/*컬럼의 조회된 값을 통한 산술연산을 해보자!
 * 컬럼들을 나열해서 조회를 할 때 산술연산(+,-,*,/)을 기술해서 결과를 조회할 수 있음
 */
--EMPLOYEE테이블로부터 직원명, 월급
SELECT
	   EMP_NAME
	 , SALARY
	 , SALARY * 12 + 80000000
  FROM
       EMPLOYEE;
--연봉을 알고싶다. 셀렉절안에 기술 가능
--컬럼값이 바뀌는게 아님 그냥 보여줄 뿐 셀렉트는 조회만 하는 것이기 때문에
--EMPLOYEE테이블로부터 사원명 , 월급 , 보너스
SELECT
       EMP_NAME
     , SALARY
     , BONUS
     , ((SALARY * BONUS + BONUS) * 12)
 FROM 
 	   EMPLOYEE;
--보너스가 없으면 NULL값이 들어옴 문제 : 보너스를 포함한 연봉을 같이 조회한다.((월급*보너스 + 월급) *12)
--산술연산 과정에서 NULL값이 존재할 경우 산술연산의 결과도 NULL값이 된다.

SELECT
       EMP_NAME
     , HIRE_DATE
  FROM
       EMPLOYEE;
--오라클에서는 날짜를 저장하는형식을 DATE로  저장함 => 년, 월, 일, 시, 분, 초 
--DATE타입 끼리의 연산을 해보자 날짜끼리의 연산 ->근무 일수 (오늘날짜 - 입사일)
--현재 지금 시점의 날짜값 : SYSDATE
SELECT
       SYSDATE - HIRE_DATE --결과가 일단위로 나옴 지저분하게 나온 이유는 시,분,초 까지 계산해서 그럼
 FROM
       EMPLOYEE;
---------------------------------------------------------------------------
--컬럼명에 별칭을 부여하기
--컬럼명에 별칭을 부여해서 호출할 수 있음.
--[표현법]
/*1. 컬럼명 AS 별칭 , 컬럼명 AS "별칭" , 컬러명 "별칭" , 컬럼명 별칭
 * ""다는 경우 SALARY 월단위 급여다 그럼 사용
 * 별칭에 특수문자나 또는 공백문자가 포함될 경우 반드시 ""로 묶어주어야 함.
 */
SELECT
	   EMP_NAME AS 사원명
	 , SALARY AS "급여(월)"
  FROM
       EMPLOYEE;
-------------------------------------------------------------------------------
/*<리터럴>
 * 임의로 지정한 문자열('')을 SELECT절에 기술하게 되면
 * ResultSet을 반환받을 때 데이터를 붙여서 조회할 수 있음
 */
--EMPLOYEE테이블로부터 사원명 , 급여
SELECT 
       EMP_NAME
     , SALARY
     , '원' 단위
  FROM 
       EMPLOYEE;
--조회할 때만 내가 원이라고 붙여서 보고 싶다 ''사용한다.
---------------------------------------------------------------------------------
/*DISTINCT
 * 조회하고자 하는 컬럼 앞에 작성하여 중복된값을 딱 한번만 조회하는 용도
 * 주의) SELECT에 DISTINCT구문은 한 개만 사용이 가능
 */
SELECT
       DISTINCT DEPT_CODE
  FROM 
       EMPLOYEE;
----------------------------------------------------------------------------------
/*SELECT문을 이용해서 조회를 할 때 조건을 부여하는 방법!
 * WHERE 절 SELECT와 같이 다님
 * 조회하고자 하는 테이블에 특정 조건을 제시해서
 * 조건에 만족하는 행만 조회하고자 할 떄 기술하는 구문
 * 
 * 
 * 
 * [표현법]
 * SELECT
 *        컬럼명
 *      , 컬럼명
 * 	    , 컬럼명
 *   FROM
 *        테이블 명
 *  WHERE 
 *        조건식;
 * -조건식에는  다양한 연산자들을 사용할 수 있음
 * <비교연산자>
 * <,>,<=,>=//대소 비교
 * <동등비교>  
 * = , !=
 */
--EMPLOYEE테이블로부터 사원들의 사원명 , 급여 조회 300만 이상의 사람들을 조회하고 싶다.
--행단위 RESULTSET은 SELECT를 통해 조회하는 결과들의 집합을 말함
--WHERE를 통해 방대한 데이터를 SELECT하는 것이 아니라 내가 조회하고 싶은 특정 데이터를 뽑고 싶을때 사용
SELECT 
       EMP_NAME
     , SALARY
  FROM 
       EMPLOYEE
 WHERE
       SALARY >= 3000000;

--EMPLOYEE 테이블로부터 부소코드가 D9인 사원들의 사원명 , 부서코드 조회
--D9는 문자열이어서''로 묶어줌
SELECT
       EMP_NAME
     , DEPT_CODE
  FROM
       EMPLOYEE
 WHERE
       DEPT_CODE = 'D9';
   
-------------------------------
--EMPLOYEE테이블로부터 부서코드가 D9가아닌 사원들의 사원명 , 전화번호 조회
SELECT
       EMP_NAME
     , PHONE
  FROM 
       EMPLOYEE
 WHERE
     --  DEPT_CODE != 'D9';
     --  DEPT_CODE ^- 'D9';
       DEPT_CODE <> 'D9';
--실행순서가 중요함 1.FROM -> 2. WHERE -> 3. SELECT 합리적인 실행순서 기억해 두자
/*실습
EMPLOYEE테이블에서 급여가 250만원 이상인 사원들의 이름 , 급여, 입사일 조회
EMPLOYEE테이블에서 부서코드가 D6인 사원들의 이름, 급여 , 보너스 조회
EMPLOYEE테이블에서 현재 재직중인 사원 (ENT-YN =='N')들의 이름 , 입사일 조회
EMPLOYEE테이블에서 연봉이 5000이상인 사원들의 이름 연봉 조회
단 연봉컬럼은 별칭으로 연봉으로 조회되게 할것
*/
SELECT
       EMP_NAME
     , SALARY
     , HIRE_DATE
  FROM 
       EMPLOYEE
 WHERE
       SALARY>= 2500000;
SELECT
       EMP_NAME
     , SALARY
     , BONUS
     , DEPT_CODE
  FROM 
       EMPLOYEE
  WHERE
       DEPT_CODE = 'D6';

SELECT 
       HIRE_DATE
     , EMP_NAME
  FROM   
       EMPLOYEE
 WHERE
       ENT_YN = 'N';
       
 SELECT
        EMP_NAME
      , (SALARY * 12) AS "연봉"
  FROM 
        EMPLOYEE 
 WHERE 
       (SALARY * 12) >= 50000000
---------------------------------------------------
/*<논리연산자>
 * 여러개의 조건을 엮을 때 사용
 * AND(이면서~~~, 그리고) / OR(~~~거나 , 또는)
 */     
--EMPLOYEE부서코드가 'D9'면서 급여가 500만원 이하인 사원들의
--사원명, 부서코드 , 급여조회
       
       
SELECT
       EMP_NAME
     , DEPT_CODE
     , SALARY
  FROM
       EMPLOYEE
 WHERE
       DEPT_CODE = 'D9'
   AND
       SALARY <= 5000000;
 
--EMPLOYEE테이블로부터 부서코드가 'D6'이거나 급여가 300만원 이상인 사원들의
-- 이름, 부서코드 , 급여조회
SELECT
       EMP_NAME
     , DEPT_CODE
     , SALARY
  FROM 
       EMPLOYEE
 WHERE
       DEPT_CODE = 'D6'
    OR
       SALARY >= 3000000;
 
--EMPLOYEE테이블로부터 급여컬럼의 값이 350만원 이상이고 500만원 이하인 사원드릐 
 
 SELECT
        EMP_ID
      , EMP_NAME
      , SALARY
  FROM 
        EMPLOYEE
 WHERE
       SALARY>=3500000
   AND
       SALARY<= 5000000;
 
---------------------------------------------
 /*BETWEEN AND
  * 몇 이상 몇 이하인 범위에 대해서 조건을 제시할 때 사용
  */
 --EMPLOYEE테이블에서 급여가 350이상 500이하인 사원들의 사번 이름 직급코드(JOB_CODE)
SELECT
       EMP_ID
     , EMP_NAME
     , JOB_CODE
  FROM 
       EMPLOYEE
 WHERE
       SALARY BETWEEN 3500000 AND 5000000;
--EMPLOYEE테이블에서 급여가 350미만이거나 500을 초과하는 사원들의 사번 , 이름, 직급코드
SELECT
       EMP_ID
     , EMP_NAME
     , JOB_CODE
  FROM
       EMPLOYEE
 WHERE
       SALARY NOT BETWEEN 3500000 AND 5000000;
-->오라클에서 NOT는 자바의 !와 동일한 의미
--BETWEEN AND 연산자는 DATE형식에도 사용가능
--입사일이 '90/01/01'~ '03/01/01'인 사원들의 이름 입사일 조회
SELECT  
       EMP_NAME
     , HIRE_DATE
  FROM
       EMPLOYEE
 WHERE
       HIRE_DATE BETWEEN '90/01/01' AND '03/01/01';

----------------------------------------------------------------
/*<LIKE'특정 패턴'>
 * 비교하려는 컬럼에 값이 내가 지정한 특정 패턴에 만족할 경우 조회
 * [표현법]
 * 비교대상컬럼 LIKE '특정패턴'
 * 특정패턴 --> 와일드카드
 * '%', '_'두 가지를 가지고 패턴을 만들 수 있음
 * '%' : 0글자 이상
 *       비교대상컬럼 LIKE 'A%' => 'A'로 시작하는 것만 조회 -> APPLE , ADD 등 조회
 *       비교대상컬럼 LIKE '%A' => 'A'로 끝나는 것만 조회 -> BANANA, GOLILA 등 조회
 *       비교대상컬럼 LIKE '%A%' => 'A'가 포함되는것을 모두 조회
 * 		 나머지가 상관없을 때 사용
 * '_' : 1글자
 * 비교대상컬럼 LIKE '_A' => 'A'앞에 무조건 1글자가 있어야만 패턴에 만족
 * 비교대상컬럼 LIKE '__A' => 'A'앞에 무조건 2글자가 있어야만 패턴에 만족
 * EMPLOYEE테이블로부터 모든 사원의 이름, 전화번호 조회
 * 
 */
SELECT 
       EMP_NAME
     , PHONE
  FROM
       EMPLOYEE
----------------------------------------------------------------
       
       
       
SELECT
       EMP_NAME
     , PHONE
 FROM 
       EMPLOYEE
 WHERE 
       EMP_NAME LIKE '박%';
--EMPLOYEE 테이블에서 이름에 '준' 이라는 글자가 포함된 사원들의 사원명, 폰번호
SELECT
       EMP_NAME
     , PHONE
  FROM
       EMPLOYEE
 WHERE
       EMP_NAME LIKE '%준%';
--이름의 두 번째 글자가 '승'인 사원들의 사원명 , 핸드폰 번호


SELECT
       EMP_NAME
     , PHONE
  FROM 
       EMPLOYEE
 WHERE
       --EMP_NAME LIKE '_승_';
       EMP_NAME NOT LIKE '_승_';
---------------------------------------------------------------
/*실습
 * 
 */

SELECT
       EMP_NAME
     , PHONE
  FROM
       EMPLOYEE
 WHERE
       PHONE LIKE '___9%';
SELECT 
       EMP_NAME
     , PHONE
  FROM 
       EMPLOYEE
 WHERE
       EMP_NAME LIKE '%영';
SELECT 
       EMP_NAME
     , PHONE
  FROM 
       EMPLOYEE
 WHERE
       PHONE NOT LIKE '010%';
SELECT
       DEPT_TITLE
  FROM 
       DEPARTMENT
 WHERE
       DEPT_TITLE LIKE'%해외영업%';
----------------------------------------------------

/*IS NULL
 * [표현법]
 * 비교대상컬럼 IS NULL : 컬럼값이 NULL일경우
 * 비교대상컬럼 IS NOT NULL : 컬럼값이 NULL이 아닐 경우
 */
SELECT
       EMP_NAME
     , BONUS
  FROM
       EMPLOYEE;
--EMPLOYEE테이블로부터 보너스를 받지 않는(보너스가 없는) 사원들의 사원명 , 보너스 조회

SELECT
       EMP_NAME
     , BONUS
  FROM
       EMPLOYEE
  WHERE
       --BONUS IS NULL;
  	   BONUS IS NOT NULL;
----------------------------------------------------
/*연결 연산자 ||
 * 여러개의 컬럼 값들을 마치 하나의 컬럼인 것처럼 연결 시켜주는 연산자
 * 컬럼값 또는 리터럴(문자열) 을 전부 다 합칠 수 있음
 *System.out.println(num+"sdfsd")
 *
 * 
 */
SELECT
       EMP_ID || EMP_NAME
  FROM 
       EMPLOYEE;
SELECT EMP_ID || '변 사원' || EMP_NAME || '남의 핸드폰 번호는'||
	   PHONE || '입니다.' AS "사원의 정보"
  FROM
       EMPLOYEE;
-----------------------------------------
/*IN
 * 비교대상 컬럼값에 내가 제시한 목록들 중에 일치하는 값이 있는지 확인하는것
 *  
 */
--EMPLOYEE 테이블로부터 부서코드가 D6이거나 D8이거나 D5인 사원들의 사원명 , 부서코드 조회

SELECT
       EMP_NAME
     , DEPT_CODE
  FROM
       EMPLOYEE
 WHERE
       DEPT_CODE IN ('D6', 'D8', 'D5');
 /*
       DEPT_CODE = 'D6'
    OR
       DEPT_CODE = 'D8'
    OR
       DEPT_CODE = 'D5';
*/
---------------------------------------------------------
/*<연산자 우선순위>
 * 
 * 1. ()
 * 2. 산술연산자(+,-,*,/)
 * 3. 연결연산자(AND,OR)
 * 4. 비교연산자( <,>,<=,>=)
 * 5. IS NULL, LIKE , IN 왼쪽부터 시작
 * 6. BETWEEN AND
 * 7. NOT
 * 8. AND
 * 9. OR
 *  
 * 
 */
---------------------------------------------------------------------------
/*★★★★★★★★★★★★★★★★ ORDER BY절★★★★★★★★★★★★★★★★★★★★
 *정렬 용도
 *SELECT 문의 가장 마지막에 작성하는 문법+ 실행 순서 또한 가장 마지막
 *ORDER BY절을 작성하지 않으면 RESULTSET은 정렬이 안된 상태 
 *
 *SELECT
 *       컬럼명
 *   FROM
 *        테이블 명
 *  WHERE
 *        조건식 (생략가능) 조건이 필요 없으면 굳이 필요가 없음
 *  ORDER
 *     BY 
 *        [정렬기준으로 삼고싶은 컬럼명/ 별칭/ 컬럼순번]
 *        [ASC/DESC]
 *        [NULLS FIRST / NULLS LAST] (생략가능)
 * ASC = > 오름차순 정렬(기본값)
 * DESC => 내림차순 정렬
 * NULLS FIRST : 컬럼값이 NULL일 경우 조회결과의 위쪽에 배치(내림차순일 경우 기본값)
 * NULLS LAST: 컬럼값이 NULL일 경우 조회결과의 아래쪽에 배치 (오름차순일 경우 기본값)
 */

SELECT
       EMP_ID 
     , EMP_NAME
     , BONUS     
  FROM
       EMPLOYEE
 ORDER
    BY  
       BONUS , EMP_ID, EMP_NAME; 
      -- BONUS;
     -- BONUS DESC; 내림차순 정렬 시 기본적으로 NULL FIRST
      -- BONUS DESC NULLS LAST; 
--첫번 쨰로 제시한 정렬기준의 컬럼값이 동일할 경우 다음 정렬기준을 명시할 수 있음
--오름차순 하며 언어를예로 들자면 1번은 무조건 영어가 먼저 온다



----------------------------------------------------------------
--별칭은 조건문에서는 못쓴다. 이유는 실행순서이기 때문에 FROM 다음 WHERE절이 오기 때문에

SELECT 
       EMP_NAME
     , SALARY *12 AS "연봉"
  FROM
       EMPLOYEE
 WHERE  
       SALARY*12 > 40000000
 ORDER
    BY
       2;
       --연봉; 별칭 사용가능
        --최악의 방법 권장하지 않는 방법(비추천) 컬럼의 순서를 나타낸것

--18버전임 




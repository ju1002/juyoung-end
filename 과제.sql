SELECT--사번, 사원명 ,급여 ,부서명 ,직급명
       *
  FROM
       JOB;--JOBCODE(사번), JOB_NAME(직급명)
SELECT
       *
  FROM
       DEPARTMENT; --DEPTID, DEPT_TITLE(부서명), DEPT_ID(사번)
SELECT
        *
  FROM 
       EMPLOYEE; --JOBCODE,EMP_NAME(사원명),SALARY(급여),JOB_CODE(사번)
SELECT
		E.JOB_CODE
	  ,	SALARY
	  , EMP_NAME
	  , DEPT_TITLE
	  , JOB_NAME
  FROM 
        EMPLOYEE E 
  JOIN
 	    JOB J ON (J.JOB_CODE = E.JOB_CODE)
  JOIN
        DEPARTMENT D  ON(D.DEPT_ID = E.DEPT_CODE);
   
SELECT 
       DEPT_TITLE
     , EMP_NAME
  FROM
       EMPLOYEE   
  JOIN
       DEPARTMENT ON (DEPT_ID = DEPT_CODE);

 
 	 
       
       
	  
       
  
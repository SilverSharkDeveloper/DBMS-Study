--부서별 봉급 총합
SELECT department_id, sum(salary)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

--컬럼 여러개로 그룹화할경우 -> 여러개의 컬럼이 모두 같은 행끼리 그룹화한다.
SELECT DEPARTMENT_ID, JOB_ID, sum(SALARY)
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID, JOB_ID;

--ROLLUP 함수 : 앞에 쓴 컬럼을 기준으로 소계와 총계를 구해준다.
--컬럼 순서가 달라지면 기준이 달라지므로 조회결과도 달라진다.
SELECT DEPARTMENT_ID ,JOB_ID ,SUM(SALARY) , AVG(SALARY)
FROM EMPLOYEES
GROUP BY ROLLUP (DEPARTMENT_ID,JOB_ID)
ORDER BY DEPARTMENT_ID ;

--CUBE() 는 각각의 컬럼 별 모든 조합의 소계를 보여주기 때문에 컬럼순서가 달라져도 조회결과는 달라지지 않는다. 총계O
SELECT DEPARTMENT_ID , JOB_ID , SUM(SALARY)
FROM EMPLOYEES
GROUP BY CUBE(DEPARTMENT_ID,JOB_ID)
ORDER BY DEPARTMENT_ID ;

--GROUPING SETS() 소그룹의 결과는 안보여주고 소그룹별 소계만 보여준다. 총계 X
SELECT DEPARTMENT_ID ,JOB_ID ,SUM(SALARY)
FROM EMPLOYEES 
GROUP BY GROUPING SETS(DEPARTMENT_ID, JOB_ID);

--GROUPING(컬럼) -> NULL값을 분류하기위해 보통 사용
-- 해당 컬럼을 모두 묶은 상태라면 결과는1 아니면 0
--결과가1인지 0인지에 따라서 CASE표현식이나 DECODE()함수를 사용해 분기처리를 할 수 있다.
SELECT DEPARTMENT_ID , JOB_ID , SUM(SALARY),
CASE WHEN GROUPING(DEPARTMENT_ID)= 0 THEN TO_CHAR(DEPARTMENT_ID) ELSE '모든부서' END 부서,
CASE WHEN GROUPING(JOB_ID)= 0 THEN TO_CHAR(JOB_ID) ELSE '모든 직업군'END 직업
FROM EMPLOYEES
GROUP BY ROLLUP(DEPARTMENT_ID,JOB_ID)
ORDER BY DEPARTMENT_ID ;

--=======================================================
--행의 갯수가 달라 오류발생
--SELECT FIRST_NAME, AVG(SALARY) 
--FROM EMPLOYEES ;
--=======================================================

--OVER() , OVER(PARTITION BY )
SELECT FIRST_NAME ,SALARY ,DEPARTMENT_ID ,
			AVG(SALARY) OVER() 전체직원평균봉급,AVG(SALARY) OVER(PARTITION BY DEPARTMENT_ID) 부서별평균봉급
FROM EMPLOYEES ;

--OBER(ORDER BY) 나눠진 파티션을 기준으로 파티션 내에서 정렬을 할 때
SELECT FIRST_NAME, SALARY ,DEPARTMENT_ID ,
		AVG(SALARY) OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY ASC),
			AVG(SALARY) OVER (ORDER BY SALARY)
FROM EMPLOYEES 
ORDER BY DEPARTMENT_ID ;

SELECT FIRST_NAME , SALARY ,DEPARTMENT_ID,
	SUM(SALARY) OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY ASC
									ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) UPCR,
									SUM(SALARY) OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY ASC) 생략,
									SUM(SALARY) OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY ASC
									ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) "3PCR"
FROM EMPLOYEES 
ORDER BY SALARY ;

SELECT FIRST_NAME , SALARY , DEPARTMENT_ID,
	SUM(SALARY) OVER(ORDER BY SALARY RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 자기까지
FROM EMPLOYEES;

SELECT FIRST_NAME , SALARY ,SUM(SALARY) OVER(ORDER BY SALARY ROWS UNBOUNDED PRECEDING),
					SUM(SALARY) OVER(ORDER BY SALARY ROWS CURRENT ROW),	
					SUM(SALARY) OVER(ORDER BY SALARY ROWS 3PRECEDING)
FROM EMPLOYEES;
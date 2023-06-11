SELECT FIRST_NAME,DEPARTMENT_ID ,SALARY,
	SUM(SALARY) OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY ASC )"윈도윙절 생략"
,SUM(SALARY) OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY ROWS BETWEEN 
	UNBOUNDED PRECEDING AND CURRENT ROW) "ROWS 윈도우절"
	FROM EMPLOYEES;
	

--순위함수
--RANK() : 중복이 있으면 다음 순위는 그만큼 밀려남
--DENSE_RANK() : 중복이 있어도 다음 순위는 +1
--ROW_NUMBER : 중복 상관없이 행의 번호를 매김 
SELECT FIRST_NAME,SALARY,
		RANK() OVER(ORDER BY SALARY DESC ),
		DENSE_RANK () OVER(ORDER BY SALARY DESC),
		ROW_NUMBER () OVER(ORDER BY SALARY DESC)
FROM EMPLOYEES;

SELECT FIRST_NAME ,DEPARTMENT_ID ,SALARY ,
	RANK() OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC  BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
FROM EMPLOYEES e 

--순서 함수
SELECT FIRST_NAME,DEPARTMENT_ID, SALARY,
	FIRST_VALUE(FIRST_NAME) OVER(PARTITION BY DEPARTMENT_ID
		) 
FROM EMPLOYEES;

SELECT FIRST_NAME,DEPARTMENT_ID, SALARY,
	FIRST_VALUE(FIRST_NAME) OVER(ORDER BY SALARY
		ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) 
FROM EMPLOYEES;


SELECT FIRST_NAME , DEPARTMENT_ID , SALARY ,
	LAST_VALUE(FIRST_NAME	) OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY) 
FROM EMPLOYEES

SELECT FIRST_NAME , DEPARTMENT_ID , SALARY ,
	LAST_VALUE(FIRST_NAME	) OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY
	ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) 
FROM EMPLOYEES;

SELECT FIRST_NAME , DEPARTMENT_ID ,SALARY,
	LAG(FIRST_NAME) OVER(ORDER BY SALARY),
	LEAD(FIRST_NAME	) OVER (PARTITION BY DEPARTMENT_ID ORDER BY SALARY) 
FROM EMPLOYEES;

--비율함수
SELECT FIRST_NAME , DEPARTMENT_ID , SALARY ,
	RATIO_TO_REPORT(SALARY) OVER(PARTITION BY DEPARTMENT_ID) RPR
	,PERCENT_RANK() OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY) PR 
	,CUME_DIST() OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY) CD
	,NTILE(4) OVER (PARTITION BY DEPARTMENT_ID ORDER BY SALARY) NT 
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ;


--조인 2개이상의 테이블을 조회하는 기법

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS ;

--사원의 이름하고 그사원의 부서 이름 조회
	SELECT FIRST_NAME, DEPARTMENT_NAME 
	FROM EMPLOYEES E INNER JOIN DEPARTMENTS D 
	ON E.DEPARTMENT_ID =D.DEPARTMENT_ID ;

--부서이름하고 부서가 위치한 도시이름 조회
SELECT D.DEPARTMENT_NAME, L.CITY 
FROM DEPARTMENTS d INNER JOIN LOCATIONS L  
ON d.LOCATION_ID = L.LOCATION_ID ;
SELECT * FROM LOCATIONS l ;

--자연조인 : 컬럼 이름이 같은 경우에는 자연조인 사용 가능 ->ON절 필요 없음
SELECT D.DEPARTMENT_NAME , L.CITY 
FROM DEPARTMENTS d NATURAL JOIN LOCATIONS l ;

SELECT FIRST_NAME, DEPARTMENT_ID FROM EMPLOYEES  E NATURAL JOIN DEPARTMENTS d ;
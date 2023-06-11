--문자를 숫자로
SELECT TO_NUMBER('15000') FROM dual;

--문자를 날짜로
--TO_DATE(문자, '패턴')
--y : 년도
--m: 월
--d: 일
--hh : 시
--mi : 분
--ss : 초
SELECT  TO_DATE('120103','mmddyy'),
			TO_DATE('2001-01/03 10 : 14 - 05','yyyy-mm/dd hh : mi - ss') 
FROM dual; 

--hh : 시간 1~12 표현방식
--hh24 : 시간 0~23표현방식
SELECT  TO_DATE('20000101 19','yymmdd hh24')
FROM dual;

--날짜를 문자로
--TO_CHAR(날짜,'패턴')
--day : 요일
--month : 월
--am or pm :오전 또는 오후
SELECT sysdate, 
			TO_CHAR(sysdate,'mm-dd yyyy day am hh24 - mi - ss '),
			TO_CHAR(sysdate,'yyyy"년"mm"월"dd"일"') --문자를 기호처럼사용하고싶다면 쌍따옴표""로감싼다. 
FROM dual;

--숫자를 문자로
-- 9 : 자릿수 의미 -> 비어있는자리는 공백이 채워짐
--0 : 비어있는 자리를 0으로 채움
-- . : 소숫점 위치를 의미
-- , : 컴마 위치를 의미
-- $ : $기호를 의미
--L : 지역 통화 기호를 의미 (원화)
SELECT TO_CHAR(123456789,'000000000000') FROM dual; 
SELECT salary, TRIM(TO_CHAR(salary,'$999,000.00')) FROM employees;

SELECT TO_CHAR(123456789,'$9999,999,999.999')   --$ 123,456,789.000
FROM dual;

--CAST(값 as 타입)
--형식을 지정해줄 수 없다.
SELECT CAST(employee_id AS varchar2(3))
		,CAST('1511' AS NUMBER(5))
		,CAST(sysdate AS varchar2(100))
FROM EMPLOYEES ;

--사원들의 커미션 포함 봉급 조회하기
SELECT first_name,salary,salary*(1+ COMMISSION_PCT) 이번달봉급 -- 값 + NULL값 = NULL
FROM employees;

SELECT commission_pct, salary + salary*NVL(commission_pct,0)  --commission_pct가 null값이면 0, 값이있으면 그값을 출력
FROM employees;

--80번 부서는 직원봉급을 10%인상
--전체 직원이 받아야하는 봉급을 조회
SELECT DEPARTMENT_ID,  salary, salary + salary*DECODE(department_id,80,0.1,0)조정봉급
FROM employees;

--80번 부서는 10%인상, 50번 부서는 10%인하 
SELECT DEPARtMENT_ID, salary, DECODE(department_id,80,1.1*salary,DECODE(department_id,50,0.9*salary,salary))조정봉급,
			DECODE(DEPARTMENT_ID,80,1.1*salary,50,0.9*salary,SALARY)
FROM employees;

--CASE 조건 검색
SELECT employee_id, salary,
	CASE 
			WHEN employee_id BETWEEN 150 AND 160 THEN SALARY*1.1
			WHEN employee_id >=170 THEN SALARY*0.9
			ELSE salary
	END 조정봉급
FROM employees;

-- 80번부서는 10%인상, 50번부서 10%인하
-- 직원 이름, 부서id, 원래봉급, 조정봉급, 비고 를 조회하라 부서id순서대로 정렬하여 조회하기
-- 비고에는 인상되면 인상, 인하되면 인하, 그대로면 해당없음 이라고 표현

--검사하는게 =으로 똑같다면 
SELECT DEPARTMENT_ID , salary, 
		CASE DEPARTMENT_ID
			WHEN 80 THEN salary*1.1 
			WHEN 50 THEN salary*0.9
			ELSE SALARY 
		END 조정봉급	
		,CASE DEPARTMENT_ID
			WHEN 80 THEN '인상'
			WHEN 50 THEN '인하'
			ELSE '해당없음'
		END 비고
FROM employees
ORDER BY department_id;



-- 봉급이 10000달러 이상인 직원은 상
-- 5000이상 10000미만인 직원은 중
-- 5000미만인 직원은 하로 표현하여 직원 이름, 봉급, 비고 조회하기


SELECT first_name,salary,
	CASE 
		WHEN salary>=10000 THEN '상'
		WHEN salary>=5000 THEN '중'
		ELSE '하'
	END 비고
FROM employees;

-- 입사일이 윤년인 직원은 윤년, 입사일이 평년인 직원은 평년이라고 작성하여
-- 직원이름, 입사일, 비고 조회하기
-- 4의배수O 100의배수O 400의배수O --> 윤년 2000
-- 4의배수O 100의배수O 400의배수X --> 1900 2100,.. 평년
-- 4의배수O 100의배수X 400의배수X --> 2012 2004 윤년
-- 4의배수X 100의배수X 400의배수X --> 2003 평년

SELECT first_name,hire_date,
	CASE 
		WHEN MOD(TO_NUMBER(TO_CHAR(hire_DATE,'yyyy')),4)<>0THEN '평년'
		WHEN MOD(TO_NUMBER(TO_CHAR(hire_DATE,'yyyy')),100)<>0 THEN '윤년'
		WHEN MOD(TO_NUMBER(TO_CHAR(hire_DATE,'yyyy')),400)<>0 THEN '평년'
		ELSE '윤년'
	END 비고
FROM employees;

SELECT TO_NUMBER(TO_CHAR(hire_DATE,'yyyy'))/4비고 FROM employees;

--다중행 함수
SELECT  SUM(salary),AVG(SALARY),COUNT(SALARY),min(SALARY),max(SALARY) 
FROM employees;
--NULL값은 제외하고 계산한다.
SELECT COUNT(COMMISSION_PCT),SUM(COMMISSION_PCT),AVG(COMMISSION_PCT)  FROM employees;
--해당 테이블에 있는 전체 행의 갯수
SELECT COUNT(*)FROM EMPLOYEES; 

--GROUP BY 절
--그룹화를 할때 사용
--HAVING  절 그룹화한 행을 걸러낼때 사용
--WHERE절은 group by절 전에 위치하고 먼저 해석되므로 다중행 함수 사용 불가능
--
SELECT AVG(salary),DEPARTMENT_ID 
FROM employees
WHERE  EMPLOYEE_ID >150
GROUP BY DEPARTMENT_ID 
HAVING  AVG(SALARY)> 5000 
ORDER BY DEPARTMENT_ID ; 

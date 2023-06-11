SELECT  first_name FROM employees;
SELECT last_name FROM EMPLOYEES ;

SELECT  first_name, last_name FROM employees;

SELECT 1||'안녕' FROM dual;
--주석
SELECT  first_name
		,last_name
		,email
		,phone_number
		,hire_date 
FROM employees;

--전체 컬럼 속에 들어있는 값 조회하기 
--*(all)
SELECT * FROM employees;

--사원 이름, 성, 봉급, 부서ID를 조회하되 봉급 순서대로 정렬하여 조회하기
--ORDER BY 컬럼 DESC -->해당 컬럼 속에 들어있는 값 내림차순 정렬
--ORDER BY 컬럼 ASC(생략가능)--> 해당 컬럼 속에 들어있는 값 오름차순 정렬
SELECT  first_name, last_name, salary,department_id FROM employees 
		ORDER BY salary DESC; 

	--기본적으로 salary에 내림차순으로 정렬인데 salary가 같은데이터는 department_id 에 내림차순으로 정렬한다.
	SELECT  first_name, last_name, salary,department_id FROM employees 
		ORDER BY salary DESC, department_id DESC;

	--중복되는 데이터는 제거하고 부서 id 조회 
	--SELECT  DISCONNECT 컬럼명 FROM 테이블;
	SELECT DISTINCT department_id FROM employees;

-- 각각에 컬럼이 중복되는 데이터 제거가 아닌 두개의 컬럼모두가 중복되는 데이터만 제거하고 조회
-- ->컬럼이 많아져도 똑같이 모든 컬럼이 중복되는 데이터만 제거후 조회 
	SELECT  DISTINCT salary, department_id FROM employees  ;

SELECT first_name, department_id,first_name||department_id FROM employees;
SELECT email ||'@koreait.com' FROM employees;

--사원의 성과 이름을 합쳐서 조회하기 단, 사원의
SELECT first_name||' '||last_name FROM employees;

--사원의 이름과 원래 받아야하는 봉급, 10%인상된 보너스 봉급 조회하기.
SELECT first_name , salary , salary*1.1 FROM employees;

--날짜도 + 과 -은 사용이 가능하다 (숫자 1 = 무조건 하루)
--날짜 + 숫자 --> 결과는 해당 날짜부터 숫자일만큼 이후 날짜가 결과
--날짜 - 숫자 --> 결과는 해당 날짜부터 숫자일만큼 이전 날짜가 결과
--시간,분,초 모두 1로 환산하여 계산 				
SELECT first_name , hire_date,hire_date+30/24/60 FROM employees;
--날짜 - 날짜 ->결과는 숫자(해당 날짜 사이의 일수)
--sysdate -> 하나의 컬럼 시스템상 현재날짜를 가져옴 ->오라클내에 날짜를 가져올 수 있는 명령어
SELECT  sysdate, hire_date,sysdate - hire_date FROM employees;

	
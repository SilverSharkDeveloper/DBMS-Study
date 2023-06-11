--행을 골라내기 방법 ->WHERE절
--salary가 10000 보다 크거나 같은 직워느이 이름 조회하기.
SELECT FIRST_NAME  FROM employees WHERE salary>= 10000;
--비교할 수 없는 데이터 타입을 컴퓨터가 자동 형변환 해준다. 문자->숫자로 자동 형변환
SELECT FIRST_NAME  FROM employees WHERE salary>= '10000';

--입사일이 2005년1월1일이후인 직원의 이름 조회
--날짜는 추상적인 개념으로 직접 표현할수 없다 -> To_date라는 함수를 통해 문자를 날짜타입으로 형변환 해주어야한다.
SELECT first_name FROM employees WHERE HIRE_DATE >To_DAte('20050101','yyyymmdd');
--비교할 수 없는 데이터 타입을 컴퓨터가 자동 형변환 해준다. 문자->날짜로 자동형변환
SELECT first_name FROM employees WHERE hire_date > '20050101';

--이름이 David인 사람의 봉급 조회하기
--'David'라는 문자 값은 값으로 대소문자를 구분해야 한다.
SELECT salary FROM employees WHERE first_name = 'David';

--문자의 크기는 컴퓨터 상의 문자에 해당하는 숫자 크기로 계산
--각각에 문자에 해당하는 숫자값을 정리해놓은 규칙을 아스키 코드라고한다. 'a'는 97, 'A'는 65
--사전순서라고 생각하면 편하다.
--ORDER BY 문자형태의 컬럼을 쓰면 사전순서로 정열된다. DESC쓸경우 사전 역순서로 정렬되는 이유도 문자를 아스키코드상의 숫자로 컴퓨터가 계산하기 때문이다.
SELECT salary, first_name FROM employees WHERE first_name>'M';

--SQL 연산자
--피연산자 타입은 다 일치해야한다.
SELECT first_name,salary FROM employees WHERE salary BETWEEN 5000 AND 10000;
SELECT first_name , salary FROM employees WHERE first_name IN ('David', 'Peter', 'John');

--패턴 설정 시 규칙
--%(퍼센트) : ~로 해석
--_(언더바) : 자릿수로 해석
SELECT phone_number, first_name, email FROM employees WHERE first_name LIKE  '%vi%';--'~vi~'~안에 어떤값이 와도 상관없음
SELECT phone_number, first_name, email FROM employees WHERE first_name LIKE  '__vi_';--'00vi0'인경우만

--ANY , ALL 은 서브쿼리 쓸 때 사용
SELECT first_name, salary 
FROM EMPLOYEES
WHERE salary= ANY (5000,10000,8000);

SELECT first_name , salary 
FROM EMPLOYEES
WHERE salary > all(6000,10000	);

--NULL = 값이 없음을 나타내는 값
-- =NULL 을 사용하면 가져올 수 없다. 반드시 IS NULL사용
SELECT phone_number ,COMMISSION_PCT 
FROM EMPLOYEES 
WHERE COMMISSION_PCT IS NULL;

SELECT phone_number ,COMMISSION_PCT 
FROM EMPLOYEES 
WHERE COMMISSION_PCT IS NOT NULL;

--논리연산자
--부서 id가 50이면서 봉급이 5000이상인 직원의 이름 조회
SELECT first_name 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50 
AND SALARY >=5000;

--BETWEEN은 양옆숫자를 포함하므로 초과,미만으로 나타내고싶을때 
SELECT first_name 
FROM EMPLOYEES
WHERE SALARY >5000
AND SALARY <10000;

--이름에 vi가 포함되어 있거나 salary가 5000이상, 10000이하인 직원 이름 조회
SELECT first_name
FROM EMPLOYEES
WHERE first_name LIKE '%vi%'
OR salary BETWEEN 5000 AND 10000;

--NOT 조건부정
SELECT first_name
FROM employees
WHERE NOT first_name LIKE '%vi%';

--여러개의 조건
SELECT *
FROM employees 
WHERE EMPLOYEE_ID > 150 
AND salary BETWEEN 5000 AND 10000 
AND DEPARTMENT_ID > 30;

--조건의 우선순위 
--() -> NOT -> AND -> OR
SELECT EMPLOYEE_ID ,SALARY ,DEPARTMENT_ID 
FROM employees 
WHERE EMPLOYEE_ID >150
OR salary>10000
AND DEPARTMENT_ID >50;

--ORDER BY 는 WHERE 절 뒤에 쓴다.
--50번 부서, 직원 이름, 봉급, 커미션포함한 봉급을
--커미션 포함 봉급 순서로 내림차순 정렬하여 조회하기
SELECT * FROM employees;
SELECT first_name, salary, salary*(1+COMMISSION_PCT)
FROM employees 
WHERE DEPARTMENT_ID = 80
ORDER BY salary*(1+COMMISSION_PCT)DESC ;

-- AS "별명" -> 컬럼의 이름을 별명으로 나타내겠다. ->컬럼명이 바뀌어 나온다.
-- as 생략가능, ""생략가능, as랑 ""둘다 생략가능 ***별명에 (스페이스바)가 있을경우 또는 특정 예약아 키워드인경우 ""생략 불가

SELECT first_name AS "이름", 	--3 내가 원하는 컬럼 골라내고, 별명 설정
salary "봉급", 
salary*(1+COMMISSION_PCT) AS 조정봉급
PHONE_NUMBER 전화번호,
EMAIL "이메일 주소"
FROM employees 					--1 employees 테이블에서
WHERE DEPARTMENT_ID = 80 --2 DEPARTMENT_ID 가 80인 행을 골라내서 ->아직 별명을 짓기 전이라서 별명 사용 불가
ORDER BY 조정봉급 DESC ;--4 정렬하여 보여주겠다. ->별명 설정 이후이기때문에 별명 사용 가능

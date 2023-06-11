--입력값이 숫자인 함수
--ROUND(숫자,소수점자리수) 소수점자리수 = 0 -> 정수자리까지 반올림
SELECT commission_pct,ROUND(COMMISSION_PCT,1) 
FROM employees	
WHERE DEPARTMENT_ID = 80;

--select 문은 반드시 from까지 써주어야하므로 테이블명을 생략할 수 없다.
-- ->dual 테이블은 결과를 확인하기 위한 가상의 테이블(오라클,my SQL(FROM 생략 가능)만 가능)
SELECT ROUND(15.1323,1),	--소수점1의자리 까지 반올림
			ROUND(15.1323,0),	--1의자리까지 반올림
			Round(15.1323,-1),	--10의자리까지 반올림
			ROund(15.1323)		--생략시 반올림하여 1의자리까지 표현 
FROM dual;

--trunc (숫자,소수점자리수) 
 SELECT  trunc(15.1323,1), --소수점 1의자리까지 표현 나머지는 절삭
			trunc(15.1323,0),  --1의자리까지 표현 나머지는 절삭
			trunc(15.1323,-1), --10의자리까지 표현,1의자리부터 절삭
			trunc(15.1323)      --생략시 1의자리까지 표현 나머지 절삭
FROM dual;


SELECT MOD(10,3),  --나누기의 나머지
		CEIL (15.1323), --정수까지 올림
		floor(15.1323), --정수까지 내림
		SIGN(15),        --양수일때 1
		SIGN(-64),       --음수일때 -1 
		sign(0),			--0일때 0
		power(3,2),		--3의 2제곱
		SQRT(25)			--25의 제곱근 (루트)
FROM dual;

SELECT ROund(SQRT(5),1) 
FROM dual;

--where 절에 함수사용
--직원 id가 홀수인 직원의 id와 직원이름 조회
SELECT first_name,employee_id 
FROM employees 
WHERE MOd(EMPLOYEE_ID,2)=1;

--LOWER() ->모든 문자를 소문자로
--UPPER() -> 모든 문자를 대문자로
SELECT first_name,
			Lower(first_name),
			UPPER(first_name)
FROM employees;

--문자열 비교할때 맞춰주기 위해 사용
SELECT first_name,salary, email
FROM employees 
WHERE UPPER(FIRST_NAME) = UPPER('david');  

--initcap() ->문자열 값의 첫글자만 대문자로 변환
SELECT email, INITCAP(email) FROM employees;

--subSTr(문자열,몇번째 문자부터,몇개짜를건지), 
--만약 짜를 갯수보다 남아있는 문자의 갯수가 적으면 모두출력
SELECT first_name,SUBSTR(first_name,2,2)
FROM employees;

--REPLACE(문자열,바꿀 문자,바꿔질 문자)
--LENGTH(문자열) -> 문자갯수
SELECT REPLACE('apple','p','e'),
		LEngth('apple')
FROM dual;

--instr(문자열,문자 또는 문자열) -> 문자 또는 문자열의 위치를 찾아줌 
--										->만약에 없을경우 0출력
--instr(문자열, 문자 또는 문자열, 몇번째 자리부터 찾을지)
SELECT 	INstr('apple','pl'),
		INstr('apple','p'),
			INstr('apple','xx'),
				INstr('applepie','e',6)
FROM dual;

--사원의 이름 중 e가 두개이상 존재하는 사원의 이름 조회하기
--이때 두번째 e부터 끝까지 잘라낸 결과 조회하기

SELECT first_name,
substr(first_name,instr(Lower(first_name),'e',instr(LOWER(first_name),'e')+1),LENGTH(first_name)) 결과
FROM employees 
WHERE instr(Lower(first_name),'e',instr(LOWER(first_name),'e')+1)>0;

SELECT first_name,
substr(first_name,instr(Lower(first_name),'e',instr(LOWER(first_name),'e')+1),
LENGTH(first_name)-instr(Lower(first_name),'e',instr(LOWER(first_name),'e')+1)+1) 결과
FROM employees 
WHERE instr(Lower(first_name),'e',instr(LOWER(first_name),'e')+1)>0;

--LPAD, RPAD (문자열,총문자의 갯수,채울 문자열)
SELECT LPAD('apple',4,'s'), rPAD('apple',6,'ds') FROM dual; 

--LTRIM, RTRIM (문자열,지울문자열) ->지울 문자열을 왼쪽, 오른쪽부터 찾아 띄어쓰기나 다른 문자열이 있는곳까지 지움
SELECT LTRIM('aaa abab baaa','a'), RTRIM('aaababbaaa','a') FROM dual; 
--보통 띄어쓰기를 지우기위해 많이사용 ->지울문자열을 선언하지 않는경우 띄어쓰기를 지워준다.
SELECT  LTRIM('        dfsdf       '), RTRIM('         sdf        ') FROM dual; 

--TRIM(문자열) ->문자열 양쪽 공백을 모두 지워나간다. ->문자를 만날경우 멈춤
--REPLACE로 공백을 지울경우 -> 중간에있는 모든 띄어쓰기를 지워준다.
SELECT  TRIM('       sfsdf sf s     ') FROM dual;
SELECT TRIM('  szefsf sdf sdf      ') FROM dual; 

--사원의 이름과 이메일 주소를 출력하고자 한다.
--이때 사원의 이메일 주소는 개인정보 보호를 위해 앞의 두 글자를 제외한 나머지 부분은 *로 채워서 조회하시오
	SELECT first_name,email,RPAD(SUBSTR(email,1,2),LENGTH(EMAIL),'*')||'@koreait.com' 암호메일
	FROM employees;

--MONTHS_BETWEEN(날짜,날짜) -> 날짜사이의 몇개월 차이나는지 -->>결과는 숫자타입
SELECT sysdate , hire_date, MONTHS_BETWEEN(sysdate,hire_date)
FROM employees;

--add_months(날짜,숫자) 날짜로부터 숫자월 뒤
SELECT sysdate, ADD_MONTHS(sysdate,1)
FROM dual;
--add_months는 다음달의 같은날짜, 만약 다음달에 없는날짜라면 마지막날출력  -->정기결제 회원 안내해줄때 사용
SELECT ADD_MONTHS(TO_DATE('20220131'),1)
FROM dual;

--next_day(날짜,숫자)-> 날짜로부터 돌아오는 숫자에맞는 요일의 날짜 출력 
--1 : 일요일 , 2:월, 3:화.....7:토
-- ->같은 요일은 돌아오는 다음요일 날짜 출력 ---->>>>요일마다 정기배송되는 날짜 알려줄때
SELECT sysdate, NEXT_DAY(sysdate,6)
FROM dual;
SELECT sysdate, NEXT_DAY('20220131',6)
FROM dual;

--LAST_DAY(날짜) ->그달의 마지막날 출력
SELECT hire_date, LAST_DAY(hire_date)
FROM employees
ORDER BY HIRE_DATE ;

SELECT sysdate,
		ROUND(SYSDATE,'year'),--반올림하여 년도까지 표현
		ROUND(SYSDATE,'month'), -- 반올림하여 월까지 표현
		ROUND(SYSDATE,'day'), -- 반올림해서 요일을 표현
		ROUND(SYSDATE,'dd'), -- 반올림하여 일까지 표현
		ROUND(SYSDATE)      --기본값, 반올림하여 일까지 표현
FROM dual;		
	
SELECT sysdate,
		TRUNc(SYSDATE,'year'),--절삭하여 년도까지 표현
		TRUNC(SYSDATE,'month'), -- 절삭하여 월까지 표현
		TRUNC(SYSDATE,'day'), -- 절삭해서 요일을 표현
		TRUNC(SYSDATE,'dd'), -- 절삭하여 일까지 표현
		TRUNC(SYSDATE)      --기본값, 절삭하여 일까지 표현
FROM dual;		

--직원의 이름과, 고용일, 연차를 조회하시오
--단, 연차는 다음과 같이 계산한다.
--2021년 1월 입사자는 현재(2022년 12월)-->2년차
--2021년 12월 입사자는 현재 2년차

--항상 버그가 있는지 살펴본다. 일수로할경우 4년마다 366일이 있으므로 주의
SELECT first_name, hire_date,
MONTHS_BETWEEN(trunc(sysdate,'year'),trunc(HIRE_DATE,'year'))/12 +1 년차 
FROM employees;

SELECT first_name, hire_date, (trunc(sysdate,'year')-trunc(hire_date,'year'))/365+1 
FROM employees;


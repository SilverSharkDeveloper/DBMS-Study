--player 테이블에서 팀별 최대 몸무게인 선수의 TEAM_ID, REGION_NAME,PLAYER_NAME,WEIGHT 검색
--WHERE 절에서 IN 사용하기

						
SELECT P.WEIGHT, P.TEAM_ID,P.PLAYER_NAME, T.REGION_NAME 
FROM PLAYER P INNER JOIN TEAM t 
ON P.TEAM_ID = T.TEAM_ID AND(P.WEIGHT,P.TEAM_ID) IN (SELECT MAX(WEIGHT),TEAM_ID FROM PLAYER GROUP BY TEAM_ID);

--ON절에 조건처리 최대한 해주기.
--IN을 사용할 경우 두개를 동시에 비교할 수 있다. 두개를 동시에 비교할경우 둘다 같은 값만 가져오기 때문에 그룹별 특정 값을 가져오고 싶을 때  좋다.

--DEPT 테이블의 LOC별 평균 급여를 반올림 한 값과 각 LOC별 SAL 총 합을 조회
SELECT D.LOC,ROUND(AVG(E.SAL)),SUM(E.SAL)
FROM DEPT d JOIN EMP e
USING(DEPTNO)
GROUP BY D.LOC 

SELECT * FROM DEPT;

--EMP테이블에서 FORD 와 입사년ㄴ도가 같은 사원의 전체 정보 조회

SELECT *
FROM EMP E 
WHERE  TO_CHAR((SELECT HIREDATE FROM EMP WHERE ENAME = 'FORD'),'YYYY') = TO_CHAR(HIREDATE,'YYYY');

SELECT TO_CHAR((SELECT HIREDATE FROM EMP WHERE ENAME = 'FORD'),'YYYY') FROM EMP;

SELECT * FROM EMP;

--AVG를 쓰지 않고 PLAYER테이블 선수들의 평균키 구하기 NULL미포함
SELECT SUM(HEIGHT)/COUNT(HEIGHT)
FROM PLAYER;

SELECT AVG(HEIGHT) FROM PLAYER;

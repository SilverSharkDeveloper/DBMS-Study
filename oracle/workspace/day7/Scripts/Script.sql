SELECT * FROM STADIUM s 
LEFT JOIN TEAM t 
ON s.HOMETEAM_ID  = t.TEAM_ID ; 

SELECT *FROM EMPLOYEES 
WHERE JOB_ID = 'SA_REP';

SELECT  MAX(WEIGHT) FROM PLAYER p 
GROUP BY TEAM_ID ;


SELECT SUM(HEIGHT)/COUNT(PLAYER_ID) FROM PLAYER;

SELECT  LOC, ROUND(AVG(e.SAL)) 평균급여, SUM(e.SAL) 총급여 FROM DEPT D
JOIN EMP e  ON D.DEPTNO = e.DEPTNO 
GROUP BY LOC ;


SELECT T2.*, T1.TEAM_NAME, T1.TEL FROM TEAM T1 JOIN 
(SELECT P2.* FROM
(SELECT MAX(WEIGHT) W ,TEAM_ID  FROM PLAYER 
GROUP BY TEAM_ID) P1 JOIN PLAYER p2 
ON P1.W = P2.WEIGHT AND P1.TEAM_ID  = P2.TEAM_ID) T2
ON T2.TEAM_ID  = T1.TEAM_ID ;

SELECT * FROM EMP e 
WHERE TO_CHAR(E.HIREDATE,'YYYY') =  (SELECT TO_CHAR(HIREDATE,'YYYY') FROM EMP E 
WHERE E.ENAME = 'FORD');



SELECT E1.FIRST_NAME  || E1.LAST_NAME  사원 , E2.FIRST_NAME || E2.LAST_NAME 매니저 FROM EMPLOYEES E1 
JOIN EMPLOYEES E2
ON NVL(E1.MANAGER_ID,E1.EMPLOYEE_ID) = E2.EMPLOYEE_ID ;

SELECT E1.FIRST_NAME ,E1.DEPARTMENT_ID ,E2.DEPARTMENT_ID  FROM EMPLOYEES E1 JOIN EMPLOYEES E2 
ON E1.MANAGER_ID = E2.EMPLOYEE_ID ;


SELECT * FROM JOBS;

SELECT * FROM EMPLOYEES e ;

SELECT * FROM DEPARTMENTS d ;

SELECT JOB_ID, MANAGER_ID FROM EMPLOYEES e
GROUP BY JOB_ID,MANAGER_ID  ;

SELECT E.EMPLOYEE_ID,D.DEPARTMENT_ID ,D.DEPARTMENT_NAME  FROM DEPARTMENTS D JOIN  EMPLOYEES E 
ON D.MANAGER_ID = E.EMPLOYEE_ID ;

SELECT S.FIRST_NAME ,S.관리부서,D.DEPARTMENT_NAME  소속부서 FROM
(SELECT *FROM EMPLOYEES E FULL OUTER JOIN (SELECT E.EMPLOYEE_ID 관리하는종업원ID ,D.DEPARTMENT_ID 관리부서ID ,D.DEPARTMENT_NAME 관리부서 FROM DEPARTMENTS D JOIN  EMPLOYEES E 
ON D.MANAGER_ID = E.EMPLOYEE_ID) M
ON E.EMPLOYEE_ID = M.관리하는종업원ID) S
LEFT OUTER JOIN DEPARTMENTS D 
ON S.DEPARTMENT_ID = D.DEPARTMENT_ID ;


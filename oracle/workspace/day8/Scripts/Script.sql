CREATE VIEW view_player AS SELECT FLOOR( ((SYSDATE - BIRTH_DATE)/365)) Age, p.* FROM PLAYER p ;

SELECT * FROM view_player ;


SELECT FLOOR( ((SYSDATE - BIRTH_DATE)/365)) Age, p.* FROM PLAYER p ;

CREATE VIEW VIEW_EMPLOYYES AS
SELECT E2.FIRST_NAME 매니저 ,E.FIRST_NAME 사원 FROM EMPLOYEES E
LEFT OUTER JOIN EMPLOYEES E2
ON E.MANAGER_ID = E2.EMPLOYEE_ID ;

DROP VIEW VIEW_EMPLOYYES ;


SELECT * FROM VIEW_EMPLOYYES ;
/*[문제5] 
5-1. 부서별 최대급여를 받는 사원의 부서명, 최대급여를 출력하시오
5-2. 1번 문제에 최대급여를 받는 사원의 이름도 구하시오*/
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

SELECT 이름, 부서명, 최대급여
FROM(SELECT LAST_NAME AS 이름, DEPARTMENT_NAME AS 부서명, SALARY AS 최대급여
FROM EMPLOYEES
JOIN DEPARTMENTS USING(DEPARTMENT_ID)
WHERE (DEPARTMENT_ID, SALARY) IN (SELECT DEPARTMENT_ID, MAX(SALARY) AS SALARY 
                                  FROM EMPLOYEES 
                                  GROUP BY DEPARTMENT_ID));

/*
[문제6] 사원들의 연봉을 구한 후 최하위 연봉자 5명을 추출하시오
 조건1) 연봉 = 급여*12+(급여*12*커미션)
 조건2) 타이틀은 사원이름, 부서명, 연봉
 조건3) 연봉은 ￦25,000 형식으로 하시오
*/

SELECT 사원이름, 부서명, TO_CHAR(연봉,'L999,999,999') AS 연봉
FROM
(SELECT LAST_NAME AS 사원이름, DEPARTMENT_NAME AS 부서명, SALARY*12+(SALARY*12*NVL(COMMISSION_PCT,0)) AS 연봉
FROM EMPLOYEES
JOIN DEPARTMENTS USING(DEPARTMENT_ID)
ORDER BY 3 ASC)
WHERE ROWNUM <=5;



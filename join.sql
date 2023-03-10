--위치ID, 부서ID을 연결해서 사원이름, 도시, 부서이름을 출력하시오
--EMPLOYEES, LOCATIONS2, DEPARTMENTS

SELECT * FROM EMPLOYEES;
SELECT * FROM LOCATIONS2;
SELECT * FROM DEPARTMENTS;

SELECT LAST_NAME AS 사원이름,
        CITY AS 도시,
        DEPARTMENT_NAME AS 부서이름
FROM EMPLOYEES
JOIN DEPARTMENTS USING(DEPARTMENT_ID)
JOIN LOCATIONS2 ON(LOCATION_ID = LOC_ID)
WHERE CITY IN ('OXFORD')
ORDER BY 2;
/*
--  부서ID, 위치ID, 국가ID를 연결해서 다음과 같이 완성하시오
--  (관련 테이블 : EMPLOYEES, LOCATIONS2, DEPARTMENTS, COUNTRIES)

--조건1 : 사원번호, 사원이름, 부서이름, 도시, 도시주소, 나라이름으로 제목을 표시하시오
--조건2 : 도시주소에 Ch 또는 Sh 또는 Rd가 포함되어 있는 데이터만 표시하시오
--조건3 : 나라이름, 도시별로 오름차순 정렬하시오
--조건4 : 모든 사원을 포함한다.
*/

SELECT EMPLOYEE_ID AS 사원번호,
        LAST_NAME AS 사원이름,
        DEPARTMENT_NAME AS 부서이름,
        CITY AS "도  시",
        STREET_ADDRESS AS "도시주소",
        COUNTRY_NAME AS "나라이름" 
FROM EMPLOYEES
LEFT JOIN DEPARTMENTS USING(DEPARTMENT_ID)
JOIN LOCATIONS2 ON(LOCATION_ID = LOC_ID)
JOIN COUNTRIES USING(COUNTRY_ID)
WHERE STREET_ADDRESS LIKE '%Ch%'
    or STREET_ADDRESS LIKE '%Sh%'
    or STREET_ADDRESS LIKE '%Rd%'
ORDER BY 6,4;

/*self join*/

select  e.employee_id as 사원번호, 
	e.last_name as 사원이름, 
	m.last_name as 관리자
from employees e
join employees m on(m.employee_id=e.manager_id);  


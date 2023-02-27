select * from employees;

select to_char(trunc(avg(salary), 0), '99,999') as 사원급여평균 from employees;
SELECT * FROM TAB;

select department_id as 부서코드, 
       to_char(round(avg(salary), 0), 'L99,999,999') as 평균급여
from employees
group by department_id     
having avg(salary) >= 5000
order by department_id asc; 
SELECT  * FROM TAB;
SELECT * FROM EMPLOYEES;

SELECT JOB_ID, SUM(SALARY) AS 그룹합계 FROM EMPLOYEES
GROUP BY JOB_ID;

/*10과 20부서에서 최대급여를 받는 사람의 최대급여를 구하여 정렬하시오*/
select department_id, max(salary) as max_salary
from employees
where department_id in(10, 20)
group by department_id
order by department_id;

select  employee_id,
        employees.department_id,
        department_name
from employees, departments
where employees.department_id = departments.department_id;   

select employee_id, department_id, department_name
from employees
join departments using(department_id); 

SELECT * FROM LOCATIONS;
SELECT * FROM departments;

SELECT DEPARTMENT_ID, CITY
FROM DEPARTMENTS
JOIN LOCATIONS USING(LOCATION_ID);


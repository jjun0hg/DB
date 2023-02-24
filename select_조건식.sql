select employee_id, last_name, department_id
from employees
where lower(last_name)='higgins';

select MOD(10, 3) FROM DUAL;
SELECT ROUND(35765.357,2) FROM DUAL;
SELECT ROUND(35765.357, 0) FROM DUAL;
SELECT ROUND(35765.357, -3) FROM DUAL;

SELECT TRUNC(35765.357, 2) FROM DUAL;
SELECT TRUNC(35765.357, 0) FROM DUAL;
SELECT TRUNC(35765.357, -3) FROM DUAL;

SELECT CONCAT('Hello', 'World') from dual;
create table text(
str1 char(20),
str2 varchar(20));
insert into text(str1, str2) values('angel','angel');
insert into text(str1, str2) values('사천사', '사천사');
commit;
select substr('I am very happy', 6, 4) from dual; -- very

SELECT FIRST_NAME,LAST_NAME FROM EMPLOYEES;
SELECT * FROM EMPLOYEES;
SELECT SUBSTR(FIRST_NAME,0) FROM EMPLOYEES;

select last_name as "이름", salary*12 as "연봉" from employees
order by 2 desc;

select EMPLOYEE_ID,concat(first_name,' '||last_name) as NAME
,length(concat(First_name, ' '||Last_name)) AS LENGTH
from employees
WHERE SUBSTR(LAST_NAME,-1,1) = 'n';

select width_bucket(74,0,100,10) from dual;
select rtrim('test    ') || 'exam' from dual;
select sysdate from dual;

/*오늘부터 이번 달 말까지 총 남은 날수를 구하시오*/
select last_day(sysdate) - SYSDATE AS "남은 날수"  from dual;

/*강제 변환*/
select last_name, to_char(salary, 'L99,999.00')
from employees
where last_name='King';

select max(salary),
        min(salary),
        trunc(avg(salary),0),
        to_char(sum(salary), 'L9,999,999') from employees;
        
select count(*) from employees;
select count(distinct nvl(department_id, 0)) from employees; 
select distinct nvl(department_id, 0) from employees;

/*decode*/
select job_id, decode(job_id, 
                     'SA_MAN', 'Sales Dept',
                     'SA_REP', 'Sales Dept',
                     'Another') "분류"
from employees
order by 2;
/*case when*/
select job_id, case job_id
                    when 'SA_MAN' then 'Sales Dept'
                    when 'SA_REP' then 'Sales Dept'
                    else 'Another'
              end "분류"
from employees
order by 2;       

select Last_name,Hire_date from employees
where hire_date<='05-01-01';

/*커미션(commission_pct)을 받지 않은 사원의 인원수를 구하시오*/
select count(nvl(COMMISSION_PCT,0)) AS "커미션X" 
FROM employees where commission_pct is null;

/*급여가 10000 미만이면 초급, 20000 미만이면 중급 그 외면 고급을 출력
 조건1) 제목은 사원번호, 사원명, 구분으로 표시하시오
 조건2) 구분 컬럼으로 오름차순 정렬하고, 같으면 사원명 컬럼으로 오름차순 하시오 
 조건3) case 사용하시오*/
select employee_id as "사원번호", last_name as "사원명",
        case
            when salary<'10000' then '초급'
            when salary<'20000' then '중급'
            else '고급'
            end "구분"
from employees order by 3;

/*사원테이블에서 사원번호, 이름, 급여, 커미션, 연봉을 출력하시오
        조건1) 연봉은 $ 표시와 세자리마다 콤마를 사용하시오
        조건2) 연봉 = 급여 * 12 + (급여 * 12 * 커미션)
        조건3) 커미션을 받지 않는 사원도 포함해서 출력하시오*/
select employee_id as "사원번호", last_name as "이름", salary as "급여",
        NVL(COMMISSION_PCT,0) as "커미션", 
        TO_CHAR(NVL(COMMISSION_PCT,1)*(salary*12 ),'$9,999,999')as 연봉
        from employees;

/*매니저가 없는 사원의 MANAGER_ID를 1000번으로 표시
        조건1) 제목은 사원번호, 이름, 매니저ID
        조건2) 모든 사원을 표시하시오 */
select * from employees;
SELECT EMPLOYEE_ID AS "사원번호", LAST_NAME AS "이름",
        NVL(MANAGER_ID,1000) AS "매니저ID"
        FROM EMPLOYEES ORDER BY 1;

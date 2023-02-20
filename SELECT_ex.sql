SELECT* FROM EMP;
-- 김씨 레코드만 검색
SELECT * FROM EMP WHERE ENAME LIKE '김%';

-- 2000년 이전에 입사한 사원만 검색
SELECT * FROM EMP WHERE HDATE<'2000-01-01';

-- ENO(번호), ENAME(이름), SAL(월급)으로 검색
-- 단 1달러 = 1234원일때 월급을 원으로 검색하시오.

select ENO AS "번호", ENAME AS "이름", SAL*1234 AS "월급" FROM EMP;


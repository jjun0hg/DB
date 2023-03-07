/*사원테이블에서 급여가 5000 이상 10000 이하인 사원들만 v_view2으로 뷰를 만드시오.
(사원ID, 사원이름, 급여, 부서ID)*/

create or replace view v_view2(사원ID, 사원이름, 급여, 부서ID)
as select employee_id, last_name, salary, department_id from employees
where salary>=5000 and salary <=10000;

select * from v_view2;

/*사원테이블과 부서테이블에서 사원번호, 사원명, 부서명을 v_view3로 뷰 테이블을 만드시오
조건1) 부서가 10, 90인 사원만 표시하시오
조건2) 타이틀은 사원번호, 사원명, 부서명으로 출력하시오
조건3) 사원번호로 오름차순 정렬하시오*/

CREATE OR REPLACE VIEW V_VIEW3(사원번호, 사원명, 부서명)
AS SELECT EMPLOYEE_ID, LAST_NAME, DEPARTMENT_NAME 
FROM EMPLOYEES
JOIN DEPARTMENTS USING(DEPARTMENT_ID)
WHERE DEPARTMENT_ID IN (10,90) 
ORDER BY 1;

SELECT * FROM V_VIEW3;

/*부서ID가 10, 90번 부서인 모든 사원들의 부서위치를 표시하시오
조건1) v_view4로 뷰 테이블을 만드시오
 조건2) 타이틀을 사원번호, 사원명, 급여, 입사일, 부서명, 부서위치(city)로 표시하시오
 조건3) 사원번호 순으로 오름차순 정렬하시오
 조건4) 급여는 백 단위 절삭하고, 3자리 마다 콤마와 '원'을 표시하시오
 조건5) 입사일은  '2004년 10월 02일' 형식으로 표시하시오*/

CREATE OR REPLACE VIEW V_VIEW4(사원번호, 사원명, 급여, 입사일, 부서명, 부서위치)
as select employee_id,
         last_name,
         to_char(trunc(salary,-3),'99,999')|| '원',
         to_char(hire_date,'YYYY"년" MM"월" DD"일"'),
         department_NAME,
         city
from employees
LEFT JOIN DEPARTMENTS USING(DEPARTMENT_ID)
JOIN LOCATIONS USING(LOCATION_ID)
WHERE DEPARTMENT_ID IN(10,90)
ORDER BY 1;

SELECT * from v_view4;

DROP TABLE BOOKSHOP;
CREATE TABLE BOOKSHOP(
                    isbn    varchar2(10) CONSTRAINT PISBN PRIMARY KEY,
                    title   varchar2(50) CONSTRAINT CTIT NOT NULL,
                    author  varchar2(50),
                    price   number,     
                    company varchar2(30)
);

INSERT INTO BOOKSHOP VALUES('is001','자바3일완성','김자바',25000,'야메루출판사');
INSERT INTO BOOKSHOP VALUES('pa002','JSP달인되기','이달인',28000,'공갈닷컴');
INSERT INTO BOOKSHOP VALUES('or003','오라클무작정따라하기','박따라',23500,'야메루출판사');

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='BOOKSHOP';

CREATE TABLE BOOKORDER(
                        IDX  NUMBER PRIMARY KEY,
                        ISBN VARCHAR2(10),
                        QTY  NUMBER,
                        CONSTRAINT FKISBN FOREIGN KEY(ISBN) REFERENCES BOOKSHOP);

CREATE SEQUENCE IDX_SEQ
            INCREMENT BY 1
            START WITH 1
            NOCACHE
            NOCYCLE;

INSERT INTO BOOKORDER VALUES(IDX_SEQ.NEXTVAL,'is001',2);
INSERT INTO BOOKORDER VALUES(IDX_SEQ.NEXTVAL,'or003',3);
INSERT INTO BOOKORDER VALUES(IDX_SEQ.NEXTVAL,'pa002',5);
INSERT INTO BOOKORDER VALUES(IDX_SEQ.NEXTVAL,'is001',3);
INSERT INTO BOOKORDER VALUES(IDX_SEQ.NEXTVAL,'or003',10);
commit;

CREATE OR REPLACE VIEW BS_VIEW(책제목, 저자, 총판매금액)
AS SELECT TITLE, AUTHOR, TO_CHAR(SUM(PRICE*qty),'999,999')
FROM BOOKSHOP
JOIN BOOKORDER USING(ISBN)
GROUP BY (TITLE,AUTHOR)
WITH READ ONLY;

SELECT * FROM BS_VIEW ORDER BY 3;

/*모든 교수의 명단과 담당 과목을 검색하시오
테이블명 : PROFESSOR, COURSE
필드명 : PNO, PNAME, SECTION, CNO, CNAME*/
select * from professor;
select * from course;

SELECT  PNO,
        PNAME AS 교수명단,
        SECTION AS 담당과목, CNO, CNAME
FROM COURSE
LEFT JOIN PROFESSOR USING(PNO);

/*이번 학기 등록된 모든 과목과 담당 교수의 학점 순으로 검색하시오
테이블명 : PROFESSOR, COURSE
필드명 : CNO, CNAME, ST_NUM, PNO, PNAME*/

SELECT CNO, CNAME, ST_NUM, PNO, PNAME
FROM COURSE
LEFT JOIN PROFESSOR USING(PNO)
ORDER BY 3,1;

/*화학과 학생이 수강하는 과목을 담당하는 교수의 명단을 검색하시오
테이블명 : STUDENT, SCORE, COURSE, PROFESSOR
필드명 : SNO, SNAME, MAJOR, SYEAR, CNO, CNAME, PNO, PNAME*/
SELECT * FROM STUDENT;
SELECT * FROM SCORE;
SELECT * FROM COURSE;
SELECT * FROM PROFESSOR;

SELECT SNO, SNAME, MAJOR, SYEAR, CNO, CNAME, PNO, PNAME
FROM STUDENT
JOIN SCORE USING(SNO)
JOIN COURSE USING(CNO)
JOIN PROFESSOR USING(PNO)
WHERE MAJOR = '화학';

/*학생중에 동명이인을 검색한다 (SELF JOIN)
테이블명 : STUDENT
필드명 : SNO, SNAME*/
SELECT  * FROM STUDENT;
SELECT S.SNO AS 생년월일,T.SNO AS 생년월일, S.SNAME AS 이름, T.SNAME AS 이름2
FROM STUDENT S, STUDENT T
WHERE S.SNO != T.SNO AND S.SNAME=T.SNAME;

SELECT A.SNO, A.SNAME
FROM STUDENT A, STUDENT B
WHERE A.SNO != B.SNO AND A.SNAME = B.SNAME;



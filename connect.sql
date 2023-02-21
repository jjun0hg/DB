UPDATE DBTEST SET AGE=AGE+1 WHERE NAME LIKE '%홍%';
DELETE FROM DBTEST WHERE NAME='진분홍';
COMMIT;
--INSERT, UPDATE, DELETE ...LOCK 걸려있기 때문에 반드시 COMMIT 해야함

create table student(
name  varchar2(15)  not  null, -- 이름
value   varchar2(15), -- 학번 or 과목 or 부서
code   number   -- 1이면 학생, 2이면 교수, 3이면 관리자
);

SELECT * FROM STUDENT;
DELETE FROM STUDENT;
COMMIT;
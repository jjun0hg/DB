-- sub query
SELECT * FROM
(select ROWNUM RN, AA.* FROM
(SELECT seq, name, email, homepage, subject, content, to_char(logtime, 'YYYY.MM.DD') as logtime
FROM GUESTBOOK ORDER BY SEQ DESC) aa
) WHERE RN>=1 AND RN<=2;


--PG=1 RN>=1 AND RN<=2
--PG=2 RN>=3 AND RN<=4
--PG=3 RN>=5 AND RN<=6

SELECT * FROM GUESTBOOK ORDER BY SEQ DESC;
select * from guestbook;

SELECT seq, name, email, homepage, subject, content, to_char(logtime, 'YYYY.MM.DD') as logtime FROM GUESTBOOK WHERE SEQ=3;
SELECT COUNT(*) FROM GUESTBOOK
/*화학과를 제외하고 학과별로 학생들의 평점 평균을 검색하세요*/
SELECT * FROM STUDENT;
SELECT ROUND(AVG(AVR),3) AS 평점평균, MAJOR FROM STUDENT
WHERE MAJOR != '화학'
GROUP BY MAJOR;

SELECT * FROM TAB;

/* 화학과를 제외한 각 학과별 평균 평점 중에 평점이 2.0 이상인 정보를 검색하세요*/

SELECT ROUND(AVG(AVR),3) AS 평점평균, MAJOR FROM STUDENT
WHERE MAJOR != '화학'
GROUP BY MAJOR
HAVING ROUND(AVG(AVR), 2) >= 2.0;

-- SECTION I

CREATE TABLE DEPT
(
DEPTNO INT(2),
DNAME VARCHAR(15),
LOC VARCHAR(10)
);

INSERT INTO DEPT VALUES
(10 , 'ACCOUNTING' , 'NEW YORK'),
(20 , 'RESEARCH' , 'DALLAS'),
(30 , 'SALES' , 'CHICAGO'),
(40 , 'OPERATIONS' , 'BOSTON');

SELECT * FROM DEPT;

CREATE TABLE EMP
(
EMPNO INT(4),
ENAME VARCHAR(10),
JOB VARCHAR(9),
HIREDATE DATE,
SAL FLOAT(7,2),
COMM FLOAT(7,2),
DEPTNO INT(2)
);

INSERT INTO EMP VALUES
(7839 , 'KING' , 'MANAGER' , '1991-11-17' , 5000 , NULL , 10),
(7698 , 'BLAKE' , 'CLERK' , '1981-05-01' , 2850 , NULL , 30),
(7782 , 'CLARK' , 'MANAGER' , '1981-06-09' , 2450 , NULL, 10),
(7566 , 'JONES' , 'CLERK' , '1981-04-02' , 2975 , NULL , 20),
(7654 , 'MARTIN' , 'SALESMAN' , '1981-09-28' , 1250 , 1400 , 30),
(7499 , 'ALLEN' , 'SALESMAN' , '1981-02-20' , 1600 , 300 , 30);

SELECT * FROM EMP;

-- Q3. Display all the employees where SAL between 2500 and 5000 (inclusive of both).

SELECT EMPNO , ENAME FROM EMP 
WHERE SAL BETWEEN 2500 AND 5000;

-- Q4. Display all the ENAMEs in descending order of ENAME.

SELECT ENAME FROM EMP 
ORDER BY ENAME DESC;

-- Q5. Display all the JOBs in lowercase.

SELECT LOWER(JOB) FROM EMP;

-- Q6. Display the ENAMEs and the lengths of the ENAMEs.

SELECT ENAME , LENGTH(ENAME) FROM EMP;

-- Q7. Display the DEPTNO and the count of employees who belong to that DEPTNO 

SELECT DEPTNO , COUNT(ENAME) FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- Q8. Display the DNAMEs and the ENAMEs who belong to that DNAME.

SELECT DNAME , ENAME FROM EMP , DEPT
WHERE DEPT.DEPTNO = EMP.DEPTNO;

-- Q9. Display the position at which the string ‘AR’ occurs in the ename.



-- Q10. Display the HRA for each employee given that HRA is 20% of SAL.

SELECT ENAME , SAL , SAL * 0.2 'HRA' FROM EMP;

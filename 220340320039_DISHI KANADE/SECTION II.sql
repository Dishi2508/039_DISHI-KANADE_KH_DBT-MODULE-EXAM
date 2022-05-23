-- SECTION II

/* Q1. 1.	Write a stored procedure by the name of PROC1 that accepts two varchar strings as 
parameters. Your procedure should then determine if the first varchar string exists inside the 
varchar string. For example, if string1 = ‘DAC’ and string2 = ‘CDAC, then string1 exists inside 
string2.  The stored procedure should insert the appropriate message into a suitable TEMPP 
output table. Calling program for the stored procedure need not be written.*/

CREATE TABLE TEMPP
(
MSG VARCHAR(30)
);

DELIMITER //
CREATE PROCEDURE PROC1(A VARCHAR(30) , B VARCHAR(30))
BEGIN 
DECLARE STRING1 VARCHAR(30);
DECLARE STRING2 VARCHAR(30);
DECLARE X VARCHAR(30);
SET STRING1 = A;
SET STRING2 = B;
SET X = SUBSTR(STRING1, 1 , 1);
IF (INSTR(STRING2 , X)) != NULL THEN
	INSERT INTO TEMPP VALUES('STRING 1 NOT FOUND IN STRING 2');
ELSE
	INSERT INTO TEMPP VALUES('STRING 1 FOUND IN STRING 2');
END IF;
END; //
DELIMITER ;

DROP PROCEDURE PROC1;
CALL PROC1('DAC' , 'CDAC');

SELECT * FROM TEMPP;
TRUNCATE TABLE TEMPP;

/* Q2. Create a stored function by the name of FUNC1 to take three parameters, the sides of a 
triangle. The function should return a Boolean value:- TRUE if the triangle is valid, FALSE 
otherwise. A triangle is valid if the length of each side is less than the sum of the lengths 
of the other two sides. Check if the dimensions entered can form a valid triangle. 
Calling program for the stored function need not be written.*/

CREATE TABLE TEMPP2
(
MSG VARCHAR(30)
);

DELIMITER //
CREATE FUNCTION FUNC1(A INT , B INT , C INT)
RETURNS BOOLEAN 
DETERMINISTIC
BEGIN
IF (A+B > C) AND (B+C > A) AND (C+A > B) THEN 
	RETURN TRUE;
ELSE  
	RETURN FALSE;
END IF; 
END; //
DELIMITER ;

-- CALLING PROCEDURE

DELIMITER //
CREATE PROCEDURE PROC2(A INT , B INT , C INT)
BEGIN
DECLARE MESSAGE VARCHAR(30);
SET MESSAGE = FUNC1(A , B , C);
INSERT INTO TEMPP2 VALUES ('VALID TRIANGLE');
END; //
DELIMITER ;

CALL PROC2(1 , 2 , 3);

SELECT * FROM TEMPP2;


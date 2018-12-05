1. SHOW TABLES
 SHOW DATABASES;
 DESC table;
 
I
 
1.
 SELECT B.*, A.*, L.* FROM Book B, Book_authors A, Library_branch L , Book_copies C
  WHERE B.book_id = C.book_id AND B.book_id = A.book_id AND L.Branch_id = C.branch_id
  
2.  SELECT card_no FROM Book_Lending WHERE date_out BETWEEN '01-JAN-2017' AND '01-JUL-2017' GROUP BY card_no HAVING COUNT(*) > 3;
  
3. DELETE FROM Book WHERE book_id = 3;
  
4. CREATE VIEW yop as SELECT pub_year FROM Book;

5. CREATE VIEW V_Books AS
    SELECT B.book, B.book_name , C.no_of_copies FROM Book B, Book_copies C WHERE B.book_id = C.book_id AND L.branch_id = C. Branch_id;
    
    
 II
 
 1. SELECT GRADE,COUNT(DISTINCT customer_id) FROM Customer WHERE grade > (Select AVG(GRADE) From Customers WHERE city = 'bangalore');
 
 2. Select salesman_id, name FROM SALESMAN A WHERE 1 < (SELECT COUNT(*) FROM CUSTOMER WHERE Saleman_id = A.Salesman_id);
 
 3. SELECT S.salesman_id, name, cust_name,commission 
 FROM Salesman,customer WHERE customer_city = salesman_city
  UNION
  SELECT salesman_id, name, 'NO MATCH', comission From salesman WHERE  NOT City = ANY(Select City from customer) ORDER BY 2 desc;
  
 4. CREATE VIEW Elite As
 	SELECT B.ord_date,A.salesman_id, A.name FROM Salesman A, Orders B WHERE A.salesman_id = B.salesman_id AND 
 	B.purchase_amt = (SELECT MAX(Purchase_Amt) FROM Orrders C WHERE C.ORD_DATE = B>ORD_DATE);
  
 5. DELETE FROM salesman Where  salesman_id = 100;
 
 
 III
 
 1. SELECT Mov_title FROM Movies WHERE dir_id = 'hitchcock';
 
 2. SELECT mov_title FROM MOVIES WHERE ACT_ID in (SELECT act_id from movie_cast GROUP BY act_id HAVING count(*)>2) GROUP BY mov_title HAVING Count(*)>1;
 
 3. SELECT Act_name, mov_title,mov_year From Actor A, Movie_cast B , Movies C WHERE A.act_id = C.act_id and C.mov_id = M.mov_id AND C.mov_year NOT BETWEEN 2000 and 2015;
 
 4. Select mov_title, MAX(rev_stars) FROM Movies INNER JOIN RATING USING (Mov_id) GROUP BY mov_title HAVING MAX(rev_stars)>0 ORDER BY Mov_title;
 
 5. UPDATE RATING SET rev_stars = 5 Where Mov_id in (Select mov_id from Movies WHERE dir_id in (Select dir_id From Director WHERE Dir_name = 'steven spielberg'));
  
  
 IV
 
 1. SELECT S.*, SS.sem, SS.sec FROM Student S, Semsec SS, Class C WHWRE S.usn = C.usn AND SS.ssid = C.ssid AND ss.sem = 4 AND SS.sec = 'C';
 
 2. SELECT SS.sem, SS.sec, S.gender, COUNT(S.GENDER) AS COUNT FROM Student S, Semsec SS, Class C 
    WHERE S.usn = C.usn AND SS.ssid = C.ssid GROUP BY SS.sem, SS.sec, S.gender ORDER BY Sem;
    
 3. CREATE VIEW stu AS SELECT test1, subcode FROM iamarks WHERE usn = '1ks16vs02';
 
 4. Update iamarks set finalia = (test1+test2+test3-least(test1,test2,test3))/2;
 
 5. SELECT S.usn, S.names, S.address, S.phone, S.gender,
 	(CASE
 		WHEN ia.finalia BETWEEN 17 AND 20 THEN 'OutSTANDING'
 		WHEN ia.finalia BETWEEN 12 AND 16 THEN 'AVERAGE'
 		ELSE 'WEAK'
 	END) As cat
	FROM Student S, Semsec SS, iamarks ia, Subject sub
	WHERE S.usn = ia.usn AND SS.ssid = ia.ssid AND sub.subcode = ia.subcode AND sub.SEM=8;	
	
	
 V
 
 1. (SELECT DISTINCT P.pno FROM Project P, Department D, Employee E
 	WHERE D.dno = E.dno AND E.Lname = 'Scott' ANND D.mgrssn = E.ssn)
 	UNION 
 	(SELECT DISTINCT P.pno FROM Project P, Works_on W, EMployee E WHERE P.pno = W.pno AND E.ssn = W.ssn AND E1.lname='scott');
 	
 2. SELECT E.fname, E.lname, 1.1*E.salary AS incr_sal FROM EMPLOYEE E, Works_on W, Project P WHERE E.ssn = W.ssn AND E.pno = P.pno AND P.pname = 'IOT';
 
 3. SELECT SUM(E.salary), Max(E.salary), AVG(E.salary), Min(E.salary) From Employee E, Department D WHERE E.dno = D.dno AND D.dname = 'ACCOUNTS';
 
 4. SLECT E.fname,E.Lname FROM Employee E WHERE NOT EXISTS ((SELECT pno from Project WHere dno='5') MINUS (SELECR pno FROM works_on WHERE E.ssn = ssn));
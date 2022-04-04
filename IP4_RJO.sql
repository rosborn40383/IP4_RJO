USE henry;
#1
SELECT firstname, lastname
FROM author;

#2
SELECT title, type
FROM book;

#3
SELECT DISTINCT publisherCode
FROM book;

#4
SELECT title, price, (price*.75)
AS discount
FROM book
LIMIT 5;

#5
SELECT title, price
FROM book
WHERE price >= 20;

#6
SELECT publisherName
FROM publisher
WHERE city='New York';

#7
SELECT publisherName
FROM publisher
WHERE city !='New York';

#8
SELECT bookCode, onHand
FROM inventory
WHERE onHand BETWEEN 2 and 4;

#9
SELECT publisherCode, COUNT(publisherCode) AS 'Penguin books'
FROM book
WHERE publisherCode ='PE'
GROUP BY publisherCode;

#10
SELECT COUNT(bookCode)
FROM book
WHERE price<=20;

#11
SELECT * FROM book
JOIN publisher AS publ
WHERE publ.publisherCode = book.publisherCode;

#12
SELECT * FROM book
JOIN publisher AS publ
ON publ.publisherCode = book.publisherCode;

#13
SELECT title, city
FROM book
JOIN publisher AS pub
ON pub.publisherCode = book.publisherCode
ORDER BY title;

#14
SELECT title, branchNum, onHand
FROM book
JOIN inventory AS inv
ON book.bookCode = inv.bookCode
ORDER BY title;

#15
SELECT title, SUM(onHand) AS Inventory
FROM inventory AS inv
JOIN book AS b
ON b.bookCode = inv.bookCode
GROUP BY title
ORDER BY Inventory DESC
LIMIT 2;

#16
SELECT firstName, lastName, title
FROM author
JOIN wrote 
ON author.authorNum = wrote.authorNum
JOIN book
ON book.bookCode = wrote.bookCode
WHERE paperback='Y'
ORDER BY lastName, title;

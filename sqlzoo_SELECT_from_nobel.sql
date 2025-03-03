--nobel Nobel Laureates
--We continue practicing simple SQL queries on a single table.

--This tutorial is concerned with a table of Nobel prize winners:

--nobel(yr, subject, winner)
--Using the SELECT statement.
--Change the query shown so that it displays Nobel prizes for 1950.
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

--1962 Literature
--Show who won the 1962 prize for literature.
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'literature'

--Albert Einstein
--Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject 
 FROM nobel 
WHERE winner = 'Albert Einstein'

--Recent Peace Prizes
--Give the name of the 'peace' winners since the year 2000, including 2000.
SELECT winner 
 FROM nobel 
WHERE subject = 'peace' AND yr >= 2000

--Literature in the 1980's
--Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.
SELECT yr, subject, winner 
FROM nobel 
WHERE subject = 'Literature' 
AND yr BETWEEN 1980 AND 1989

--Only Presidents
--Show all details of the presidential winners:

--Theodore Roosevelt
--Thomas Woodrow Wilson
--Jimmy Carter
--Barack Obama
SELECT yr, subject, winner FROM nobel 
WHERE subject = 'Peace' 
AND winner = 'Woodrow Wilson' 
OR winner = 'Theodore Roosevelt' 
OR winner = 'Jimmy Carter' 
OR winner = 'Barack Obama' 

--John
--Show the winners with first name John
SELECT winner FROM nobel WHERE winner LIKE 'JOHN%'

--Chemistry and Physics from different years
--Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984.
SELECT yr, subject, winner 
FROM nobel 
WHERE subject = 'physics' and yr = 1980 
OR subject = 'Chemistry' AND yr = 1984


--Exclude Chemists and Medics
--Show the year, subject, and name of winners for 1980 excluding chemistry and medicine
SELECT yr, subject, winner 
FROM nobel 
WHERE yr = 1980 AND subject NOT IN ('Chemistry')

--Early Medicine, Late Literature
--Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
SELECT yr, subject, winner 
FROM nobel 
WHERE subject = 'Medicine' AND yr < 1910 
OR subject = 'Literature' AND yr >= 2004

--Harder Questions

--Umlaut
--Find all details of the prize won by PETER GRÜNBERG
SELECT yr, subject, winner 
FROM nobel 
WHERE winner = 'PETER GRÜNBERG'

--Apostrophe
--Find all details of the prize won by EUGENE O'NEILL
SELECT yr, subject, winner 
FROM nobel 
WHERE winner LIKE 'EUGENE O%'

--Knights of the realm
--Knights in order
--List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'sir%'
ORDER BY yr DESC, winner

--The expression subject IN ('chemistry','physics') can be used as a value - it will be 0 or 1.
--Show the 1984 winners and subject ordered by subject and winner name; but list chemistry and physics last.
SELECT winner, subject, subject IN ('Physics','Chemistry')
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('Physics','Chemistry'),subject,winner
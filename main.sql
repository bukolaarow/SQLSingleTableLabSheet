
-- Single Table Lab Sheet

CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20), species VARCHAR(20), sex CHAR(1), checkups SMALLINT UNSIGNED, birth DATE, death DATE);
INSERT INTO pet (name,owner,species,sex,checkups,birth,death)VALUES
('Fluffy','Harold','cat','f',5,'2001-02-04',NULL),
('Claws','Gwen','cat','m',2,'2000-03-17',NULL),
('Buffy','Harold','dog','f',7,'1999-05-13',NULL),
('Fang','Benny','dog','m',4,'2000-08-27',NULL),
('Bowser','Diane','dog','m',8,'1998-08-31','2001-07-29'),
('Chirpy','Gwen','bird','f',0,'2002-09-11',NULL),
('Whistler','Gwen','bird','',1,'2001-12-09',NULL),
('Slim','Benny','snake','m',5,'2001-04-29',NULL);

SELECT * FROM pet;

SELECT * FROM pet WHERE sex = "m";

SELECT DISTINCT owner FROM pet; 

SELECT owner, name FROM pet WHERE sex = "f";

SELECT name, birth FROM pet WHERE species = "dog";
SELECT owner FROM pet WHERE species = "bird";
SELECT * FROM pet WHERE sex = "f";
SELECT * FROM pet WHERE sex = "F";
SELECT name, birth FROM pet WHERE species = "cat" OR species = "bird" ;

SELECT name, species FROM pet WHERE (species = "cat" OR species = "bird") AND sex = "f";

SELECT name FROM pet WHERE sex < "m";

SELECT owner,species FROM pet WHERE name LIKE '%er' OR name LIKE '%all';

SELECT name FROM pet WHERE owner LIKE '%e%';

SELECT name FROM pet WHERE name NOT LIKE '%fy%';

SELECT name FROM pet WHERE LENGTH(owner) = 4;

SELECT DISTINCT owner FROM pet WHERE SUBSTRING(UPPER(owner), 1, 1) IN ('A', 'B', 'C', 'D', 'E') AND SUBSTRING(UPPER(owner), -1, 1) IN ('A', 'B', 'C', 'D', 'E');

SELECT name FROM pet WHERE strftime('%m',birth) = strftime('%m', 'now', '-1 month');

SELECT name, strftime('%m', birth) FROM pet;
SELECT name, strftime('%m', birth)AS Month FROM pet;

SELECT owner, name, (checkups * 20) AS income FROM pet;

SELECT owner, name, birth, MIN(strftime('%Y',birth)) AS birth FROM pet
GROUP BY owner;

SELECT owner, AVG(checkups) AS avg_checkups FROM pet GROUP BY owner;

SELECT species, COUNT(*) AS pet_count
FROM pet
GROUP BY species
ORDER BY pet_count ASC;

SELECT owner, species, COUNT(*) AS pet_count
FROM pet
GROUP BY owner, species
ORDER BY owner, species;

SELECT owner, COUNT(DISTINCT species) AS distinct_species_count
FROM pet
GROUP BY owner;

SELECT sex, COUNT(*) AS count
FROM pet
WHERE sex IN ('m', 'f')
GROUP BY sex;

SELECT owner, COUNT(*) AS bird_count
FROM pet
WHERE species = 'bird'
GROUP BY owner;

SELECT owner,
       COUNT(CASE WHEN species = 'bird' THEN 1 END) AS bird_count
FROM pet
GROUP BY owner;

SELECT owner, SUM(checkups) AS total_checkups
FROM pet
GROUP BY owner;

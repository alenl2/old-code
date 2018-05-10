USE seminarska;

-- 1a
DROP TABLE IF EXISTS pleme;
CREATE TABLE pleme(tid INT PRIMARY KEY, tribe VARCHAR(100));
INSERT INTO pleme(tid, tribe) VALUES (1,"Rimljani"), (2,"Tevtoni"), (3,"Galci"), (4,"Narava"), (5,"Natarji");
-- 1b
DROP TABLE IF EXISTS aliansa;
CREATE TABLE aliansa(aid INT PRIMARY KEY, alliance VARCHAR(100));
INSERT INTO aliansa (aid, alliance) SELECT DISTINCT aid, alliance FROM x_world;
-- 1c
DROP TABLE IF EXISTS igralec;
CREATE TABLE igralec(pid INT PRIMARY KEY, player VARCHAR(100), tid INT, aid INT, FOREIGN KEY(tid) REFERENCES pleme(tid), FOREIGN KEY(aid) REFERENCES aliansa(aid));
INSERT INTO igralec SELECT DISTINCT pid, player, tid, aid FROM x_world ORDER BY  pid;
-- 1d
DROP TABLE IF EXISTS naselje;
CREATE TABLE naselje(id INT PRIMARY KEY, x INT, y INT, vid INT, village VARCHAR(100), population INT, pid INT,FOREIGN KEY(pid) REFERENCES igralec(pid));
INSERT INTO naselje SELECT DISTINCT id, x , y, vid , village , population , pid FROM x_world ORDER BY id;

-- 2a
DROP VIEW IF EXISTS x_view;
CREATE VIEW x_view AS SELECT * FROM naselje NATURAL JOIN aliansa NATURAL JOIN igralec;
-- 2b
SELECT * FROM x_world;
SELECT * FROM x_world WHERE NOT EXISTS (SELECT * FROM x_view);
-- 2c
DROP TABLE IF EXISTS top10;
CREATE TABLE top10(alliance VARCHAR(100) PRIMARY KEY, SteviloNaselij INT);
INSERT INTO top10(alliance, SteviloNaselij) SELECT alliance, COUNT(*) AS stNaselji FROM aliansa NATURAL JOIN igralec NATURAL JOIN naselje WHERE aid!=0 GROUP BY aid ORDER BY stNaselji DESC LIMIT 0,10;
CREATE TRIGGER novoNaselje AFTER INSERT ON naselje FOR EACH ROW INSERT INTO top10(alliance, SteviloNaselij) SELECT alliance, COUNT(*) AS stNaselji FROM aliansa NATURAL JOIN igralec NATURAL JOIN naselje WHERE aid!=0 GROUP BY aid ORDER BY stNaselji DESC;
SELECT * FROM seminarska.top10;

-- 3a
SELECT pid, player, village, population FROM naselje NATURAL JOIN igralec WHERE population=(SELECT MAX(population) FROM naselje);
-- 3b
SELECT player, SUM(population)/COUNT(*) AS ratio FROM naselje NATURAL JOIN igralec GROUP BY pid ORDER BY ratio DESC LIMIT 0,1;
-- 3c
SELECT id, vid, x, y, village, population, aid FROM igralec NATURAL JOIN naselje WHERE aid=0 ORDER BY population DESC;
-- 3d
SELECT tid, tribe FROM igralec NATURAL JOIN naselje NATURAL JOIN pleme GROUP BY tid ORDER BY SUM(population) DESC LIMIT 0,1;
-- 3e
SELECT COUNT(*) AS nadpovprecnoMocnih FROM(SELECT sum(population) AS p FROM igralec NATURAL JOIN aliansa NATURAL JOIN naselje GROUP BY aid) AS s  WHERE s.p>(SELECT AVG(s.p) FROM (SELECT SUM(population) as p FROM igralec NATURAL JOIN aliansa NATURAL JOIN naselje GROUP BY aid) as s);
-- 3f
SET @zapSt:=0;
UPDATE naselje SET village = concat('la Rochelle ',CAST(@zapSt:=@zapSt+1 AS CHAR)) WHERE pid=(SELECT pid FROM igralec WHERE player='Aramis') ORDER BY population DESC;
SELECT population, village, pid FROM naselje WHERE village REGEXP 'la Rochelle *' ORDER BY population DESC;
-- 3g
DROP FUNCTION IF EXISTS stIGralcev;
DELIMITER |
CREATE FUNCTION stIgralcev (i INT, j INT) RETURNS INT
BEGIN
DECLARE vrni INT;
IF NOT(i>400 OR j>400 OR i<-400 OR j<-400) THEN 
SELECT SUM(population) INTO vrni FROM naselje WHERE (x BETWEEN i AND i+9) AND (y BETWEEN j AND j+9); 
END IF;
RETURN vrni;
END; |
DELIMITER ;
SELECT stIGralcev(0,100);
-- 3h
DROP FUNCTION IF EXISTS stIGralcevKvadrat;
DELIMITER |
CREATE FUNCTION stIgralcevKvadrat (x1 INT, y1 INT, x2 INT, y2 INT) RETURNS INT
BEGIN
DECLARE vrni INT;
IF NOT(x1>400 OR x1>400 OR y1<-400 OR y1<-400 OR x2>400 OR x2>400 OR y2<-400 OR y2<-400) THEN
SELECT COUNT(*) INTO vrni FROM (SELECT SUM(population) FROM naselje WHERE (x BETWEEN x1 AND x2) AND (y BETWEEN y1 AND y2)) AS x; 
END IF;
RETURN vrni;
END; |
DELIMITER ;
SELECT stIGralcevKvadrat(0,0,100,100);
-- 3i
CREATE INDEX naselja ON naselje(x,y,population) USING HASH;
-- 3j
SELECT * FROM (SELECT pid, player, SUM(population)/COUNT(*) AS ratio FROM naselje NATURAL JOIN igralec GROUP BY pid)AS x WHERE x.ratio<=3;

-- 4
SELECT topAid, x, y, gostota, alliance FROM gostote g, aliansa a WHERE g.topAid=a.aid ORDER BY gostota DESC;
/*
Population
*/
DROP TABLE IF EXISTS population;

CREATE TABLE population 
(
  country varchar(100) NOT NULL,
  year int NOT NULL,
  population int NOT NULL
);

SELECT * FROM population;

LOAD DATA LOCAL INFILE 'C:/Users/vbrio/Documents/Cuny/DATA_607/tb/population.csv' 
INTO TABLE population
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

SELECT COUNT(*) FROM population;
# Analysis on structure of tb and population

# Are all the countries matching by name
select distinct country from tb tb
where not exists (select po.country from population po where tb.country = po.country);

select distinct country from population po
where not exists (select tb.country from tb tb where tb.country = po.country);

# Are all the country/year combination matching
select distinct country, year from tb tb
where not exists (select po.country, po.year from population po where tb.country = po.country and tb.year = po.year);

select distinct country, year from population po
where not exists (select tb.country, tb.year from tb tb where tb.country = po.country and tb.year = po.year);

# Are there unexpected years?
select distinct country, count(*) from tb 
where year not in (1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013);

# Is there unknown value for gender?
select country, sex, count(*) from tb
where sex not in ('female', 'male')
group by country, sex;


# Join tb and population and create .csv file, change NULL to -999
select tb.country, tb.year, tb.sex, IFNULL(tb.adult, -999), IFNULL(tb.child, -999), IFNULL(tb.elderly, -999) , po.population as population from tb tb 
inner join population po
on tb.country = po.country
and tb.year = po.year

INTO OUTFILE 'tb_population.csv'
FIELDS ENCLOSED BY '"' 
TERMINATED BY ';' 
ESCAPED BY '"' 
LINES TERMINATED BY '\r\n';



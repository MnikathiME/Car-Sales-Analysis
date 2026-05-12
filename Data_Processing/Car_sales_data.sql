SELECT *
FROM `car`.`sales`.`dataset`;

------------------------------------------------------------------------
SELECT DISTINCT (make) AS carmake
FROM `car`.`sales`.`dataset`;
--Checking the cars start year--
SELECT MIN(year)AS first_year,
      MAX(year)AS Last_year
FROM `car`.`sales`.`dataset`;
--Start year is 1982
--last year is 2015
------------------------------------------------------------------------
--different car conditions
SELECT DISTINCT (condition) AS car_condition
FROM `car`.`sales`.`dataset`;
-------------------------------------------------------------------------
--Checking all rows if there is any NULLS. Result was NO Nulls--
SELECT *
FROM `car`.`sales`.`dataset`
WHERE year IS NULL AND
      make IS NULL AND
      trim IS NULL AND
      body IS NULL AND
      transmission IS NULL AND
      vin IS NULL AND
      state IS NULL AND
      condition IS NULL AND
      odometer IS NULL AND
      color IS NULL AND
      interior IS NULL AND
      seller IS NULL AND
      mmr IS NULL AND
      sellingprice IS NULL AND
      saledate IS NULL;


--NO NULLS FOUND
-------------------------------------------------------------------------------
--Checking Date--
SELECT  saledate,
RIGHT(saledate, 8) AS sale_time,
LEFT(saledate,3) AS Day_of_week,
SUBSTRING(saledate, 5,11) AS sale_date
FROM `car`.`sales`.`dataset`;


--------------------------------------------------------------------------------
--Checking total sellingprice 7606367587
SELECT SUM(try_cast(sellingprice AS DOUBLE)) AS total_price
FROM `car`.`sales`.`dataset`;

--Total= 7606367587
---------------------------------------------------------------------------------
--Checking the number of each car
SELECT COUNT(DISTINCT (vin)) AS Number_of_cars
FROM `car`.`sales`.`dataset`;

--Total= 550298
--------------------------------------------------------------------------------
--Checking if any duplicate on the table
SELECT COUNT (DISTINCT *) AS Number_of_rows,
      COUNT(DISTINCT vin) AS Number_of_cars
FROM `car`.`sales`.`dataset`;

--Total number of rows= 558837 and Total number of unique car= 550298
---------------------------------------------------------------------------------
--Checking most expensive car
SELECT MIN(try_cast(sellingprice AS DOUBLE)) AS Cheap_car,
      MAX(try_cast(sellingprice AS DOUBLE)) AS Expensive_car
FROM `car`.`sales`.`dataset`;

---------------------------------------------------------------------
--Long query
SELECT DISTINCT(vin)AS Unique_vin,
      condition,
      year,
      make,
      model,
      trim,
      body,
      transmission,
      state,
      odometer,
      color,
      interior,
      seller,
      mmr,
      sellingprice,
      RIGHT(saledate, 8) AS sale_time,
LEFT(saledate,3) AS Day_of_week,
SUBSTRING(saledate, 5,11) AS sale_date,

CASE 
WHEN try_cast(sellingprice AS DOUBLE) BETWEEN 0 AND 30000 THEN 'cheap'
WHEN try_cast(sellingprice AS DOUBLE) BETWEEN 30001 AND 60000 THEN 'medium'
ELSE 'expensive'
END AS Price_category,

CASE 
WHEN try_cast(odometer AS BIGINT) BETWEEN 0 AND 45000 THEN 'low_mileage'
WHEN try_cast(odometer AS BIGINT) BETWEEN 45001 AND 100000 THEN 'medium_mileage'
ELSE 'high_mileage'
END AS mileage_category,

CASE 
WHEN year BETWEEN 1982 AND 2000 THEN 'old'
WHEN year BETWEEN 2001 AND 2010 THEN 'avarage'
ELSE 'new'
END AS Car_type

FROM `car`.`sales`.`dataset`;

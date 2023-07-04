select comfort_food from food;


#update text data to "nan"
UPDATE food 
SET 
    GPA = 'nan'
WHERE
    GPA IN  ('Unknown','Personal');

UPDATE food 
SET 
    GPA = '3.79'
WHERE
    GPA = '3.79 bitch';

/*UPDATE food 
SET 
    GPA = 'nan'
WHERE
    GPA like '%Unknown&' or GPA like '%Personal%';
 */
 
 #to make  data  consistent
 UPDATE food SET 
comfort_food = LOWER(comfort_food);

#update cleaning comfort_food
UPDATE food SET 
comfort_food = REPLACE (comfort_food,", and",",")
WHERE comfort_food LIKE '%, and%';

UPDATE food SET 
comfort_food = REPLACE (comfort_food,". ",",")
WHERE comfort_food LIKE '%. %';

UPDATE food SET 
comfort_food = REPLACE (comfort_food,"-"," ")
WHERE comfort_food LIKE '%-%';

UPDATE food SET 
comfort_food = REPLACE (comfort_food,"/",",")
WHERE comfort_food LIKE '%/%';

UPDATE food SET 
comfort_food = REPLACE (comfort_food,", &",",")
WHERE comfort_food LIKE '%, &%';

UPDATE food 
SET 
    comfort_food = TRIM(comfort_food);

#Delete dot(.) and comma(,) in last string

SELECT 
    comfort_food AS 'Before', comfort_food_1 AS 'After'
FROM
    food
WHERE
    RIGHT(comfort_food_1, 1) IN (',' , '.');

/*gawe sc comfort_food sek lur ojok lali
#update food set 
#comfort_food_1 = comfort_food;
*/

UPDATE food 
SET 
    comfort_food = CONCAT(SUBSTRING(comfort_food,1,LENGTH(comfort_food) - 1),'')
WHERE
    RIGHT(comfort_food, 1) IN (',' , '.','');

##split

select comfort_food from food
order by comfort_food asc;

select 
SUBSTRING_INDEX(comfort_food,',',1) as comfort_food,
CASE WHEN LENGTH(comfort_food) - LENGTH(REPLACE(comfort_food, ',', '')) >= 1 THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(comfort_food, ',', 2), ',', -1)) ELSE null END AS comfort_food2,
CASE WHEN LENGTH(comfort_food) - LENGTH(REPLACE(comfort_food, ',', '')) >= 2 THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(comfort_food, ',', 3), ',', -1)) ELSE null END comfort_food3,
CASE WHEN LENGTH(comfort_food) - LENGTH(REPLACE(comfort_food, ',', '')) >= 3 THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(comfort_food, ',', 4), ',', -1)) ELSE null END comfort_food4,
CASE WHEN LENGTH(comfort_food) - LENGTH(REPLACE(comfort_food, ',', '')) >= 4 THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(comfort_food, ',', 5), ',', -1)) ELSE null END comfort_food5,
CASE WHEN LENGTH(comfort_food) - LENGTH(REPLACE(comfort_food, ',', '')) >= 5 THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(comfort_food, ',', 6), ',', -1)) ELSE null END comfort_food6
from food;

#columns 2
select
distinct(CASE WHEN LENGTH(comfort_food) - LENGTH(REPLACE(comfort_food, ',', '')) >= 1 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(comfort_food, ',', 2), ',', -1) ELSE null END) AS comfort_food2
from food
order by comfort_food2 asc;

#columns 3
select
distinct(CASE WHEN LENGTH(comfort_food) - LENGTH(REPLACE(comfort_food, ',', '')) >= 2 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(comfort_food, ',', 3), ',', -1) ELSE null END) AS comfort_food3
from food
order by comfort_food3 asc;

#columns 6
select
distinct(CASE WHEN LENGTH(comfort_food) - LENGTH(REPLACE(comfort_food, ',', '')) >= 5 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(comfort_food, ',', 6), ',', -1) ELSE null END) AS comfort_food5
from food
order by comfort_food5 asc;

select 
distinct(SUBSTRING_INDEX(comfort_food,',',1)) as comfort_food
from food
order by comfort_food asc;

#macaroni & cheese ---> convert all terms into a consistent form
UPDATE food 
SET 
    comfort_food = REPLACE(comfort_food,
        'mac and cheese',
        'macaroni & cheese')
WHERE
    comfort_food LIKE '%mac and cheese%';

UPDATE food 
SET 
    comfort_food = REPLACE(comfort_food,
        'mac & cheese',
        'macaroni & cheese')
WHERE
    comfort_food LIKE '%mac & cheese%';

UPDATE food 
SET 
    comfort_food = REPLACE(comfort_food,
        'mac in cheese',
        'macaroni & cheese')
WHERE
    comfort_food LIKE '%mac in cheese%';

UPDATE food 
SET 
    comfort_food = REPLACE(comfort_food,
        'mac n cheese',
        'macaroni & cheese')
WHERE
    comfort_food LIKE '%mac n cheese%';

UPDATE food 
SET 
    comfort_food = REPLACE(comfort_food,
        'macaroni and cheese',
        'macaroni & cheese')
WHERE
    comfort_food LIKE '%macaroni and cheese%';

UPDATE food 
SET 
    comfort_food = REPLACE(comfort_food,
        'burgers',
        'burger')
WHERE
    comfort_food LIKE '%burgers%';

UPDATE food 
SET 
    comfort_food = REPLACE(comfort_food,
        'chinese food',
        'chinese')
WHERE
    comfort_food LIKE '%chinese food%';
 
UPDATE food 
SET 
    comfort_food = REPLACE(comfort_food,
        'chocolate bar',
        'chocolate')
WHERE
    comfort_food LIKE '%chocolate bar%';

UPDATE food 
SET 
    comfort_food = REPLACE(comfort_food,
        'chocolates',
        'chocolate')
WHERE
    comfort_food LIKE '%chocolates%';


SELECT 
    LENGTH(comfort_food) - LENGTH(REPLACE(comfort_food, ' ', '')) AS 'spasi',
    comfort_food
FROM
    food
    where comfort_food NOT like '%,%' and LENGTH(comfort_food) - LENGTH(REPLACE(comfort_food, ' ', '')) <> 0

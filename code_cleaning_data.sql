select GPA from food
where GPA = 'Personal ';

select comfort_food, right(comfort_food,1) from food
where right(comfort_food,1) = ',';


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


update food set 
comfort_food = trim(comfort_food);

#Delete dot(.) and comma(,) in last string

select comfort_food as 'Before',comfort_food_copy1 as 'After' from food
WHERE right(comfort_food_copy1,1) in (',','.');


update food set 
comfort_food_copy1 = comfort_food;

UPDATE food
SET comfort_food = CONCAT(SUBSTRING(comfort_food, 1, LENGTH(comfort_food) - 1), '')
WHERE right(comfort_food,1) in (',','.','\n');

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

select 
distinct(CASE WHEN LENGTH(comfort_food) - LENGTH(REPLACE(comfort_food, ',', '')) >= 1 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(comfort_food, ',', 2), ',', -1) ELSE null END) AS comfort_food2
from food
order by comfort_food2 asc;

select 
distinct(SUBSTRING_INDEX(comfort_food,',',1)) as comfort_food
from food
order by comfort_food asc;

#macaroni & cheese ---> convert all terms into a consistent form
UPDATE food
SET comfort_food = REPLACE(comfort_food, 'mac and cheese', 'macaroni & cheese')
WHERE comfort_food LIKE '%mac and cheese%';

UPDATE food
SET comfort_food = REPLACE(comfort_food, 'mac & cheese', 'macaroni & cheese')
WHERE comfort_food LIKE '%mac & cheese%';

UPDATE food
SET comfort_food = REPLACE(comfort_food, 'mac in cheese', 'macaroni & cheese')
WHERE comfort_food LIKE '%mac in cheese%';

UPDATE food
SET comfort_food = REPLACE(comfort_food, 'mac n cheese', 'macaroni & cheese')
WHERE comfort_food LIKE '%mac n cheese%';

UPDATE food
SET comfort_food = REPLACE(comfort_food, 'macaroni and cheese', 'macaroni & cheese')
WHERE comfort_food LIKE '%macaroni and cheese%';

#burger
UPDATE food
SET comfort_food = REPLACE(comfort_food, 'burgers', 'burger')
WHERE comfort_food LIKE '%burger%';

#chinese
UPDATE food
SET comfort_food = REPLACE(comfort_food, 'chinese food', 'chinese')
WHERE comfort_food LIKE '%chinese%';
 

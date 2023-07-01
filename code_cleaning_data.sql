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

select comfort_food as 'Before',comfort_food_copy1 as 'After' from food
WHERE right(comfort_food_copy1,1) in (',','.');

update food set 
comfort_food_copy1 = comfort_food;


UPDATE food
SET comfort_food = CONCAT(SUBSTRING(comfort_food, 1, LENGTH(comfort_food) - 1), '')
WHERE right(comfort_food,1) in (',','.');

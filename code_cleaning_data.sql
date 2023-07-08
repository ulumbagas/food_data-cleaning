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

UPDATE food 
SET 
    comfort_food = REPLACE(comfort_food,
        'pretzals',
        'pretzels')
WHERE
    comfort_food LIKE '%pretzals%';
    
UPDATE food 
SET 
    comfort_food = REPLACE(comfort_food,
        'icecream',
        'ice cream')
WHERE
    comfort_food LIKE '%icecream%';
    
UPDATE food 
SET 
    comfort_food = REPLACE(comfort_food,
        'fires',
        'fries')
WHERE
    comfort_food LIKE '%fires%';


SELECT 
    LENGTH(comfort_food) - LENGTH(REPLACE(comfort_food, ' ', '')) AS 'spasi',
    comfort_food_1
FROM
    food
    where comfort_food_1 not like '%,%' and comfort_food_1 not like '%none%' and comfort_food_1 not like '%nan%';

SELECT 
    comfort_food_1  'before', comfort_food 'fater'
FROM
    food
    where comfort_food_1 not like '%,%' and comfort_food_1 not like '%none%' and comfort_food_1 not like '%nan%';
    
select replace(comfort_food,'pizza chocolate chips bagels ice capps','pizza,chocolate,chips,bagels,ice capps') as oke, comfort_food from food;
    
UPDATE food 
SET 
    comfort_food = REPLACE(comfort_food,
        'candy
        pop
        chocolate 
        chipotle 
        moe\'s',
        'candy,pop,chocolate,chipotle,moe\'s')
WHERE
    comfort_food = 'candy
    pop
    chocolate 
    chipotle 
    moe\'s';

UPDATE food 
SET 
    comfort_food = REPLACE(comfort_food,
        'pizza chocolate chips bagels ice capps',
        'pizza,chocolate,chips,bagels,ice capps')
WHERE
    comfort_food = 'pizza chocolate chips bagels ice capps';

UPDATE food 
SET 
    comfort_food = REPLACE(comfort_food,
        'pizza cookies steak',
        'pizza,cookies,steak')
WHERE
    comfort_food = 'pizza cookies steak';

UPDATE food 
SET 
    comfort_food = REPLACE(comfort_food,
        'chips sweets popcorn',
        'chips,sweets popcorn')
WHERE
    comfort_food = 'chips sweets popcorn';
    
UPDATE food 
SET 
    comfort_food = REPLACE(comfort_food,
        'nan',
        'none')
WHERE
    comfort_food = 'nan';

UPDATE food 
SET 
    comfort_food = REPLACE(comfort_food,
        'pizza, doughnuts, mcdonalds','pizza, donuts, mcdonalds')
WHERE
    comfort_food = 'pizza, doughnuts, mcdonalds';
    
#column cook
UPDATE food 
SET 
    cook = REPLACE(cook,
        ' special occasions',
        'nan')
WHERE
    cook = ' special occasions';

select comfort_food from food;
#where comfort_food = 'none'

#column comfort_food_reasons
UPDATE food 
SET 
    comfort_food_reasons = trim(comfort_food_reasons);

UPDATE food 
SET 
    comfort_food_reasons = lower(comfort_food_reasons);

#fixed inconsistent

UPDATE food 
SET 
    comfort_food_reasons = REPLACE(comfort_food_reasons,', and', ',')
WHERE
    comfort_food_reasons like '%, and%';

UPDATE food 
SET 
    comfort_food_reasons = REPLACE(comfort_food_reasons,' and ', ',')
WHERE
    comfort_food_reasons like '% and %';   

UPDATE food 
SET 
    comfort_food_reasons = REPLACE(comfort_food_reasons,'/', ',')
WHERE
    comfort_food_reasons like '%/%';  

UPDATE food 
SET 
    comfort_food_reasons = REPLACE(comfort_food_reasons,'. ', ',')
WHERE
    comfort_food_reasons like '%.%';

#hapus last string dot
UPDATE food 
SET 
    comfort_food_reasons = CONCAT(SUBSTRING(comfort_food_reasons,1,LENGTH(comfort_food_reasons) - 1),'')
WHERE
    RIGHT(comfort_food_reasons, 1) IN ('.',' ');


#split
update food set
comfort_food_reasons = replace(comfort_food_reasons,'boredom comfort hunger','boredom,comfort,hunger')
where comfort_food_reasons like '%boredom comfort hunger%';

update food
set
CFS1= SUBSTRING_INDEX(comfort_food_reasons,',',1),
CFS2= CASE WHEN LENGTH(comfort_food_reasons) - LENGTH(REPLACE(comfort_food_reasons, ',', '')) >= 1 THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(comfort_food_reasons, ',', 2), ',', -1)) ELSE null END,
CFS3= CASE WHEN LENGTH(comfort_food_reasons) - LENGTH(REPLACE(comfort_food_reasons, ',', '')) >= 2 THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(comfort_food_reasons, ',', 3), ',', -1)) ELSE null END;

select comfort_food_reasons from food;

select CFS1,CFS2,CFS3,comfort_food_reasons_coded from food;

select CFS1, SUBSTRING_INDEX(comfort_food_reasons,',',1) 'before' from food;

select distinct(CFS1) from food;

update food set
CFS1 = 'stress'
where CFS1 like '%stres%';

update food set
CFS1 = 'boredom'
where CFS1 like '%bored%';

update food set
CFS1 = 'boredom'
where CFS1 like '%bord%';

update food set
CFS2 = null
where CFS2 like '%depre%';

update food set
CFS1 = 'depression or sadness'
where CFS1 like '%sad%';

update food set
CFS1 = 'hunger'
where CFS1 like '%hungry%';

update food set
CFS1 = 'laziness'
where CFS1 like '%laz%';

update food set
CFS1 = 'happiness'
where CFS1 like '%happiness%';

update food set
CFS2 = 'watching tv'
where CFS2 like '%watching tv%';

update food set
CFS1 = 'none'
where CFS1 like 'we dont have comfort' or CFS1 like 'nan' or CFS1 like 'no reasons' or CFS1 like 'just cause';

#CFS2


update food set
CFS2 = 'stress'
where CFS2 like '%stres%';

update food set
CFS2 = 'boredom'
where CFS2 like '%bored%';

update food set
CFS2 = 'boredom'
where CFS2 like '%bord%';

update food set
CFS2 = null
where CFS2 like '%depre%';

update food set
CFS2 = 'depression or sadness'
where CFS2 like '%sad%';

update food set
CFS2 = 'hunger'
where CFS2 like '%hungry%';

update food set
CFS2 = 'laziness'
where CFS2 like '%laz%';

update food set
CFS2 = 'happiness'
where CFS2 like '%happiness%';

update food set
CFS2 = 'watching tv'
where CFS2 like '%watching tv%';

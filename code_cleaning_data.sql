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

select CFS1,CFS2,CFS3,comfort_food_reasons from food;

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

#csf3

update food set
CFS3 = 'stress'
where CFS3 like '%stres%';

update food set
CFS3 = 'boredom'
where CFS3 like '%bored%';

update food set
CFS3 = 'boredom'
where CFS3 like '%bord%';

update food set
CFS3 = null
where CFS3 like '%depre%';

update food set
CFS3 = 'depression or sadness'
where CFS3 like '%sad%';

update food set
CFS3 = 'hunger'
where CFS3 like '%hungry%';

update food set
CFS3 = 'laziness'
where CFS3 like '%laz%';

update food set
CFS3 = 'happiness'
where CFS3 like '%happiness%';

update food set
CFS3 = 'watching tv'
where CFS3 like '%watching tv%';

select comfort_food_reasons_coded from food;

select CFS1,comfort_food_reasons_coded from food;

UPDATE food 
SET 
    comfort_food_reasons_coded = CASE
        WHEN CFS1 = 'stress' THEN 1
        WHEN CFS1 = 'boredom' THEN 2
        WHEN CFS1 = 'depression or sadness' THEN 3
        WHEN CFS1 = 'hunger' THEN 4
        WHEN CFS1 = 'laziness' THEN 5
        WHEN CFS1 = 'cold weather' THEN 6
        WHEN CFS1 = 'happiness' THEN 7
        WHEN CFS1 = 'watching tv' THEN 8
        WHEN CFS1 = 'none' THEN 9
        else 'nan'
    END;

#update code iki sek mari ngunu where unhealthy tok gawe keterangan 'other' lan unhealthy

update food set 
diet_current = diet_current_1;

select diet_current, diet_current_1 from food;

select count(diet_current) from food
where diet_current like '%not%';


select diet_current from food
where diet_current like '%healthy%' and diet_current not like '%unhealthy%' and diet_current not like '%not%'; #not healthy, eat good, vegetable, not

select diet_current from food
where diet_current like '%not healt%';

select diet_current from food
where diet_current like '%balance%' and diet_current not like '%unbalan%';

select diet_current from food
where diet_current like '%modera%';

select diet_current from food
where diet_current like '%cheap%';

select diet_current from food
where diet_current like '%lot%';


#update diet_current;
update food set
diet_current = 'healthy/balanced/moderated'
where  diet_current like '%healthier%' or diet_current like '%healthy%' and diet_current not like '%unhealthy%' and diet_current not like '%not%';

update food set
diet_current = 'healthy/balanced/moderated'
 where diet_current not like '%unbalan%' and  diet_current like '%balance%' or diet_current like '%moderat%';

update food set
diet_current = 'healthy/balanced/moderated' 
 where diet_current not like '%balance%' and diet_current like '%healt%' and diet_current not like '%not%' and diet_current not like '%unheal%';

update food set
diet_current = 'healthy/balanced/moderated' 
where diet_current like '%healthy diet%';

update food set
diet_current = 'unhealthy/cheap/too much/random' 
where diet_current not like '%balanc%' and diet_current like '%unhealth%' or diet_current like '%random%';

update food set
diet_current = 'unclear'
where diet_current like '%healthy food%';

update food set
diet_current = 'healthy/balanced/moderated' 
where diet_current like '%somewhat healthy%';

update food set
diet_current = 'unhealthy/cheap/too much/random' 
where diet_current not like '%random%' and diet_current not like '%balanc%' and diet_current like '%heal%';

update food set
diet_current = 'unhealthy/cheap/too much/random' 
where diet_current like '%unbala%';

update food set
diet_current = 'healthy/balanced/moderated'
where diet_current like '%vege%' or diet_current like '%prote%';

update food set
diet_current = 'unhealthy/cheap/too much/random' 
where diet_current like '%not%';

#College diet, cheap and easy foods most nights. Weekends traditionally, cook better homemade meals 
update food set
diet_current = 'unclear' 
where diet_current not like '%unhealth%' and diet_current like '%cheap%';

update food set
diet_current = 'unclear' 
where diet_current like '%no diet%';

update food set
diet_current = 'healthy/balanced/moderated' 
where diet_current like '%fruit%' or diet_current like '%good%' or diet_current like '%salad%' ;

#'My current diet would be considered a \"college diet\"\". I eat a lot of pizza and ramen noodles. \"'
update food set
diet_current = 'unhealthy/cheap/too much/random' 
where diet_current like '%pizza%' or diet_current like '%carb%' or diet_current like '%don\'t%';

update food set
diet_current = 'unclear' 
where diet_current like '%lunch and dinner%' or diet_current like '%what%' or diet_current like '%food%';

update food set
diet_current = 'healthy/balanced/moderated' 
where diet_current like '%sandwich%' or diet_current like '%rice%' or diet_current like '%egan%' or diet_current like '%eat very heat%';

update food set
diet_current = 'unclear' 
where diet_current not like '%healt%' and diet_current not like '%unclear%';

#diet_current_coded
update food set diet_current_coded =
case 
when diet_current = 'healthy/balanced/moderated' then 1
when diet_current = 'unhealthy/cheap/too much/random/' then 2
else '3' end;

#update drink
update food set
drink = 'nan'
where drink like '%my diet%';

update food set
eating_changes = trim(eating_changes),
eating_changes = lower(eating_changes);

select eating_changes_coded1 from food;

update food set
eating_changes_coded1 = 10
where eating_changes_coded1 = 0;

select distinct(eating_out) from food;

select distinct(employment) from food;

update food set
employment = 4
where employment = 'nan' or employment = 5;

select distinct(ethnic_food) from food;

select distinct(exercise) from food;

select distinct(father_education) from food;

#father_profession
update food set
father_profession = trim(father_profession);

update food set
father_profession = lower(father_profession);

/*update food set
father_profession_1 = father_profession;
*/
select distinct(father_profession) from food;

update food set
father_profession = 'manager'
where father_profession like '%manager%';

update food set
father_profession = 'sales'
where father_profession like '%sale%';

update food set
father_profession = 'businessman'
where father_profession like '%busines%';

update food set
father_profession = 'businessman'
where father_profession like '%self employed%';

update food set
father_profession = 'retired'
where father_profession like '%retire%';

update food set
father_profession = 'police'
where father_profession like '%police%';

update food set
father_profession = 'Unknown'
where father_profession in ('idk', 'nan', 'unknown', 'not', 'sure', '2');


select father_profession,father_profession_1 from food;

update food set
fav_cuisine = trim(fav_cuisine);

update food set
fav_cuisine = lower(fav_cuisine);

update food set
fav_cuisine_copy1=fav_cuisine;

UPDATE food 
SET 
    fav_cuisine = 'unclear'
WHERE
    fav_cuisine IN ('2' , 'all',
        'barbecue',
        'chicken',
        'don\'t have one',
        'i do not like cuisine',
        'mac and cheese',
        'lean',
        'nan',
        'orange chicken and chow mani noodles',
        'seafood',
        'sub sandwhiches','wraps');
        
UPDATE food 
SET 
    fav_cuisine = replace(fav_cuisine,' or ',',')
WHERE fav_cuisine like '% or %';

UPDATE food 
SET 
    fav_cuisine = 'colombian'
    where fav_cuisine like '%colombian%';
    
UPDATE food 
SET 
    fav_cuisine = 'american'
WHERE fav_cuisine like '% american%';

UPDATE food 
SET 
    fav_cuisine = 'arabic'
WHERE fav_cuisine like '%arabic%';

UPDATE food 
SET 
    fav_cuisine = 'chinese,vietnamese'
WHERE fav_cuisine like '%authentic chinese and vietnamese food%';

UPDATE food 
SET 
    fav_cuisine = 'italian,thai'
WHERE fav_cuisine = 'i really love italian food and thai food';

UPDATE food 
SET 
    fav_cuisine = replace(fav_cuisine,' and ',',')
WHERE fav_cuisine like '% and %';

UPDATE food 
SET 
    fav_cuisine = replace(fav_cuisine,'/',',')
WHERE fav_cuisine like '%/%';

UPDATE food 
SET 
    fav_cuisine = 'chinese'
WHERE fav_cuisine like '%chinese cuisine%' or fav_cuisine like '%chinese food%';

UPDATE food 
SET 
    fav_cuisine = 'american'
WHERE fav_cuisine like '%hispanic%';

UPDATE food 
SET 
    fav_cuisine = 'indian'
WHERE fav_cuisine like '%indian food%';

UPDATE food 
SET 
    fav_cuisine = 'italian'
WHERE fav_cuisine like '%italian food%';

UPDATE food 
SET 
    fav_cuisine = 'mexican'
WHERE fav_cuisine like '%mexican%';

UPDATE food 
SET 
    fav_cuisine = 'thai'
WHERE fav_cuisine like '%thai food%';

UPDATE food 
SET 
    fav_cuisine = 'japanese'
WHERE fav_cuisine = 'sushi';

UPDATE food 
SET 
    fav_cuisine = 'vietnamese'
WHERE fav_cuisine = 'vietnamese cuisine';

select SUBSTRING_INDEX(fav_cuisine,',',1) as fav_cuisine,fav_cuisine_coded from food
order by fav_cuisine;

update food set fav_cuisine_coded=
case 
when SUBSTRING_INDEX(fav_cuisine,',',1) in ('italian','french','greek') then 1
when SUBSTRING_INDEX(fav_cuisine,',',1) in ('spanish','mexican') then 2
when SUBSTRING_INDEX(fav_cuisine,',',1) in ('Arabic','Turkish','lebanese') then 3
when SUBSTRING_INDEX(fav_cuisine,',',1) in ('asian','chinese','thai','nepal','japanese','korean','vietnamese') then 4
when SUBSTRING_INDEX(fav_cuisine,',',1) in ('american','hispanic','colombian') then 5
when SUBSTRING_INDEX(fav_cuisine,',',1) = 'african' then 6
when SUBSTRING_INDEX(fav_cuisine,',',1) = 'jamaican' then 7
when SUBSTRING_INDEX(fav_cuisine,',',1) = 'indian' then 8
else 0 end;

select distinct(fav_food) from food;

/*data tertukar fav cuisine dan fav food yaitu mexican dan 2*/

update food set 
fav_cuisine = 'mexican'
where fav_food = 'Mexican';

update food set 
fav_food = 2
where fav_food = 'Mexican';

#update food_childhood
/*update food set food_childhood_copy1 = food_childhood;*/
update food set 
food_childhood = trim(food_childhood);

update food set 
food_childhood = lower(food_childhood);

update food set 
food_childhood = replace(food_childhood,'/',',')
where food_childhood like '%/%';

update food set 
food_childhood = replace(food_childhood,', and',',')
where food_childhood like '%, and%';

update food set 
food_childhood = replace(food_childhood,'mac cheese','mac & cheese')
where food_childhood = 'mac cheese';

update food set 
food_childhood = replace(food_childhood,'mac&cheese','mac & cheese')
where food_childhood like '%mac&cheese%';

update food set 
food_childhood = replace(food_childhood,'pizza mac n cheese pasta','pizza, mac & cheese, pasta')
where food_childhood like '%pizza mac n cheese pasta%';

update food set 
food_childhood = replace(food_childhood,'macaroni and cheese','mac & cheese')
where food_childhood like '%macaroni and cheese%';

update food set 
food_childhood = replace(food_childhood,'macaroni & cheese','mac & cheese')
where food_childhood like '%macaroni & cheese%';

update food set 
food_childhood = replace(food_childhood,'stromboli, mac and cheese, pizza','stromboli, mac & cheese, pizza')
where food_childhood like '%stromboli, mac and cheese, pizza%';

update food set 
food_childhood = replace(food_childhood,', &',',')
where food_childhood not like '%mac &%';

update food set 
food_childhood = replace(food_childhood,'&',',')
where food_childhood not like '%mac &%';

update food set 
food_childhood = replace(food_childhood,'mac and cheesae','mac & cheese')
where food_childhood like '%mac and cheease%';

update food set 
food_childhood = replace(food_childhood,'pizza pasta and quesadillas','pizza, pasta, quesadillas')
where food_childhood like '%pizza pasta and quesadillas%';

update food set 
food_childhood = replace(food_childhood,' and',',')
where food_childhood like '%and%';

select replace(food_childhood,'&',',') as oke, food_childhood from food
where food_childhood not like '%mac &%'; 

select distinct(fruit_day) from food;

update food set fruit_day = 'nan'
where fruit_day =0;

select * from food;

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
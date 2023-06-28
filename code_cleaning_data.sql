select * from food_1;

#update text data to "nan"
UPDATE food_1 
SET 
    GPA = 'nan'
WHERE
    GPA IN  ('Unknown','Personal');

/*UPDATE food_1 
SET 
    GPA = 'nan'
WHERE
    GPA like '%Unknown&' or GPA like '%Personal%';
    
 */
 
select distinct(GPA) from food_1;
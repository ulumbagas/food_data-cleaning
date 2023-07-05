<h2 align="center">About Dataset</h2>

**This dataset includes information on food choices, nutrition, preferences, childhood favorites, and other information from college students. There are 126 responses from students. Data is raw and uncleaned.**

<h2 align="center">About Repository</h2>

**The objective of this repository is to provide a comprehensive guide on dataset cleaning using SQL. It primarily focuses on correcting inconsistent data types, fixing inconsistent data values, and removing unnecessary strings to enhance the accuracy and reliability of data analysis. By implementing these cleaning techniques, the repository aims to facilitate further analysis and ensure the reliability of the dataset for meaningful insights.**



---
<br/>
<h1 align="center">DATA CLEANING</h1>

### Fixed values containing inconsistent data types. <br/>
This code focuses on correcting inconsistent data types in the GPA column. By resolving these inconsistencies enabling accurate analysis and interpretation of academic performance.<br/>

In the GPA column, there are instances of inconsistent data, specifically "Personal" and "Unknown" values. Converting text data into average values can lead to erroneous data, thus in this case, I have replaced "Personal" and "Unknown" with "nan" to indicate that the GPA value cannot be identified or does not exist. This ensures the integrity of the dataset and avoids any misleading calculations or analysis.

```
UPDATE food 
SET 
    GPA = 'nan'
WHERE
    GPA IN  ('Unknown','Personal');
```


<br/>
<br/>

### fixed inconsistent data values and removing unnecessary strings. <br/>

If the data  has inconsistent writing styles, such as mixed uppercase and lowercase letters and inconsistent data then correcting the formatting can improve data consistency. This simplifies the data analysis process and reduces errors caused by inconsistent data recognition. <br/>
 <br/>

This code utilizes the SQL function LOWER to convert the data in the comfort_food column to lowercase. By applying this function, the code ensures that all the values in the comfort_food column are in lowercase format.
```
UPDATE food SET 
comfort_food = LOWER(comfort_food);
```
<br/>

The code aims to modify a given text or string by searching for instances where the phrase ", and" appears and replacing it with a single comma ","

```
UPDATE food SET 
comfort_food = REPLACE (comfort_food,", and",",")
WHERE comfort_food LIKE '%, and%';
```

<!--- ![comfort_food](https://github.com/ulumbagas/food_data-cleaning/assets/58242856/fe0ac90f-b122-4444-aebf-7f07481f52d3) 
iki upload gambar e, copy link e tok ae bos --->
<br/>
<p align="center" width="70%">
    <img width="70%" src="https://github.com/ulumbagas/food_data-cleaning/assets/58242856/fe0ac90f-b122-4444-aebf-7f07481f52d3"> 
</p>
<br/>

The objective of the code is to replace the string ". " with a comma (",") and replace hyphens ("-") with a space (" "), simplifying the text and ensuring consistency for easier data analysis.

```
UPDATE food SET 
comfort_food = REPLACE (comfort_food,". ",",")
WHERE comfort_food LIKE '%. %';
```
<br/>

```
UPDATE food SET 
comfort_food = REPLACE (comfort_food,"-"," ")
WHERE comfort_food LIKE '%-%';
```

<!--- ![comfort_food2](https://github.com/ulumbagas/food_data-cleaning/assets/58242856/ac64f04d-7944-45e2-a28c-39bd9bc849cf)
--->

<br/>

<p align="center" width="70%">
    <img width="70%" src="https://github.com/ulumbagas/food_data-cleaning/assets/58242856/ac64f04d-7944-45e2-a28c-39bd9bc849cf"> 
</p>
<br/>

The TRIM() function is used to remove leading or trailing spaces or specified characters from a string. It helps ensure data consistency and improves data quality by eliminating unwanted characters that may interfere with analysis or comparisons.

```
UPDATE food 
SET 
    comfort_food = TRIM(comfort_food);
```
<br/>

The objective of this code is to remove the dot (.) and comma (,) characters from the end of a string. This is achieved by utilizing the SQL functions SUBSTRING_INDEX and CONCAT.

```
UPDATE food 
SET 
    comfort_food = CONCAT(SUBSTRING(comfort_food,1,LENGTH(comfort_food) - 1),'')
WHERE
    RIGHT(comfort_food, 1) IN (',' , '.','');
```
<br/>
<!--- ![comfort_food3](https://github.com/ulumbagas/food_data-cleaning/assets/58242856/15303e02-2499-46f0-95f5-4cd1fc7c78c8) --->
<p align="center" width="70%">
    <img width="70%" src="https://github.com/ulumbagas/food_data-cleaning/assets/58242856/15303e02-2499-46f0-95f5-4cd1fc7c78c8"> 
</p>
<br/>

In this code, we use some functions like substring_index and case to split the data based on comma as the separator, enabling us to efficiently manage and process the data in the subsequent stages of the data cleansing process.

```
select 
SUBSTRING_INDEX(comfort_food,',',1) as comfort_food,
CASE WHEN LENGTH(comfort_food) - LENGTH(REPLACE(comfort_food, ',', '')) >= 1 THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(comfort_food, ',', 2), ',', -1)) ELSE null END comfort_food2,
CASE WHEN LENGTH(comfort_food) - LENGTH(REPLACE(comfort_food, ',', '')) >= 2 THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(comfort_food, ',', 3), ',', -1)) ELSE null END comfort_food3,
CASE WHEN LENGTH(comfort_food) - LENGTH(REPLACE(comfort_food, ',', '')) >= 3 THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(comfort_food, ',', 4), ',', -1)) ELSE null END comfort_food4,
CASE WHEN LENGTH(comfort_food) - LENGTH(REPLACE(comfort_food, ',', '')) >= 4 THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(comfort_food, ',', 5), ',', -1)) ELSE null END comfort_food5,
CASE WHEN LENGTH(comfort_food) - LENGTH(REPLACE(comfort_food, ',', '')) >= 5 THEN TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(comfort_food, ',', 6), ',', -1)) ELSE null END comfort_food6
from food;
```
<br/>
<!--- ![comfort_food5](https://github.com/ulumbagas/food_data-cleaning/assets/58242856/8b55a11f-ffd6-4dcf-af83-6b5355163e66)--->
<p align="center" width="90%">
    <img width="90%" src="https://github.com/ulumbagas/food_data-cleaning/assets/58242856/8b55a11f-ffd6-4dcf-af83-6b5355163e66"> 
</p>
<br/>

After identifying the data in the comfort_food column, I found some inconsistencies that needed to be fixed such as 'mac and cheese' to 'macaroni & cheese', 'burgers' to 'burger', 'chinese food' to 'chinese' we will fix to make it more consistent. here preview some code

```
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
 
```
<br/>
<!--- ![image](https://github.com/ulumbagas/food_data-cleaning/assets/58242856/fbb944cd-89b9-45ce-87be-8c42563e93d9)
 --->

<p align="center" width="90%">
    <img width="90%" src="https://github.com/ulumbagas/food_data-cleaning/assets/58242856/fbb944cd-89b9-45ce-87be-8c42563e93d9"> 
</p>
<br/>
After observing, there are several data in the comfort_food column that are separated using something other than commas, but using spaces or newline (\n).

```
SELECT 
    LENGTH(comfort_food) - LENGTH(REPLACE(comfort_food, ' ', '')) AS 'spasi',
    comfort_food
FROM
    food
    where comfort_food not like '%,%';
```
<br/>
<!--- ![image](https://github.com/ulumbagas/food_data-cleaning/assets/58242856/3b280a0d-f0cf-41f1-b881-80b38c12b647) --->
<p align="center" width="75%">
    <img width="75%" src="https://github.com/ulumbagas/food_data-cleaning/assets/58242856/3b280a0d-f0cf-41f1-b881-80b38c12b647"> 
</p>

This code will fix the issue <br/>

```
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
```
<!--- ![image](https://github.com/ulumbagas/food_data-cleaning/assets/58242856/fb600b08-6b4e-49e3-a80b-972fdecd6b0f) --->
<p align="center" width="75%">
    <img width="75%" src="https://github.com/ulumbagas/food_data-cleaning/assets/58242856/fb600b08-6b4e-49e3-a80b-972fdecd6b0f"> 
</p>





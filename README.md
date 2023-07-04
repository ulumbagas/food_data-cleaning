<h2 align="center">About Dataset</h2>

**This dataset includes information on food choices, nutrition, preferences, childhood favorites, and other information from college students. There are 126 responses from students. Data is raw and uncleaned.**

<h2 align="center">About Repository</h2>

**The objective of this repository is to provide a comprehensive guide on dataset cleaning using SQL. It primarily focuses on correcting inconsistent data types, fixing inconsistent data values, and removing unnecessary strings to enhance the accuracy and reliability of data analysis. By implementing these cleaning techniques, the repository aims to facilitate further analysis and ensure the reliability of the dataset for meaningful insights.**



---
<br/>
<h1 align="center">DATA CLEANING</h1>

* **Fixed values containing inconsistent data types.** <br/>
  	 Focuses on correcting inconsistent data types in the GPA column. By resolving these inconsistencies enabling accurate analysis and interpretation of academic performance.<br/>

```
UPDATE food 
SET 
    GPA = 'nan'
WHERE
    GPA IN  ('Unknown','Personal');
```

In the GPA column there is inconsistent data namely "Personal" and "Unknown". Converting text data to average values will cause 		corrupted data, in this case i change "Personal" and "Unknown" to "nan" due to information that the GPA value cannot be identified or 	does not exist.
<br/>
<br/>
<br/>
+ **Make  data  consistent.** <br/>
	If the data you are examining has inconsistent writing variations, such as random usage of uppercase and lowercase letters, correcting the data's writing can help improve data consistency. This will facilitate the data analysis process and minimize errors caused by inconsistent data recognition. <br/>

this code make data in column comfort_food become lowercase
```
UPDATE food SET 
comfort_food = LOWER(comfort_food);
```
<br/>
The code aims to modify a given text or string by searching for instances where the phrase ", and" appears and replacing it with a single comma ","
<br/>

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
The code aims replacing string ". " with comma and "-" with space " "
<br/>

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
The TRIM() function removes the space character OR other specified characters from the start or end of a string.
<br/>

```
UPDATE food 
SET 
    comfort_food = TRIM(comfort_food);
```
<br/>

Delete dot(.) and comma(,) in last string <br/>
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
In this code, we use some functions like substring_index and case to split the data based on comma as the separator, enabling us to efficiently manage and process the data in the subsequent stages of the data cleansing process.<br/>

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
After identifying the data in the comfort_food column, I found some inconsistencies that needed to be fixed such as 'mac and cheese' to 'macaroni & cheese', 'burgers' to 'burger', 'chinese food' to 'chinese' we will fix to make it more consistent. <br/>

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
 
```
<br/>
<!--- ![image](https://github.com/ulumbagas/food_data-cleaning/assets/58242856/fbb944cd-89b9-45ce-87be-8c42563e93d9)
 --->

<p align="center" width="90%">
    <img width="90%" src="https://github.com/ulumbagas/food_data-cleaning/assets/58242856/fbb944cd-89b9-45ce-87be-8c42563e93d9"> 
</p>


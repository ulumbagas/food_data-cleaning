### About Dataset

**This dataset includes information on food choices, nutrition, preferences, childhood favorites, and other information from college students. There are 126 responses from students. Data is raw and uncleaned.**

### About Repository
**Objective this repository is to clean dataset so that it can perform further data analysis**



---
# **DATA CLEANING**
* **Fixed values containing inconsistent data types.** <br/>
  	 Update data in the GPA column that has an inconsistent value.<br/>

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

this code make data in column comfort food become lowercase
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

<p align="center" width="90%">
    <img width="90%" src="https://github.com/ulumbagas/food_data-cleaning/assets/58242856/fe0ac90f-b122-4444-aebf-7f07481f52d3"> 
</p>

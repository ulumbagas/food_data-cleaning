### About Dataset

**This dataset includes information on food choices, nutrition, preferences, childhood favorites, and other information from college students. There are 126 responses from students. Data is raw and uncleaned.**

### About Repository
**Objective this repository is to clean dataset so that it can perform further data analysis**



---
# **DATA CLEANING**
* Fixed values containing inconsistent data types.<br/>
  	 Update data in the GPA column that has an inconsistent value.<br/>

```
UPDATE food 
SET 
    GPA = 'nan'
WHERE
    GPA IN  ('Unknown','Personal');
```
<br/>
In the GPA column there is inconsistent data namely "Personal" and "Unknown". Converting text data to average values will cause corrupted data, in this case i change "Personal" and "Unknown" to "nan" due to information that the GPA value cannot be identified or does not exist. 

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

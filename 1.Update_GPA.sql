#imputasi nilai menjadi nan
UPDATE food SET `GPA` = 
	CASE 
	WHEN GPA = 'personal'     THEN 'nan' 
	WHEN GPA = 'Unknown'      THEN 'nan'
	ELSE GPA	
	END;
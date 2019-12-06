SELECT 
	*
FROM
	public."Match" m1
WHERE 
	NOT EXISTS
		(SELECT 
			*
		 FROM 
		 	public."Vacancy" v1 
		 WHERE 
		 	m1.id = v1.matchid);

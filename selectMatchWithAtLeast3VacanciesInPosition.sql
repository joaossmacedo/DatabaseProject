SELECT 
	m.*
FROM 
	public."Vacancy" v
INNER JOIN
	public."Match" m
		ON m.id = v.matchid
GROUP BY 
	m.id, position
HAVING COUNT(v.position) > 2
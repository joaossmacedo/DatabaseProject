SELECT 
	v1.playerid, u1.name
FROM 
	PUBLIC."Vacancy" v1
INNER JOIN
	public."Player" p1
		ON v1.playerid = p1.userid
INNER JOIN
	public."User" u1
		ON p1.userid = u1.id
JOIN (
	SELECT 
		playerid
	FROM 
		PUBLIC."Vacancy" v1
	GROUP BY 
		playerid
	HAVING 
		count(*) > 1
) v2 
	ON v2.playerid = v1.playerid
GROUP BY 
	v1.playerid, p1.position, u1.name

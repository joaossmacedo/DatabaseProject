-- Select players with sociability grades below 5
SELECT 
	public."User".id, name, AVG(sociability)
FROM
	public."Grades"
INNER JOIN
	public."Player" 
		ON public."Grades".playerid = public."Player".userid
INNER JOIN
	public."User"
		ON public."User".id = public."Player".userid
GROUP BY
	public."User".id	
HAVING 
	AVG(public."Grades".sociability) < 5
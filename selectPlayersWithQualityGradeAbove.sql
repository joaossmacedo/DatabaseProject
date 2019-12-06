-- Select players with quality grades above 8.5
SELECT 
	public."User".id, name, AVG(quality)
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
	AVG(public."Grades".quality) > 8.5
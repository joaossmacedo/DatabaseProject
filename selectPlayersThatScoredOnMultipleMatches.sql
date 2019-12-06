SELECT
	u1.id, u1.name
FROM
	public."Match" m1
INNER JOIN
	public."MatchPlayers" mp1
		ON m1.id = mp1.matchid
INNER JOIN (
	SELECT playerid
	FROM public."MatchPlayers"
		WHERE goals > 0
	GROUP BY playerid
	HAVING COUNT(*) > 1
) mp2 
	ON mp1.playerid = mp2.playerid
INNER JOIN
	public."Player" p1
		ON p1.userid = mp1.playerid
INNER JOIN
	public."User" u1
		ON p1.userid = u1.id
GROUP BY u1.id, u1.name
ORDER BY u1.name
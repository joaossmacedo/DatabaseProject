SELECT
	u.id, COUNT(*)
FROM
	public."Player" P
INNER JOIN
	public."User" u
	ON u.id = p.userid
INNER JOIN
	public."MatchPlayers" m
	ON m.playerid = p.userid
WHERE
	m.attendance = true
GROUP BY
	u.id
HAVING
	COUNT(*) < 5
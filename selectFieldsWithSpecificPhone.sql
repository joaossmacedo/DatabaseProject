SELECT
	f1.*
FROM
	public."Field" f1
INNER JOIN
	public."FieldOwner" fo1
		ON f1.ownerid = fo1.userid
WHERE
	fo1.phone = '(00)00000-0000'
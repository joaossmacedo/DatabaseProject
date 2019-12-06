SELECT
	m1.*, p1.address
FROM
	public."Place" p1
INNER JOIN
	public."Match" m1
		ON m1.placeid = p1.id 
WHERE
	p1.address = 'Rua futebol 123'
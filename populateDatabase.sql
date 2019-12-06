-- Inserting Players
INSERT INTO public."User"(
	email, password, name)
	VALUES ('leonelmessi@barcelona.com', 'Senha1!', 'Leo Messi');
	
INSERT INTO public."Player"(
	userid, "position")
	VALUES ((SELECT id FROM public."User" WHERE email='leonelmessi@barcelona.com'), 'FWD');
	
INSERT INTO public."User"(
	email, password, name)
	VALUES ('masonmount@chelsea.com', 'Senha1!', 'Mason Mount');

INSERT INTO public."Player"(
	userid, "position")
	VALUES ((SELECT id FROM public."User" WHERE email='masonmount@chelsea.com'), 'MID');

INSERT INTO public."User"(
	email, password, name)
	VALUES ('christianpulisic@chelsea.com', 'Senha1!', 'Christian Pulisic');
	
INSERT INTO public."Player"(
	userid, "position")
	VALUES ((SELECT id FROM public."User" WHERE email='christianpulisic@chelsea.com'), 'MID');

INSERT INTO public."User"(
	email, password, name)
	VALUES ('crisitanoronaldo@juventus.com', 'Senha1!', 'Cristiano Ronaldo');
	
INSERT INTO public."Player"(
	userid, "position")
	VALUES ((SELECT id FROM public."User" WHERE email='crisitanoronaldo@juventus.com'), 'FWD');
	
INSERT INTO public."User"(
	email, password, name)
	VALUES ('kevindebruyne@mancity.com', 'Senha1!', 'Kevin de Bruyne');

INSERT INTO public."Player"(
	userid, "position")
	VALUES ((SELECT id FROM public."User" WHERE email='kevindebruyne@mancity.com'), 'MID');

INSERT INTO public."User"(
	email, password, name)
	VALUES ('mosalah@barcelona.com', 'Senha1!', 'Mohhamed Salah');
	
INSERT INTO public."Player"(
	userid, "position")
	VALUES ((SELECT id FROM public."User" WHERE email='mosalah@barcelona.com'), 'MID');

-- Insert Grades
INSERT INTO public."Grades"(
	quality, sociability, playerid, createdat)
	VALUES (10, 10, (SELECT id FROM public."User" WHERE email='leonelmessi@barcelona.com'), NOW());
	
INSERT INTO public."Grades"(
	quality, sociability, playerid, createdat)
	VALUES (9, 5, (SELECT id FROM public."User" WHERE email='leonelmessi@barcelona.com'), NOW());

INSERT INTO public."Grades"(
	quality, sociability, playerid, createdat)
	VALUES (9, 7, (SELECT id FROM public."User" WHERE email='leonelmessi@barcelona.com'), NOW());
	
INSERT INTO public."Grades"(
	quality, sociability, playerid, createdat)
	VALUES (10, 9, (SELECT id FROM public."User" WHERE email='leonelmessi@barcelona.com'), NOW());

INSERT INTO public."Grades"(
	quality, sociability, playerid, createdat)
	VALUES (8, 10, (SELECT id FROM public."User" WHERE email='kevindebruyne@mancity.com'), NOW());
	
INSERT INTO public."Grades"(
	quality, sociability, playerid, createdat)
	VALUES (8, 6, (SELECT id FROM public."User" WHERE email='kevindebruyne@mancity.com'), NOW());

INSERT INTO public."Grades"(
	quality, sociability, playerid, createdat)
	VALUES (9, 8, (SELECT id FROM public."User" WHERE email='kevindebruyne@mancity.com'), NOW());
	
INSERT INTO public."Grades"(
	quality, sociability, playerid, createdat)
	VALUES (8, 3, (SELECT id FROM public."User" WHERE email='mosalah@barcelona.com'), NOW());

-- Inserting Field Owner
INSERT INTO public."User"(
	email, password, name)
	VALUES ('dono@campo.com', 'Senha1!', 'Dono do Campo');
	
INSERT INTO public."FieldOwner"(
	userid, phone)
	VALUES ((SELECT id FROM public."User" WHERE email='dono@campo.com'), '(00)00000-0000');
	
-- Inserting Field
INSERT INTO public."Place"(
	address)
	VALUES ('Rua futebol 123');

INSERT INTO public."Field"(
	type, price, ownerid, placeid)
	VALUES ('Futsal', 9500, (SELECT id FROM public."User" WHERE email='dono@campo.com'),
			(SELECT id FROM public."Place" WHERE address='Rua futebol 123'));
			
INSERT INTO public."Place"(
	address)
	VALUES ('Rua futebol 456');

INSERT INTO public."Field"(
	type, price, ownerid, placeid)
	VALUES ('Campo', 14500, (SELECT id FROM public."User" WHERE email='dono@campo.com'),
			(SELECT id FROM public."Place" WHERE address='Rua futebol 456'));
			
INSERT INTO public."Place"(
	address)
	VALUES ('Agamenon Magalhães');

INSERT INTO public."Field"(
	type, price, ownerid, placeid)
	VALUES ('Futsal', 12500, (SELECT id FROM public."User" WHERE email='dono@campo.com'),
			(SELECT id FROM public."Place" WHERE address='Agamenon Magalhães'));
			
INSERT INTO public."Place"(
	address)
	VALUES ('Dunder Mifflin');

INSERT INTO public."Field"(
	type, price, ownerid, placeid)
	VALUES ('Campo', 20000, (SELECT id FROM public."User" WHERE email='dono@campo.com'),
			(SELECT id FROM public."Place" WHERE address='Dunder Mifflin'));

-- Insert Match
INSERT INTO public."Match"(
	id, date, adminid, placeid)
	VALUES (uuid_generate_v4(), '2019-06-06', 
			(SELECT id FROM public."User" WHERE email='leonelmessi@barcelona.com'), 
			(SELECT id FROM public."Place" WHERE address='Rua futebol 456'));
			
INSERT INTO public."Match"(
	id, date, adminid, placeid)
	VALUES (uuid_generate_v4(), '2012-05-19', 
			(SELECT id FROM public."User" WHERE email='masonmount@chelsea.com'), 
			(SELECT id FROM public."Place" WHERE address='Rua futebol 123'));
			
-- Insert relationship between Match and Players
INSERT INTO public."MatchPlayers"(
	matchid, playerid, goals, attendance)
	VALUES ((SELECT id FROM public."Match" WHERE (adminid=(SELECT id FROM public."User" WHERE email='leonelmessi@barcelona.com')
												  AND placeid=(SELECT id FROM public."Place" WHERE address='Rua futebol 456'))),
			(SELECT id FROM public."User" WHERE email='leonelmessi@barcelona.com'), 50, false);
			
INSERT INTO public."MatchPlayers"(
	matchid, playerid, goals, attendance)
	VALUES ((SELECT id FROM public."Match" WHERE (adminid=(SELECT id FROM public."User" WHERE email='leonelmessi@barcelona.com')
												  AND placeid=(SELECT id FROM public."Place" WHERE address='Rua futebol 456'))),
			(SELECT id FROM public."User" WHERE email='masonmount@chelsea.com'), 7, false);
			
INSERT INTO public."MatchPlayers"(
	matchid, playerid, goals, attendance)
	VALUES ((SELECT id FROM public."Match" WHERE (adminid=(SELECT id FROM public."User" WHERE email='leonelmessi@barcelona.com')
												  AND placeid=(SELECT id FROM public."Place" WHERE address='Rua futebol 456'))),
			(SELECT id FROM public."User" WHERE email='christianpulisic@chelsea.com'), 8, false);
			
INSERT INTO public."MatchPlayers"(
	matchid, playerid, goals, attendance)
	VALUES ((SELECT id FROM public."Match" WHERE (adminid=(SELECT id FROM public."User" WHERE email='leonelmessi@barcelona.com')
												  AND placeid=(SELECT id FROM public."Place" WHERE address='Rua futebol 456'))),
			(SELECT id FROM public."User" WHERE email='crisitanoronaldo@juventus.com'), 3, false);

INSERT INTO public."MatchPlayers"(
	matchid, playerid, goals, attendance)
	VALUES ((SELECT id FROM public."Match" WHERE (adminid=(SELECT id FROM public."User" WHERE email='leonelmessi@barcelona.com')
												  AND placeid=(SELECT id FROM public."Place" WHERE address='Rua futebol 456'))),
			(SELECT id FROM public."User" WHERE email='kevindebruyne@mancity.com'), 0, false);

INSERT INTO public."MatchPlayers"(
	matchid, playerid, goals, attendance)
	VALUES ((SELECT id FROM public."Match" WHERE (adminid=(SELECT id FROM public."User" WHERE email='masonmount@chelsea.com')
												  AND placeid=(SELECT id FROM public."Place" WHERE address='Rua futebol 123'))),
			(SELECT id FROM public."User" WHERE email='leonelmessi@barcelona.com'), 2, false);
			
INSERT INTO public."MatchPlayers"(
	matchid, playerid, goals, attendance)
	VALUES ((SELECT id FROM public."Match" WHERE (adminid=(SELECT id FROM public."User" WHERE email='masonmount@chelsea.com')
												  AND placeid=(SELECT id FROM public."Place" WHERE address='Rua futebol 123'))),
			(SELECT id FROM public."User" WHERE email='masonmount@chelsea.com'), 0, false);
			
INSERT INTO public."MatchPlayers"(
	matchid, playerid, goals, attendance)
	VALUES ((SELECT id FROM public."Match" WHERE (adminid=(SELECT id FROM public."User" WHERE email='masonmount@chelsea.com')
												  AND placeid=(SELECT id FROM public."Place" WHERE address='Rua futebol 123'))),
			(SELECT id FROM public."User" WHERE email='christianpulisic@chelsea.com'), 3, false);
			

INSERT INTO public."MatchPlayers"(
	matchid, playerid, goals, attendance)
	VALUES ((SELECT id FROM public."Match" WHERE (adminid=(SELECT id FROM public."User" WHERE email='masonmount@chelsea.com')
												  AND placeid=(SELECT id FROM public."Place" WHERE address='Rua futebol 123'))),
			(SELECT id FROM public."User" WHERE email='crisitanoronaldo@juventus.com'), 0, false);

INSERT INTO public."MatchPlayers"(
	matchid, playerid, goals, attendance)
	VALUES ((SELECT id FROM public."Match" WHERE (adminid=(SELECT id FROM public."User" WHERE email='masonmount@chelsea.com')
												  AND placeid=(SELECT id FROM public."Place" WHERE address='Rua futebol 123'))),
			(SELECT id FROM public."User" WHERE email='kevindebruyne@mancity.com'), 0, false);
			

-- Insert Vacancies
INSERT INTO public."Vacancy"(
	"position", matchid)
	VALUES ('GK', (SELECT id FROM public."Match" WHERE (adminid=(SELECT id FROM public."User" WHERE email='leonelmessi@barcelona.com')
												  AND placeid=(SELECT id FROM public."Place" WHERE address='Rua futebol 456'))));

INSERT INTO public."Vacancy"(
	"position", matchid)
	VALUES ('GK', (SELECT id FROM public."Match" WHERE (adminid=(SELECT id FROM public."User" WHERE email='leonelmessi@barcelona.com')
												  AND placeid=(SELECT id FROM public."Place" WHERE address='Rua futebol 456'))));
INSERT INTO public."Vacancy"(
	"position", matchid)
	VALUES ('GK', (SELECT id FROM public."Match" WHERE (adminid=(SELECT id FROM public."User" WHERE email='masonmount@chelsea.com')
												  AND placeid=(SELECT id FROM public."Place" WHERE address='Rua futebol 123'))));
INSERT INTO public."Vacancy"(
	"position", matchid)
	VALUES ('GK', (SELECT id FROM public."Match" WHERE (adminid=(SELECT id FROM public."User" WHERE email='masonmount@chelsea.com')
												  AND placeid=(SELECT id FROM public."Place" WHERE address='Rua futebol 123'))));
INSERT INTO public."Vacancy"(
	"position", matchid)
	VALUES ('GK', (SELECT id FROM public."Match" WHERE (adminid=(SELECT id FROM public."User" WHERE email='masonmount@chelsea.com')
												  AND placeid=(SELECT id FROM public."Place" WHERE address='Rua futebol 123'))));
				
INSERT INTO public."Vacancy"(
	"position", matchid, playerid)
	VALUES ('MID', (SELECT id FROM public."Match" WHERE (adminid=(SELECT id FROM public."User" WHERE email='masonmount@chelsea.com')
												  AND placeid=(SELECT id FROM public."Place" WHERE address='Rua futebol 123'))),
		   			(SELECT id FROM public."User" WHERE email='masonmount@chelsea.com'));

INSERT INTO public."Vacancy"(
	"position", matchid, playerid)
	VALUES ('FWD', (SELECT id FROM public."Match" WHERE (adminid=(SELECT id FROM public."User" WHERE email='masonmount@chelsea.com')
												  AND placeid=(SELECT id FROM public."Place" WHERE address='Rua futebol 123'))),
			(SELECT id FROM public."User" WHERE email='mosalah@barcelona.com'));

INSERT INTO public."Vacancy"(
	"position", matchid, playerid)
	VALUES ('FWD', (SELECT id FROM public."Match" WHERE (adminid=(SELECT id FROM public."User" WHERE email='leonelmessi@barcelona.com')
												  AND placeid=(SELECT id FROM public."Place" WHERE address='Rua futebol 456'))),
			(SELECT id FROM public."User" WHERE email='mosalah@barcelona.com'));

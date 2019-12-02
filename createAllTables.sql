CREATE TYPE enumPosition AS ENUM ('GK','DEF', 'MID', 'FWD');

-- User
CREATE TABLE public."User"
(
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE public."User"
    OWNER to postgres;


-- Player
CREATE TABLE public."Player"
(
    position enumPosition NOT NULL,
	userId uuid NOT NULL,
    PRIMARY KEY (userId),
	FOREIGN KEY (userId) REFERENCES public."User" (id)
);

ALTER TABLE public."Player"
    OWNER to postgres;

-- Field Owner
CREATE TABLE public."FieldOwner"
(
    phone character varying(20) NOT NULL,
	userId uuid NOT NULL,
    PRIMARY KEY (userId),
	FOREIGN KEY (userId) REFERENCES public."User" (id)
);

ALTER TABLE public."FieldOwner"
    OWNER to postgres;


-- Grades
CREATE TABLE public."Grades"
(
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
	quality integer,
	sociability integer,
	playerId uuid NOT NULL,
	createdAt DATE NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (playerId) REFERENCES public."Player" (userId)
);

ALTER TABLE public."Grades"
    OWNER to postgres;

-- Place
CREATE TABLE public."Place"
(
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	address character varying(20) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE public."Place"
    OWNER to postgres;

-- Field
CREATE TABLE public."Field"
(
    type character varying(20) NOT NULL,
	-- Price is being stored in cents
	price integer NOT NULL,
	ownerId uuid NOT NULL,
	placeId uuid NOT NULL,
    PRIMARY KEY (placeId),
	FOREIGN KEY (ownerId) REFERENCES public."FieldOwner" (userId),
	FOREIGN KEY (placeId) REFERENCES public."Place" (id)
);

ALTER TABLE public."Field"
    OWNER to postgres;

-- Match
CREATE TABLE public."Match"
(
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
	date DATE NOT NULL,
	adminId uuid NOT NULL,
	placeId uuid NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (placeId) REFERENCES public."Place" (id),
	FOREIGN KEY (adminId) REFERENCES public."Player" (userId)
);

ALTER TABLE public."Match"
    OWNER to postgres;

-- Vacancy
CREATE TABLE public."Vacancy"
(
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	position enumPosition,
	matchId uuid NOT NULL,
	playerId uuid,
	PRIMARY KEY (id),
	FOREIGN KEY (matchId) REFERENCES public."Match" (id),
	FOREIGN KEY (playerId) REFERENCES public."Player" (userId)
);

ALTER TABLE public."Vacancy"
    OWNER to postgres;

-- Match Players
CREATE TABLE public."MatchPlayers"
(
	matchId uuid NOT NULL,
	playerId uuid NOT NULL,
	goals integer,
	attendance boolean,
	PRIMARY KEY (matchId, playerId),
	FOREIGN KEY (matchId) REFERENCES public."Match" (id),
	FOREIGN KEY (playerId) REFERENCES public."Player" (userId)
);

ALTER TABLE public."Match"
    OWNER to postgres;
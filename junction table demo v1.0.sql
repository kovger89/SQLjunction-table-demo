CREATE TABLE Movie (
	MovieID int IDENTITY (1,1),
	Title nvarchar(50)
	CONSTRAINT PK_Movie PRIMARY KEY (MovieID)
)
INSERT INTO Movie VALUES ('The Shawshank Redemption'), ('The Hudsucker Proxy'), ('The Sting')

CREATE TABLE Actor (
	ActorID int IDENTITY (1,1),
	FullName nvarchar(200)
	CONSTRAINT PK_Actor PRIMARY KEY (ActorID)
)
INSERT INTO Actor VALUES ('Tim Robbins'), ('Morgan Freeman'), ('Paul Newman'), ('Robert Redford')

CREATE TABLE Genre(
	GenreID int IDENTITY (1,1),
	Genre nvarchar(200)
	CONSTRAINT PK_Genre PRIMARY KEY (GenreID)
)
INSERT INTO  Genre VALUES ('Drama'), ('Comedy'), ('Crime') 

CREATE TABLE MovieActorsTable (
	MovieID int,
	ActorID int
)
ALTER TABLE MovieActorsTable
	ADD CONSTRAINT FK_MovieActorsTable_Movie_MovieID FOREIGN KEY (MovieID) REFERENCES Movie (MovieID),
		CONSTRAINT FK_MovieActorsTable_Actor_ActorID FOREIGN KEY (ActorID) REFERENCES Actor (ActorID)

CREATE TABLE MovieGenreTable (
	MovieID int,
	GenreID int
)
ALTER TABLE MovieGenreTable
	ADD CONSTRAINT FK_MovieGenreTable_Movie_MovieID FOREIGN KEY (MovieID) REFERENCES Movie (MovieID),
		CONSTRAINT FK_MovieGenreTable_Genre_GenreID FOREIGN KEY (GenreID) REFERENCES Genre (GenreID)

INSERT INTO MovieGenreTable VALUES (1,1),(2,1),(2,2),(3,1),(3,2),(3,3)
INSERT INTO MovieActorsTable VALUES (1,1),(1,2),(2,1),(2,3),(3,3),(3,4)

SELECT G.Genre as Genre, M.Title as Title, A.FullName as Starring
	FROM Movie M
	JOIN MovieActorsTable MAT ON M.MovieID = MAT.MovieID
	JOIN Actor A ON A.ActorID = MAT.ActorID
	JOIN MovieGenreTable MGT ON M.MovieID = MGT.MovieID
	JOIN Genre G ON G.GenreID = MGT.GenreID

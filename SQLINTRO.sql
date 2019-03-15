/* 1 Query all of the entries in the Genre table */

SELECT * 
From Genre

/* 2 Using the INSERT statement, add one of your favorite artists to the Artist table */

Select *
From Artist;

/* 3 Using the INSERT statement, add one, or more, albums by your artist to the Album table */

INSERT INTO Artist (ArtistName, YearEstablished)
VALUES ('Sinatra', '1940');

/* 4 Using the INSERT statement, add some songs that are on that album to the Song table */

INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES ('Come Fly With Me', '1958', 2768, 'Capitol', 30, 7);

/* 5  */

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
Values ('April in Paris', 170, '1958', 7, 30, 28);

/* 6 */

SELECT album.title, song.title, artist.ArtistName
From (Album
Left Join Song ON song.albumId = album.Id)
Left Join Artist ON song.ArtistId = Artist.id
Where album.title = 'Showroom of Compassion';

/* 7 */

Select a.title as AlbumName, Count(s.title) as SongCount
From album a 
left join song s
on s.albumId =a.Id 
group by a.title

/* 8 */

Select ar.ArtistName as ArtistName, Count(s.title) as SongCount
From artist ar 
left join song s
on s.artistId =ar.Id 
group by ar.ArtistName

/* 9 */

Select g.label as GenreLabel, Count(s.title) as SongCount
From genre g 
left join song s
on s.genreId =g.Id 
group by g.label

/* 10 */

Select title, albumlength as length
From Album 
Where albumlength = (SELECT max(AlbumLength)
From Album)

/* 11 */

SELECT a.Title AS 'AlbumTitle', s.Title AS 'SongTitle', s.SongLength AS 'Max Length' 
FROM Song s
Left JOIN Album a ON a.Id = s.AlbumId
WHERE s.SongLength = (SELECT MAX(s.SongLength) 
FROM Song s);


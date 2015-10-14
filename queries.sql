--Join the three tables, Actor, MovieActor and Movie to find out
--the names of actors in that movie.
SELECT CONCAT(a.first, ' ', a.last) AS name
FROM Actor a, MovieActor ma, Movie m
WHERE  a.id = ma.aid AND ma.mid = m.id AND m.title = 'Die Another Day';

--Subquery list all the movie actors who have played in more than 1
--different movies, then we count the number of rows in that subquery result.
SELECT COUNT(1) FROM
(SELECT aid, COUNT(DISTINCT mid) FROM MovieActor
GROUP BY aid
HAVING COUNT(DISTINCT mid) > 1) Star;

--Return the full name of people who are both actors and directors.
--Need to join the Actor table with Director table, condition is same ids.
SELECT CONCAT(a.first, ' ', a.last) AS name
FROM Actor a, Director d
WHERE a.id = d.id;
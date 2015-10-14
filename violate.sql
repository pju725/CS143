--This violates the Primary Key constraint on the id field since 2 is already an id in the table.
--Output: ERROR 1062 (23000): Duplicate entry '2' for key 'PRIMARY'
INSERT INTO Movie (id) VALUES (2);

--This violates the Primary Key constraint on the id field since 1 is already an id in the table.
--Output: ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'
INSERT INTO Actor (id) VALUES (1);

--This violates the Primary Key constraint on the id field since 1 is already an id in the table.
--Output: ERROR 1062 (23000): Duplicate entry '16' for key 'PRIMARY'
INSERT INTO Director (id) VALUES (16);

--This violates the Foreign Key constraint on the mid field since 5000
--is not an id in the Movie table.
--Output: Cannot add or update a child row: a foreign key constraint fails
--('CS143'.'MovieGenre', CONSTRAINT 'MovieGenre_ibfk_1' FOREIGN KEY ('mid')
--REFERENCES 'Movie' ('id'))
INSERT INTO MovieGenre VALUES (5000, 'Comedy');

--This violates the Foreign Key constraint on the mid field since 5000
--is not an id in the Movie table.
--Output: Cannot add or update a child row: a foreign key constraint fails
--('CS143'.'MovieDirector', CONSTRAINT 'MovieDirector_ibfk_1' FOREIGN KEY ('mid')
--REFERENCES 'Movie' ('id'))
UPDATE MovieDirector SET mid = 5000 WHERE did = 34559;

--This violates the Foreign Key constraint on the did field since 70000
--is not an id in the Director table.
--Output: Cannot add or update a child row: a foreign key constraint fails
--('CS143'.'MovieDirector', CONSTRAINT 'MovieDirector_ibfk_2' FOREIGN KEY ('did')
--REFERENCES 'Director' ('id'))
UPDATE MovieDirector SET did = 70000 WHERE mid = 4733;

--This violates the Foreign Key constraint on the mid field since 5000
--is not an id in the Movie table.
--Output: Cannot add or update a child row: a foreign key constraint fails
--('CS143'.'MovieActor', CONSTRAINT 'MovieActor_ibfk_1' FOREIGN KEY ('mid')
--REFERENCES 'Movie' ('id'))
UPDATE MovieActor SET mid = 5000
WHERE mid = 4734 AND aid = 52225;

--This violates the Foreign Key constraint on the mid field since 70000
--is not an id in the Actor table.
--Output: Cannot add or update a child row: a foreign key constraint fails
--('CS143'.'MovieActor', CONSTRAINT 'MovieActor_ibfk_2' FOREIGN KEY ('aid')
--REFERENCES 'Actor' ('id'))
UPDATE MovieActor SET aid = 70000
WHERE mid = 4734 AND aid = 52225;

--This violates the Foreign Key constraint on the mid field since 5000
--is not an id in the Movie table.
--Output: Cannot add or update a child row: a foreign key constraint fails
--('CS143'.'Review', CONSTRAINT 'Review_ibfk_1 FOREIGN KEY ('mid')
--REFERENCES 'Movie' ('id'))
INSERT INTO Review (mid) VALUES (5000);

--This violates the Check constraint on the id field since -1 < 0
INSERT INTO Movie (id) VALUES (-1);

--This violates the Check constraint on the id field since -2 < 0
INSERT INTO Actor (id) VALUES (-2);

--This violates the Check constraint on the id field since -3 < 0
INSERT INTO Director (id) VALUES (-3);

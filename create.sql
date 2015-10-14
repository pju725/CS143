-- PK1: id in the Movie Table is the primary key.
-- Check1: id in the Movie Table should not be negative.
CREATE TABLE  Movie (
    id INT NOT NULL,
    title VARCHAR(100),
    year INT,
    rating VARCHAR(10),
    company VARCHAR(50),
    PRIMARY KEY (id),
    CHECK(id >= 0)
) ENGINE = INNODB;

-- PK2: id in the Actor Table is the primary key.
-- Check2: id in the Actor Table should not be negative.
CREATE TABLE  Actor (
    id INT NOT NULL,
    last VARCHAR(20),
    first VARCHAR(20),
    sex VARCHAR(6),
    dob DATE,
    dod DATE,
    PRIMARY KEY (id),
    CHECK(id >= 0)
) ENGINE = INNODB;

-- PK3: id in the Director Table is the primary key.
-- Check3: id in the Director Table should not be negative.
CREATE TABLE Director(
    id INT NOT NULL,
    last VARCHAR(20),
    first VARCHAR(20),
    dob DATE,
    dod DATE,
    PRIMARY KEY (id),
    CHECK(id >= 0)
) ENGINE = INNODB;

-- FK1: mid in the MovieGenre Table is a foreign key refering to the primary key in Movie Table.
CREATE TABLE MovieGenre(
    mid INT,
    genre VARCHAR(20),
    FOREIGN KEY (mid) references Movie(id)
) ENGINE = INNODB;

-- FK2: mid in the MovieDirector Table is a foreign key refering to the primary key in Movie Table.
-- FK3: did in the MovieDirector Table is a foreign key refering to the primary key in Director Table.
CREATE TABLE MovieDirector(
    mid INT,
    did INT,
    FOREIGN KEY (mid) references Movie(id),
    FOREIGN KEY (did) references Director(id)
) ENGINE = INNODB;

-- FK4: mid in the MovieActor Table is a foreign key refering to the primary key in Movie Table.
-- FK5: aid in the MovieActor Table is a foreign key refering to the primary key in Actor Table.
CREATE TABLE MovieActor(
    mid INT,
    aid INT,
    role VARCHAR(50),
    FOREIGN KEY (mid) references Movie(id),
    FOREIGN KEY (aid) references Actor(id)
) ENGINE = INNODB;

-- FK6: mid in the Review Table is a foreign key refering to the primary key in Movie Table.
CREATE TABLE Review(
    name VARCHAR(20),
    time TIMESTAMP,
    mid INT,
    rating INT,
    comment VARCHAR(500),
    FOREIGN KEY (mid) references Movie(id)
) ENGINE = INNODB;

CREATE TABLE MaxPersonID(
    id INT
) ENGINE = INNODB;

CREATE TABLE MaxMovieID(
    id INT
) ENGINE = INNODB;
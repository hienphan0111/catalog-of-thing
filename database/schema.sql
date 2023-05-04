create table item(
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	genre_id INT,
	author_id INT,
	label_id INT,
	publish_date DATE,
    archived BOOLEAN,
	FOREIGN Key(genre_id) REFERENCES genre(id),
	FOREIGN Key(author_id) REFERENCES author(id),
	FOREIGN Key(label_id) REFERENCES label(id),
    PRIMARY KEY(id)
);

-- Create index --

CREATE INDEX idx_genre_id ON item (genre_id)
CREATE INDEX idx_author_id ON item (author_id)
CREATE INDEX idx_label_id ON item (label_id)

create table game(
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	genre_id INT,
	author_id INT,
	label_id INT,
	multiplayer BOOLEAN,
	last_played_at DATE,
	FOREIGN Key(genre_id) REFERENCES genre(id),
	FOREIGN Key(author_id) REFERENCES author(id),
	FOREIGN Key(label_id) REFERENCES label(id),
    PRIMARY KEY(id)
);

CREATE INDEX idx_genre_id ON game (genre_id)
CREATE INDEX idx_author_id ON game (author_id)
CREATE INDEX idx_label_id ON game (label_id)

create table book(
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	genre_id INT,
	author_id INT,
	label_id INT,
	publisher VARCHAR(100),
	last_played_at DATE,
	FOREIGN Key(genre_id) REFERENCES genre(id),
	FOREIGN Key(author_id) REFERENCES author(id),
	FOREIGN Key(label_id) REFERENCES label(id),
    PRIMARY KEY(id)
);

CREATE INDEX idx_genre_id ON book (genre_id)
CREATE INDEX idx_author_id ON book (author_id)
CREATE INDEX idx_label_id ON book (label_id)

create table label(
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	title VARCHAR(100),
    color VARCHAR(100),
    items TEXT[],
    PRIMARY KEY(id)
);

create table author(
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	first_name VARCHAR(100),
    last_name VARCHAR(100),
    items TEXT[],
    PRIMARY KEY(id)
);

create table music_album(
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	genre_id INT,
	author_id INT,
	label_id INT,
	on_spotify BOOLEAN,
	FOREIGN Key(genre_id) REFERENCES genre(id),
	FOREIGN Key(author_id) REFERENCES author(id),
	FOREIGN Key(label_id) REFERENCES label(id),
    PRIMARY KEY(id)
);

CREATE INDEX idx_genre_id ON music_album (genre_id)
CREATE INDEX idx_author_id ON music_album (author_id)
CREATE INDEX idx_label_id ON music_album (label_id)

create table genre(
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    items TEXT[],
    PRIMARY KEY(id)
);

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

create table MusicAlbum(
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

create table genre(
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    items TEXT[],
    PRIMARY KEY(id)
);
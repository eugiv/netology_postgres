CREATE TABLE IF NOT EXISTS albums (
	id SERIAL PRIMARY KEY,
	album_name VARCHAR(60) NOT NULL UNIQUE,
	album_release_year SMALLINT NOT NULL
);

CREATE TABLE IF NOT EXISTS collections (
	id SERIAL PRIMARY KEY,
	collection_name VARCHAR(60) NOT NULL UNIQUE,
	collection_release_year SMALLINT NOT NULL
);

CREATE TABLE IF NOT EXISTS genres (
	id SERIAL PRIMARY KEY,
	genre_name VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS musicians (
	id SERIAL PRIMARY KEY,
	musician_name_alias VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS tracks (
	id SERIAL PRIMARY KEY,
	track_name VARCHAR(60) NOT NULL UNIQUE,
	track_length INTEGER NOT NULL,
	album_id INTEGER NOT NULL REFERENCES albums(id)
	);

-- genre_musician "many-to-many"
CREATE TABLE IF NOT EXISTS genre_musician (
	genre_id_gm INTEGER NOT NULL REFERENCES genres(id),
	musician_id_gm INTEGER NOT NULL REFERENCES musicians(id),
	CONSTRAINT pk_gm PRIMARY KEY (genre_id_gm, musician_id_gm)
);

-- albums_musician "many-to-many"
CREATE TABLE IF NOT EXISTS album_musician (
	album_id_am INTEGER NOT NULL REFERENCES albums(id),
	musician_id_am INTEGER NOT NULL REFERENCES musicians(id),
	CONSTRAINT pk_am PRIMARY KEY (album_id_am, musician_id_am)
);

-- collections_tracks "many_to_many"
CREATE TABLE IF NOT EXISTS collection_track (
	collection_id_ct INTEGER NOT NULL REFERENCES collections(id),
	track_id_ct INTEGER NOT NULL REFERENCES tracks(id),
	CONSTRAINT pk_ct PRIMARY KEY (collection_id_ct, track_id_ct)
);
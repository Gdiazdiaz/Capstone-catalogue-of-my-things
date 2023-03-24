CREATE DATABASE database_name
-- genres table
CREATE TABLE genres (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(100)
);

-- music_albums table
CREATE TABLE music_albums (
  id BIGSERIAL PRIMARY KEY,
  publish_year DATE,
  on_spotify BOOLEAN,
  CONSTRAINT fk_genres FOREIGN KEY(genre_id) REFERENCES genres(id)
);

-- books table
CREATE TABLE books(
  publisher text,
  cover_state text
);

-- labels table
CREATE TABLE labels(
  id SERIAL PRIMARY KEY,
  title text,
  color text,
  item_id int REFERENCES item (id)
);

-- movies table
CREATE TABLE movies(
  id BIGSERIAL PRIMARY KEY,
  publish_year DATE,
  silent BOOLEAN,
  CONSTRAINT fk_sources FOREIGN KEY(source_id) REFERENCES sources(id)
);

--sources table
CREATE TABLE sources (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(100)
);

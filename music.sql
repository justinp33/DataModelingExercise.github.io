-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album_id INTEGER REFERENCES albums
);

CREATE TABLE song_artist_producer
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs,
  artist_id INTEGER REFERENCES artists,
  producer_id INTEGER REFERENCES producers
);

INSERT INTO albums
  (name)
VALUES 
  ('This album'),
  ('That album');

INSERT INTO songs
  (title, duration_in_seconds, release_date, album_id)
VALUES
  ('Hello', 200, '10-12-2020', 1),
  ('Goodbye', 300, '10-20-2018', 2);

INSERT INTO producers
  (first_name, last_name)
VALUES 
  ('What', 'Guy'),
  ('That', 'Guy');

INSERT INTO artists
  (first_name, last_name)
VALUES 
  ('Kenny', 'Chesney'),
  ('Rick', 'Ross');



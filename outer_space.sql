-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);


CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy_id INTEGER REFERENCES galaxies NOT NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  size FLOAT,
  planet_id INTEGER REFERENCES planets
);

INSERT INTO galaxies
  (name)
VALUES
  ('Milky Way');


INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy_id)
VALUES
  ('Earth', 1.00, 'The Sun', 1),
  ('Mars', 1.88, 'The Sun', 1),
  ('Venus', 0.62, 'The Sun', 1),
  ('Neptune', 164.8, 'The Sun', 1),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 1),
  ('Gliese 876 b', 0.23, 'Gliese 876', 1);

INSERT INTO moons
  (name, planet_id)
VALUES  
  ('This Moon', 3),
  ('That Moon', 4);




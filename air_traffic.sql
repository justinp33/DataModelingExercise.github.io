-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  departure TIME NOT NULL,
  arrival TIME NOT NULL,
  airline_id INTEGER REFERENCES airlines NOT NULL,
  from_city_id INTEGER REFERENCES cities NOT NULL,
  to_city_id INTEGER REFERENCES cities NOT NULL,
  to_country_id INTEGER REFERENCES countries NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  flight_id INTEGER REFERENCES flights NOT NULL,
  passenger_id INTEGER REFERENCES passengers NOT NULL,
  seat TEXT NOT NULL
);

INSERT INTO passengers
  (first_name, last_name)
VALUES 
  ('That', 'Guy'),
  ('This', 'Guy');

INSERT INTO airlines
  (name)
VALUES
  ('Spirit'),
  ('United');

INSERT INTO cities
  (name)
VALUES
  ('Houston'),
  ('Denver');

INSERT INTO countries
  (name)
VALUES
  ('USA'),
  ('Italy');

INSERT INTO flights
  (departure, arrival, airline_id,from_city_id,to_city_id,to_country_id)
VALUES
  ('12:30:00','2:30:00', 2, 1, 2, 1),
  ('3:30:00', '5:20:00', 1, 2, 1, 2);

INSERT INTO tickets
  (flight_id, passenger_id, seat)
VALUES
  (1,2,'3B'),
  (2,1,'4B');

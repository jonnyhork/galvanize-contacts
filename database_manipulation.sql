CREATE DATABASE galvanize_contracts;

CREATE USER galvanize_admin PASSWORD 'galvanize_P@$$w0rd';

REVOKE ALL PRIVILEGES ON DATABASE galvanize_contracts FROM PUBLIC;

GRANT USAGE ON SCHEMA public TO PUBLIC;

ALTER USER galvanize_admin WITH SUPERUSER;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO galvanize_admin;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON SEQUENCES TO galvanize_admin;

pg_dumpall -r > database_roles.sql;

CREATE TABLE "User"(id SERIAL PRIMARY KEY, first_name VARCHAR, last_name VARCHAR, date_of_birth DATE, biography TEXT);

CREATE TABLE Contact(id SERIAL PRIMARY KEY, type VARCHAR, value VARCHAR, user_id NUMERIC);


INSERT INTO "User" (first_name, last_name, date_of_birth, biography) VALUES ('Kyle', 'Colberly', date '1961-02-18', 'Web app developer, business dork, amateur economist.');

INSERT INTO "User" (first_name, last_name, date_of_birth, biography) VALUES ('CJ', 'Reynolds', date '2031-04-28', 'Does the man have the moustache, or does the moustache have the man?');

INSERT INTO "User" (first_name, last_name, date_of_birth, biography) VALUES ('Danny', 'Fritz', date '1805-05-15', 'Definitely a human instructor, not a robot.');

INSERT INTO "User" (first_name, last_name, date_of_birth, biography) VALUES ('Roberto', 'Ortega', date '2015-10-17', 'Llamas age faster than people.');



INSERT INTO contact (type, value, user_id) VALUES ('email', 'Kyle.Coberly@galvanize.com', 1);
INSERT INTO contact (type, value, user_id) VALUES ('email', 'CJ.Reynolds@galvanize.com', 2);
INSERT INTO contact (type, value, user_id) VALUES ('email', 'Danny.Fritz@galvanize.com', 3);
INSERT INTO contact (type, value, user_id) VALUES ('email', 'Roberto.Ortega@galvanize.com',4 );
INSERT INTO contact (type, value, user_id) VALUES ('mobile phone', '911', 1);
INSERT INTO contact (type, value, user_id) VALUES ('home phone', '0', 3);

pg_dump galvanize_contacts > database_dump.sql

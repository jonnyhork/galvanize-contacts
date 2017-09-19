--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: User; Type: TABLE; Schema: public; Owner: jonnyhork
--

CREATE TABLE "User" (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    date_of_birth date,
    biography text
);


ALTER TABLE "User" OWNER TO jonnyhork;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: jonnyhork
--

CREATE SEQUENCE "User_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "User_id_seq" OWNER TO jonnyhork;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jonnyhork
--

ALTER SEQUENCE "User_id_seq" OWNED BY "User".id;


--
-- Name: contact; Type: TABLE; Schema: public; Owner: jonnyhork
--

CREATE TABLE contact (
    id integer NOT NULL,
    type character varying,
    value character varying,
    user_id numeric
);


ALTER TABLE contact OWNER TO jonnyhork;

--
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: jonnyhork
--

CREATE SEQUENCE contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contact_id_seq OWNER TO jonnyhork;

--
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jonnyhork
--

ALTER SEQUENCE contact_id_seq OWNED BY contact.id;


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: jonnyhork
--

ALTER TABLE ONLY "User" ALTER COLUMN id SET DEFAULT nextval('"User_id_seq"'::regclass);


--
-- Name: contact id; Type: DEFAULT; Schema: public; Owner: jonnyhork
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: jonnyhork
--

COPY "User" (id, first_name, last_name, date_of_birth, biography) FROM stdin;
1	Kyle	Colberly	1961-02-18	Web app developer, business dork, amateur economist.
3	Danny	Fritz	1805-05-15	Definitely a human instructor, not a robot.
2	CJ	Reynolds	2031-04-28	Does the man have the moustache, or does the moustache have the man?
4	Roberto	Ortega	2015-10-17	Llamas age faster than people.
\.


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jonnyhork
--

SELECT pg_catalog.setval('"User_id_seq"', 4, true);


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: jonnyhork
--

COPY contact (id, type, value, user_id) FROM stdin;
1	email	Kyle.Coberly@galvanize.com	1
2	email	CJ.Reynolds@galvanize.com	2
3	email	Danny.Fritz@galvanize.com	3
4	email	Roberto.Ortega@galvanize.com	4
5	mobile phone	911	1
6	home phone	0	3
\.


--
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jonnyhork
--

SELECT pg_catalog.setval('contact_id_seq', 6, true);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: jonnyhork
--

ALTER TABLE ONLY "User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: jonnyhork
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- Name: User; Type: ACL; Schema: public; Owner: jonnyhork
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "User" TO galvanize_admin;


--
-- Name: contact; Type: ACL; Schema: public; Owner: jonnyhork
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE contact TO galvanize_admin;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: jonnyhork
--

ALTER DEFAULT PRIVILEGES FOR ROLE jonnyhork IN SCHEMA public REVOKE ALL ON TABLES  FROM jonnyhork;
ALTER DEFAULT PRIVILEGES FOR ROLE jonnyhork IN SCHEMA public GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES  TO galvanize_admin;


--
-- PostgreSQL database dump complete
--


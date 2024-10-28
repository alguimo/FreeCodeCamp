--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: astronaut; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronaut (
    astronaut_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year integer,
    year_first_travel integer,
    height numeric(4,1),
    weight numeric(4,1),
    country text NOT NULL
);


ALTER TABLE public.astronaut OWNER TO freecodecamp;

--
-- Name: astronauts_astronaut_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronauts_astronaut_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronauts_astronaut_id_seq OWNER TO freecodecamp;

--
-- Name: astronauts_astronaut_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronauts_astronaut_id_seq OWNED BY public.astronaut.astronaut_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text,
    distance_from_earth_millions_yl numeric(4,1),
    size_in_light_years integer,
    discovery integer,
    visible_naked_eye boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text,
    distance_from_earth numeric(4,1),
    age integer,
    discovery integer,
    visible_naked_eye boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text,
    distance_fron_earth numeric(4,1),
    age integer,
    discovery integer,
    visible_naked_eye boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text,
    distance_from_earth_yl numeric(4,1),
    age_in_billions integer,
    discovery integer,
    visible_naked_eye boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: astronaut astronaut_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut ALTER COLUMN astronaut_id SET DEFAULT nextval('public.astronauts_astronaut_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: astronaut; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronaut VALUES (1, 6, 'Neil Armstrong', 1930, 1969, 180.3, 75.0, 'USA');
INSERT INTO public.astronaut VALUES (2, 6, 'Yuri Gagarin', 1934, 1961, 157.0, 69.0, 'USSR');
INSERT INTO public.astronaut VALUES (3, 6, 'Valentina Tereshkova', 1937, 1963, 170.2, 70.0, 'USSR');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 0.0, 105700, 1610, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Barred Spiral', 2.5, 150000, 961, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'Spiral', 3.2, 61100, 1654, false);
INSERT INTO public.galaxy VALUES (4, 'Phoenix Dwarf', 'Irregular', 1.4, NULL, 1976, false);
INSERT INTO public.galaxy VALUES (5, 'Leo A', 'Irregular', 2.6, NULL, 1942, false);
INSERT INTO public.galaxy VALUES (6, 'Antennae Galaxies', 'Interacting', 45.0, NULL, 1785, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Sirius b I', 'Exoplanet Moon', 8.6, 1, 2012, false);
INSERT INTO public.moon VALUES (2, 2, 'Betelgeuse I', 'Hypothetical Moon', 64.5, 1, 2015, false);
INSERT INTO public.moon VALUES (3, 3, 'Proxima b I', 'Hypothetical Moon', 4.2, 1, 2016, false);
INSERT INTO public.moon VALUES (4, 6, 'Moon', 'Terrestrial Moon', 0.0, 5, 0, true);
INSERT INTO public.moon VALUES (5, 6, 'Phobos', 'Mars Moon', 54.6, 5, 1877, true);
INSERT INTO public.moon VALUES (6, 6, 'Deimos', 'Mars Moon', 54.6, 5, 1877, false);
INSERT INTO public.moon VALUES (7, 5, 'Io', 'Jupiter Moon', 58.5, 5, 1610, false);
INSERT INTO public.moon VALUES (8, 5, 'Europa', 'Jupiter Moon', 58.5, 5, 1610, false);
INSERT INTO public.moon VALUES (9, 5, 'Ganymede', 'Jupiter Moon', 58.5, 5, 1610, false);
INSERT INTO public.moon VALUES (10, 5, 'Callisto', 'Jupiter Moon', 58.5, 5, 1610, false);
INSERT INTO public.moon VALUES (11, 5, 'Titan', 'Saturn Moon', 90.0, 5, 1655, false);
INSERT INTO public.moon VALUES (12, 5, 'Rhea', 'Saturn Moon', 9.0, 5, 1672, false);
INSERT INTO public.moon VALUES (13, 5, 'Enceladus', 'Saturn Moon', 9.0, 5, 1789, false);
INSERT INTO public.moon VALUES (14, 5, 'Mimas', 'Saturn Moon', 9.0, 5, 1789, false);
INSERT INTO public.moon VALUES (15, 5, 'Tethys', 'Saturn Moon', 99.0, 5, 1684, false);
INSERT INTO public.moon VALUES (16, 4, 'Charon', 'Pluto Moon', 39.6, 5, 1978, false);
INSERT INTO public.moon VALUES (17, 4, 'Hydra', 'Pluto Moon', 39.6, 5, 2005, false);
INSERT INTO public.moon VALUES (18, 4, 'Nix', 'Pluto Moon', 39.6, 5, 2005, false);
INSERT INTO public.moon VALUES (19, 3, 'Triton', 'Neptune Moon', 30.1, 5, 1846, false);
INSERT INTO public.moon VALUES (20, 3, 'Proteus', 'Neptune Moon', 30.1, 5, 1989, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Sirius b', 'Exoplanet', 8.6, 1, 2012, false);
INSERT INTO public.planet VALUES (2, 1, 'Sirius c', 'Exoplanet', 8.6, 1, 2020, false);
INSERT INTO public.planet VALUES (3, 2, 'Betelgeuse I', 'Gas Giant', 64.5, 1, 2015, false);
INSERT INTO public.planet VALUES (4, 2, 'Betelgeuse II', 'Ice Giant', 64.5, 1, 2018, false);
INSERT INTO public.planet VALUES (5, 3, 'Proxima b', 'Rocky Planet', 4.2, 5, 2016, false);
INSERT INTO public.planet VALUES (6, 3, 'Proxima c', 'Super-Earth', 4.2, 5, 2019, false);
INSERT INTO public.planet VALUES (7, 6, 'Mercury', 'Terrestrial Planet', 91.7, 5, 0, true);
INSERT INTO public.planet VALUES (8, 6, 'Venus', 'Terrestrial Planet', 41.4, 5, 0, true);
INSERT INTO public.planet VALUES (9, 6, 'Earth', 'Terrestrial Planet', 0.0, 5, 0, true);
INSERT INTO public.planet VALUES (10, 6, 'Mars', 'Terrestrial Planet', 54.6, 5, 0, true);
INSERT INTO public.planet VALUES (11, 6, 'Jupiter', 'Gas Giant', 58.5, 5, 0, true);
INSERT INTO public.planet VALUES (12, 6, 'Saturn', 'Gas Giant', 99.0, 5, 0, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sirius', 'Main Sequence Star', 8.6, 200, 1500, true);
INSERT INTO public.star VALUES (2, 1, 'Betelgeuse', 'Red Supergiant Star', 642.5, 10000, 1000, true);
INSERT INTO public.star VALUES (3, 1, 'Proxima Centauri', 'Red Dwarf Star', 4.2, 4800, 1915, false);
INSERT INTO public.star VALUES (4, 1, 'Vega', 'Main Sequence Star', 25.0, 455, -400, true);
INSERT INTO public.star VALUES (5, 1, 'Altair', 'Main Sequence Star', 16.7, 1000, -200, true);
INSERT INTO public.star VALUES (6, 1, 'Sun', 'G-type Main Sequence Star', 0.0, 5, -5000, true);


--
-- Name: astronauts_astronaut_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronauts_astronaut_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: astronaut astronauts_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronauts_name_key UNIQUE (name);


--
-- Name: astronaut astronauts_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronauts_pkey PRIMARY KEY (astronaut_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: astronaut astronauts_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronauts_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


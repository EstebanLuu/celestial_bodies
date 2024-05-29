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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    name character varying(30),
    constellation_id character varying(30) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    galaxy_type character varying(50),
    distance_from_earth integer
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
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean,
    has_life boolean,
    planet_id integer
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    description text,
    is_spherical boolean,
    has_life boolean,
    star_id integer
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
    name character varying(30) NOT NULL,
    radius numeric,
    description text,
    is_spherical boolean,
    has_life boolean,
    galaxy_id integer
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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES ('Orion', 'OR1', 'A prominent constellation located on the celestial equator and visible throughout the world.');
INSERT INTO public.constellation VALUES ('Ursa Major', 'UM1', 'Known as the Great Bear, it is a large constellation best known for containing the asterism of the Big Dipper.');
INSERT INTO public.constellation VALUES ('Cassiopeia', 'CA1', 'A constellation in the northern sky, named after the vain queen Cassiopeia in Greek mythology.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 'Spiral', 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 'Spiral', 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 8500, 'Spiral', 3000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 400, 'Spiral', 23000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 500, 'Spiral', 29000000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 1000, 'Spiral', 21000000);
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 1200, 'Elliptical', 53000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (4, 'Titan', NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (45, 'Moon', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (46, 'Phobos', NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (47, 'Deimos', NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (48, 'Ganymede', NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (49, 'Titan', NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (50, 'Triton', NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (51, 'Titania', NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (52, 'Oberon', NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (53, 'Charon', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (54, 'Europa', NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (55, 'Enceladus', NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (56, 'Callisto', NULL, NULL, NULL, 10);
INSERT INTO public.moon VALUES (57, 'Moon', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (58, 'Phobos', NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (59, 'Deimos', NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (60, 'Ganymede', NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (61, 'Titan', NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (62, 'Triton', NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (63, 'Titania', NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (64, 'Titania', NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (65, 'Titania', NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (66, 'Titania', NULL, NULL, NULL, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Mars', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (3, 'Proxima b', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (4, 'Vega', NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (5, 'Mercury', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (6, 'Venus', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Earth', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (9, 'Jupiter', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (10, 'Saturn', NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (11, 'Uranus', NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (12, 'Pluto', NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (13, 'Haumea', NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (14, 'Makemake', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (15, 'Eris', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (16, 'Kepler-22b', NULL, NULL, NULL, NULL, NULL, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'Sun', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (3, 'Sun', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (4, 'Sun', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (6, 'Betelgeuse', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (7, 'Rigel', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.star VALUES (8, 'Sirius', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.star VALUES (9, 'Vega', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.star VALUES (10, 'Polaris', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.star VALUES (11, 'Aldebaran', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.star VALUES (12, 'Antares', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.star VALUES (13, 'Spica', NULL, NULL, NULL, NULL, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 66, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: constellation constellation_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_description_key UNIQUE (description);


--
-- Name: constellation constellation_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_id_unique UNIQUE (constellation_id);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_unique UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_unique UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_unique UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_unique UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- PostgreSQL database dump complete
--


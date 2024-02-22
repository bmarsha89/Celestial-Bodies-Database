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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type text NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_in_miles numeric(100,2)
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
    name character varying(40) NOT NULL,
    is_spherical boolean NOT NULL,
    planet_id integer,
    planet_of_orbit text
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
    name character varying(40) NOT NULL,
    has_life boolean NOT NULL,
    planet_type text,
    distance_from_earth_in_miles numeric(100,2),
    number_of_moons integer NOT NULL,
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    terrestrial boolean NOT NULL,
    giant boolean NOT NULL,
    dwarf boolean NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    part_of_constellation boolean NOT NULL,
    distance_from_earth_in_miles numeric(100,2),
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barrel spiral', 13610, 152844259703717500.00);
INSERT INTO public.galaxy VALUES (2, 'Cigar Galaxy', 'starburst', 500, 70543504478216970000.00);
INSERT INTO public.galaxy VALUES (3, 'Medusa Merger', 'galaxy pair', 700, 764221298513846700000.00);
INSERT INTO public.galaxy VALUES (4, 'Pisces Dwarf', 'irregular dwarf', 100, 111693882090455970000.00);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'lenticular', 13250, 1763587611954959500000.00);
INSERT INTO public.galaxy VALUES (6, 'Leo I', 'spheroidal dwarf', 10000, 4879259059733193000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 3, 'Earth');
INSERT INTO public.moon VALUES (2, 'Phobos', false, 4, 'Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', false, 4, 'Mars');
INSERT INTO public.moon VALUES (4, 'Charon', true, 9, 'Pluto');
INSERT INTO public.moon VALUES (5, 'Atlas', false, 6, 'Saturn');
INSERT INTO public.moon VALUES (6, 'Hyperion', false, 6, 'Saturn');
INSERT INTO public.moon VALUES (7, 'Mimas', true, 6, 'Saturn');
INSERT INTO public.moon VALUES (8, 'Iapetus', true, 6, 'Saturn');
INSERT INTO public.moon VALUES (9, 'Pan', false, 6, 'Saturn');
INSERT INTO public.moon VALUES (10, 'Callisto', true, 5, 'Jupiter');
INSERT INTO public.moon VALUES (11, 'Ganymede', true, 5, 'Jupiter');
INSERT INTO public.moon VALUES (12, 'Miranda', true, 7, 'Uranus');
INSERT INTO public.moon VALUES (13, 'Epimetheus', false, 6, 'Saturn');
INSERT INTO public.moon VALUES (14, 'Janus', false, 6, 'Saturn');
INSERT INTO public.moon VALUES (15, 'Triton', true, 8, 'Neptune');
INSERT INTO public.moon VALUES (16, 'Titan', true, 6, 'Saturn');
INSERT INTO public.moon VALUES (17, 'Io', true, 5, 'Jupiter');
INSERT INTO public.moon VALUES (18, 'Rhea', true, 6, 'Saturn');
INSERT INTO public.moon VALUES (19, 'Europa', true, 5, 'Jupiter');
INSERT INTO public.moon VALUES (20, 'Enceladus', true, 6, 'Saturn');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 'terrestrial', 129229022.38, 0, 3);
INSERT INTO public.planet VALUES (2, 'Venus', false, 'terrestrial', 136246814.00, 0, 3);
INSERT INTO public.planet VALUES (3, 'Earth', true, 'terrestrial', 0.00, 1, 3);
INSERT INTO public.planet VALUES (4, 'Mars', false, 'terrestrial', 208341107.18, 2, 3);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 'giant', 491370253.43, 95, 3);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 'giant', 1022513879.94, 146, 3);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 'giant', 1840873289.31, 27, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 'giant', 2704084433.41, 14, 3);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 'dwarf', 3327645560.11, 5, 3);
INSERT INTO public.planet VALUES (10, 'Haumea', false, 'dwarf', 4606183251.08, 2, 3);
INSERT INTO public.planet VALUES (11, 'Makemake', false, 'dwarf', 4835771638.96, 1, 3);
INSERT INTO public.planet VALUES (12, 'Eris', false, 'dwarf', 8948023146.38, 1, 3);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, true, false, false, 'Mercury', 1);
INSERT INTO public.planet_type VALUES (2, true, false, false, 'Venus', 2);
INSERT INTO public.planet_type VALUES (3, true, false, false, 'Earth', 3);
INSERT INTO public.planet_type VALUES (4, true, false, false, 'Mars', 4);
INSERT INTO public.planet_type VALUES (5, false, true, false, 'Jupiter', 5);
INSERT INTO public.planet_type VALUES (6, false, true, false, 'Saturn', 6);
INSERT INTO public.planet_type VALUES (7, false, true, false, 'Uranus', 7);
INSERT INTO public.planet_type VALUES (8, false, true, false, 'Neptune', 8);
INSERT INTO public.planet_type VALUES (9, false, false, true, 'Pluto', 9);
INSERT INTO public.planet_type VALUES (10, false, false, true, 'Haumea', 10);
INSERT INTO public.planet_type VALUES (11, false, false, true, 'Makemake', 11);
INSERT INTO public.planet_type VALUES (12, false, false, true, 'Eris', 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', true, 3821106492546459.50, 1);
INSERT INTO public.star VALUES (2, 'Sirius', true, 50556178209619.66, 1);
INSERT INTO public.star VALUES (3, 'Sun', false, 92955807.27, 1);
INSERT INTO public.star VALUES (4, 'Polaris', true, 2545444786575974.00, 1);
INSERT INTO public.star VALUES (5, 'Antares', true, 3550689725384779.00, 1);
INSERT INTO public.star VALUES (6, 'VY Canis Majoris', true, 29393126865885004.00, 1);


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
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: planet_type planet_type_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


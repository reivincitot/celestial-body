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
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years bigint,
    galaxy_type character varying(30),
    has_life boolean,
    num_of_stars_in_millions integer
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
    planet_id integer,
    distance_to_planet_in_thousands_of_km numeric(12,2),
    is_spherical boolean
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
    star_id integer,
    size_in_km integer,
    distance_to_star_in_millions_of_km numeric(12,2),
    planet_type character varying(30),
    has_moons boolean
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
-- Name: report; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.report (
    report_id integer NOT NULL,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer,
    description text,
    name character varying(30) NOT NULL
);


ALTER TABLE public.report OWNER TO freecodecamp;

--
-- Name: report_report_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.report_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_report_id_seq OWNER TO freecodecamp;

--
-- Name: report_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.report_report_id_seq OWNED BY public.report.report_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    sun_mass numeric(10,2),
    luminosity_that_the_sun numeric(10,2),
    is_spherical boolean
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
-- Name: report report_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.report ALTER COLUMN report_id SET DEFAULT nextval('public.report_report_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The Milky Way is our home galaxy, a vast spiral system containing billions of stars, including our sun. Its spiral arms extend across the galactic plane, creating a mesmerizing cosmic tapestry.', 13600, 'Spiral', true, 100);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Glaxy', 'Andromeda, also known as M31, is a majestic spiral galaxy neighboring the Milky Way. It is on a collision course with our galaxy, and when these two cosmic giants meet, they will create a breathtaking dance of stars.', 13200, 'Spiral', false, 120);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'Triangulum Galaxy, also known as M33, is a beautiful spiral galaxy located in the constellation Triangulum. It is part of the Local Group, a collection of galaxies that includes the Milky Way and Andromeda.', 12800, 'Spiral', false, 50);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Centaurus A is an active galaxy residing in the Centaurus Cluster. Its distinctive appearance combines a bright elliptical core with dark dust lanes, showcasing the complex interplay of cosmic forces within.', 13400, 'Elliptical', false, 20);
INSERT INTO public.galaxy VALUES (5, 'Bode''s Galaxy', 'Bode''s Galaxy, or M81, is an irregular galaxy known for its grand design spiral structure. It is located in the Ursa Major constellation and has been a subject of fascination for astronomers studying galaxy morphology.', 14000, 'Irregular', true, 30);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'The Sombrero Galaxy, or M104, is a stunning spiral galaxy with a bright central bulge and a prominent dust lane resembling a wide-brimmed hat. Its distinctive appearance makes it a captivating object in the night sky.', 12900, 'Spiral', false, 70);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos Prime', 4, 9.40, true);
INSERT INTO public.moon VALUES (2, 'Titan Minor', 6, 1222.00, true);
INSERT INTO public.moon VALUES (3, 'Europa Alpha', 5, 670.00, true);
INSERT INTO public.moon VALUES (4, 'Io Prime', 5, 420.00, true);
INSERT INTO public.moon VALUES (5, 'Triton Minoris', 8, 350.00, true);
INSERT INTO public.moon VALUES (6, 'Ganymede Alpha', 5, 890.00, true);
INSERT INTO public.moon VALUES (7, 'Luna Prime', 1, 384.40, true);
INSERT INTO public.moon VALUES (8, 'Enceladus Minor', 6, 237.00, true);
INSERT INTO public.moon VALUES (9, 'Phoebe Beta', 6, 12952.00, true);
INSERT INTO public.moon VALUES (10, 'Deimos Prime', 4, 23.46, true);
INSERT INTO public.moon VALUES (11, 'Calisto Minor', 5, 1882.70, true);
INSERT INTO public.moon VALUES (12, 'Mimas Alpha', 6, 185.52, true);
INSERT INTO public.moon VALUES (13, 'Miranda Beta', 7, 129.78, true);
INSERT INTO public.moon VALUES (14, 'Rhea Prime', 6, 527.04, true);
INSERT INTO public.moon VALUES (15, 'Umbriel Minoris', 7, 265.98, true);
INSERT INTO public.moon VALUES (16, 'Oberon Alpha', 7, 583.52, true);
INSERT INTO public.moon VALUES (17, 'Ariel Beta', 7, 191.02, true);
INSERT INTO public.moon VALUES (18, 'Titania Minor', 7, 435.84, true);
INSERT INTO public.moon VALUES (19, 'Puck Prime', 7, 86.00, true);
INSERT INTO public.moon VALUES (20, 'Iapteus Alpha', 6, 3560.82, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 2, 12742, 149.60, 'Terrestrial', true);
INSERT INTO public.planet VALUES (2, 'Mercury', 2, 4880, 57.90, 'Terrestrial', false);
INSERT INTO public.planet VALUES (3, 'Venus', 2, 12104, 108.20, 'Terrestrial', false);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 6779, 227.90, 'Terrestrial', true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 2, 139820, 778.50, 'Gas giant', true);
INSERT INTO public.planet VALUES (6, 'Saturn', 2, 116460, 1400.00, 'Gas giant', true);
INSERT INTO public.planet VALUES (7, 'Uranus', 2, 50724, 2900.00, 'Ice giant', true);
INSERT INTO public.planet VALUES (8, 'Neptune', 2, 49244, 4500.00, 'Ice giant', true);
INSERT INTO public.planet VALUES (9, 'Gliese Prime I', 1, 10500, 36.00, 'Terrestrian', true);
INSERT INTO public.planet VALUES (10, 'Vega Minoris IX', 5, 16200, 72.00, 'Gas giant', true);
INSERT INTO public.planet VALUES (11, 'Siruis Prime III', 3, 22800, 120.00, 'Gas giant', true);
INSERT INTO public.planet VALUES (12, 'Betelgeuse Major', 4, 38600, 280.00, 'Gas giant', true);


--
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.report VALUES (1, 1, 2, 1, 7, 'Report of home', 'Earth Report');
INSERT INTO public.report VALUES (2, 1, 2, 4, 10, 'Mars moon', 'Phobos Report');
INSERT INTO public.report VALUES (3, 1, 2, 5, 3, 'Saturn Moon', 'Saturn Report');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sun', 1, 1.00, 1.00, true);
INSERT INTO public.star VALUES (7, 'Polaris', 1, 5.40, 2500.00, true);
INSERT INTO public.star VALUES (6, 'Antares', 1, 18.00, 60000.00, false);
INSERT INTO public.star VALUES (5, 'Vega', 1, 2.15, 37.00, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 12.50, 124000.00, false);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 2.02, 25.40, true);
INSERT INTO public.star VALUES (1, 'Alpha Centauri', 1, 1.10, 1.50, true);


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
-- Name: report_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.report_report_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: report report_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT report_name_key UNIQUE (name);


--
-- Name: report report_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT report_pkey PRIMARY KEY (report_id);


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
-- Name: report report_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT report_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: report report_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT report_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: report report_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT report_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: report report_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT report_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: discoveries; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.discoveries (
    name character varying(50) NOT NULL,
    discoveries_id integer NOT NULL,
    discovery_date date NOT NULL,
    discovery_method character varying(50),
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer,
    notes text
);


ALTER TABLE public.discoveries OWNER TO freecodecamp;

--
-- Name: discoveries_discovery_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.discoveries_discovery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discoveries_discovery_id_seq OWNER TO freecodecamp;

--
-- Name: discoveries_discovery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.discoveries_discovery_id_seq OWNED BY public.discoveries.discoveries_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50),
    age_in_millions_of_years numeric(8,2) NOT NULL,
    size_ranking integer,
    type character varying(50),
    CONSTRAINT galaxy_size_ranking_check CHECK (((size_ranking > 0) AND (size_ranking <= 5)))
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    moon_type text,
    age_in_millions_of_years numeric(8,2) NOT NULL,
    has_atmosphere boolean,
    orbital_period numeric NOT NULL,
    planet_id integer NOT NULL,
    CONSTRAINT moon_orbital_period_check CHECK ((orbital_period > (0)::numeric))
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
    name character varying(50) NOT NULL,
    planet_type text,
    age_in_millions_of_years numeric(8,2) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    orbital_period numeric NOT NULL,
    star_id integer NOT NULL,
    CONSTRAINT planet_orbital_period_check CHECK ((orbital_period > (0)::numeric))
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
    name character varying(50) NOT NULL,
    type text,
    age_in_millions_of_years numeric(8,2) NOT NULL,
    size_ranking integer,
    luminosity numeric NOT NULL,
    is_stray boolean NOT NULL,
    galaxy_id integer,
    CONSTRAINT star_luminosity_check CHECK ((luminosity >= (0)::numeric)),
    CONSTRAINT star_size_ranking_check CHECK (((size_ranking > 0) AND (size_ranking <= 5)))
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
-- Name: discoveries discoveries_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoveries ALTER COLUMN discoveries_id SET DEFAULT nextval('public.discoveries_discovery_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


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
-- Data for Name: discoveries; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.discoveries VALUES ('Discovery Alpha', 1, '2023-04-01', 'Telescope', 1, 1, 1, 1, 'First discovery in the Milkyway Galaxy.');
INSERT INTO public.discoveries VALUES ('Discovery Beta', 2, '2023-05-10', 'Radio Telescope', 2, 2, 2, NULL, 'Located in Andromeda Galaxy, no moons detected.');
INSERT INTO public.discoveries VALUES ('Discovery Gamma', 3, '2023-05-25', 'Satellite Imaging', 1, 3, 3, 3, 'Discovered a new planet with its moon in the Milkyway Galaxy.');
INSERT INTO public.discoveries VALUES ('Discovery Delta', 4, '2023-06-02', 'Telescope', 3, NULL, NULL, 7, 'Discovered a new moon in Triangulum Galaxy.');
INSERT INTO public.discoveries VALUES ('Discovery Epsilon', 5, '2023-06-10', 'Radio Telescope', 4, 4, 4, NULL, 'New planet in Sombrero Galaxy, no moons detected.');
INSERT INTO public.discoveries VALUES ('Discovery Zeta', 6, '2023-06-18', 'Satellite Imaging', 5, 5, 5, 10, 'Discovered a new planet with its moon in Whirlpool Galaxy.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Triangulum', 5000.00, 2, 'Spiral Galaxy');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 8900.00, 3, 'Lenticular Galaxy');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 6000.00, 1, 'Spiral Galaxy');
INSERT INTO public.galaxy VALUES (6, 'Magellanic Clouds', 2000.00, 1, 'Dwarf Galaxy');
INSERT INTO public.galaxy VALUES (1, 'Milkyway', 13500.00, 3, 'spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000.00, 4, 'spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Endor', 'Rocky', 2000.00, true, 30, 1);
INSERT INTO public.moon VALUES (2, 'Titan', 'Icy', 4000.00, true, 16, 5);
INSERT INTO public.moon VALUES (3, 'Europa', 'Icy', 4500.00, false, 3.5, 4);
INSERT INTO public.moon VALUES (4, 'Oberon', 'Icy', 1000.00, false, 13.5, 6);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Rocky', 2000.00, false, 7.2, 4);
INSERT INTO public.moon VALUES (6, 'Io', 'Volcanic', 3500.00, false, 1.8, 4);
INSERT INTO public.moon VALUES (7, 'Phobos', 'Rocky', 100.00, false, 0.3, 2);
INSERT INTO public.moon VALUES (8, 'Deimos', 'Rocky', 120.00, false, 1.3, 2);
INSERT INTO public.moon VALUES (9, 'Callisto', 'Icy', 4500.00, false, 17, 4);
INSERT INTO public.moon VALUES (10, 'Rhea', 'Icy', 4300.00, false, 4.5, 5);
INSERT INTO public.moon VALUES (11, 'Triton', 'Icy', 1000.00, true, 5.9, 7);
INSERT INTO public.moon VALUES (12, 'Charon', 'Icy', 1500.00, false, 6.4, 8);
INSERT INTO public.moon VALUES (13, 'Nereid', 'Rocky', 3000.00, false, 360, 7);
INSERT INTO public.moon VALUES (14, 'Enceladus', 'Icy', 1000.00, false, 1.4, 5);
INSERT INTO public.moon VALUES (15, 'Hyperion', 'Rocky', 500.00, false, 21, 5);
INSERT INTO public.moon VALUES (16, 'Mimas', 'Rocky', 600.00, false, 0.9, 5);
INSERT INTO public.moon VALUES (17, 'Miranda', 'Rocky', 800.00, false, 1.4, 6);
INSERT INTO public.moon VALUES (18, 'Ariel', 'Rocky', 1300.00, false, 2.5, 6);
INSERT INTO public.moon VALUES (19, 'Umbriel', 'Rocky', 1500.00, false, 4.1, 6);
INSERT INTO public.moon VALUES (20, 'Titania', 'Icy', 2000.00, false, 8.7, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Alderaan', 'Terrestrial', 4500.00, true, true, 365.25, 9);
INSERT INTO public.planet VALUES (2, 'Ares', 'Terrestrial', 3000.00, false, true, 687, 1);
INSERT INTO public.planet VALUES (3, 'Vestia', 'Terrestrial', 6000.00, false, true, 225, 4);
INSERT INTO public.planet VALUES (4, 'Jovian', 'Gas Giant', 5000.00, false, true, 4332.59, 3);
INSERT INTO public.planet VALUES (5, 'Cronus', 'Gas Giant', 4200.00, false, true, 10759, 6);
INSERT INTO public.planet VALUES (6, 'Otho', 'Ice Giant', 4000.00, false, true, 30688.5, 8);
INSERT INTO public.planet VALUES (7, 'Nebula', 'Ice Giant', 4500.00, false, true, 60182, 7);
INSERT INTO public.planet VALUES (8, 'Krypton', 'Terrestrial', 7000.00, false, true, 800, 2);
INSERT INTO public.planet VALUES (9, 'Asor', 'Gas Giant', 2000.00, false, true, 2500, 10);
INSERT INTO public.planet VALUES (10, 'Orilla', 'Ice Giant', 5000.00, false, true, 10500, 5);
INSERT INTO public.planet VALUES (11, 'Zypher', 'Gas Dwarf', 3000.00, false, true, 980, 10);
INSERT INTO public.planet VALUES (12, 'Pandora', 'Terrestrial', 1000.00, true, true, 365, 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'Main Sequence', 120.00, 3, 25.4, false, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red Supergiant', 10000.00, 5, 120000, false, 2);
INSERT INTO public.star VALUES (3, 'Rigel', 'Blue Supergiant', 8000.00, 4, 120000, false, 3);
INSERT INTO public.star VALUES (4, 'Vega', 'Main Sequence', 455.00, 3, 40, false, 4);
INSERT INTO public.star VALUES (5, 'Altair', 'Main Sequence', 1250.00, 2, 10.6, false, 5);
INSERT INTO public.star VALUES (6, 'Deneb', 'Blue Supergiant', 10000.00, 5, 196000, false, 6);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 'Red Dwarf', 4850.00, 1, 0.00005, false, 1);
INSERT INTO public.star VALUES (8, 'Polaris', 'Yellow Supergiant', 70000.00, 4, 1260, false, 2);
INSERT INTO public.star VALUES (9, 'Aldebaran', 'Red Giant', 6500.00, 4, 425, false, 3);
INSERT INTO public.star VALUES (10, 'Sun', 'Main Sequence', 4500.00, 3, 1, false, 1);


--
-- Name: discoveries_discovery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.discoveries_discovery_id_seq', 6, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: discoveries discoveries_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoveries
    ADD CONSTRAINT discoveries_name_key UNIQUE (name);


--
-- Name: discoveries discoveries_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoveries
    ADD CONSTRAINT discoveries_pkey PRIMARY KEY (discoveries_id);


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
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: discoveries discoveries_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoveries
    ADD CONSTRAINT discoveries_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: discoveries discoveries_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoveries
    ADD CONSTRAINT discoveries_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: discoveries discoveries_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoveries
    ADD CONSTRAINT discoveries_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: discoveries discoveries_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoveries
    ADD CONSTRAINT discoveries_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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


--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

-- Started on 2023-07-05 14:24:11 +05

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
-- TOC entry 214 (class 1259 OID 25444)
-- Name: AvailableDates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AvailableDates" (
    id integer NOT NULL,
    "startDate" date,
    "endDate" date,
    "RoomId" integer
);


ALTER TABLE public."AvailableDates" OWNER TO postgres;

--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN "AvailableDates"."startDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."AvailableDates"."startDate" IS 'Дата начала свободной даты';


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN "AvailableDates"."endDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."AvailableDates"."endDate" IS 'Дата окончания свободной даты';


--
-- TOC entry 213 (class 1259 OID 25443)
-- Name: AvailableDates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."AvailableDates_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AvailableDates_id_seq" OWNER TO postgres;

--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 213
-- Name: AvailableDates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."AvailableDates_id_seq" OWNED BY public."AvailableDates".id;


--
-- TOC entry 216 (class 1259 OID 25485)
-- Name: Bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Bookings" (
    id integer NOT NULL,
    "startDate" date,
    "endDate" date,
    "RoomId" integer,
    "ClientId" integer
);


ALTER TABLE public."Bookings" OWNER TO postgres;

--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN "Bookings"."startDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Bookings"."startDate" IS 'Дата начала бронирования';


--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN "Bookings"."endDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Bookings"."endDate" IS 'Дата окончания бронирования';


--
-- TOC entry 215 (class 1259 OID 25484)
-- Name: Bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Bookings_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Bookings_id_seq" OWNER TO postgres;

--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 215
-- Name: Bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Bookings_id_seq" OWNED BY public."Bookings".id;


--
-- TOC entry 212 (class 1259 OID 25405)
-- Name: Clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Clients" (
    id integer NOT NULL,
    name character varying(255),
    contact character varying(255),
    "isVIP" boolean DEFAULT false
);


ALTER TABLE public."Clients" OWNER TO postgres;

--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN "Clients".name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Clients".name IS 'Имя клиента';


--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN "Clients".contact; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Clients".contact IS 'Контактные данные клиента';


--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN "Clients"."isVIP"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Clients"."isVIP" IS 'Флаг VIP-клиента';


--
-- TOC entry 211 (class 1259 OID 25404)
-- Name: Clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Clients_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Clients_id_seq" OWNER TO postgres;

--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 211
-- Name: Clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Clients_id_seq" OWNED BY public."Clients".id;


--
-- TOC entry 210 (class 1259 OID 25396)
-- Name: Rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Rooms" (
    id integer NOT NULL,
    "roomNumber" integer,
    "roomType" character varying(255)
);


ALTER TABLE public."Rooms" OWNER TO postgres;

--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN "Rooms"."roomNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Rooms"."roomNumber" IS 'Номер комнаты в отеле';


--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN "Rooms"."roomType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Rooms"."roomType" IS 'Тип комнаты ( одноместный, двухместный )';


--
-- TOC entry 209 (class 1259 OID 25395)
-- Name: Rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Rooms_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Rooms_id_seq" OWNER TO postgres;

--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 209
-- Name: Rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Rooms_id_seq" OWNED BY public."Rooms".id;


--
-- TOC entry 3227 (class 2604 OID 25447)
-- Name: AvailableDates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AvailableDates" ALTER COLUMN id SET DEFAULT nextval('public."AvailableDates_id_seq"'::regclass);


--
-- TOC entry 3228 (class 2604 OID 25488)
-- Name: Bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Bookings" ALTER COLUMN id SET DEFAULT nextval('public."Bookings_id_seq"'::regclass);


--
-- TOC entry 3225 (class 2604 OID 25408)
-- Name: Clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients" ALTER COLUMN id SET DEFAULT nextval('public."Clients_id_seq"'::regclass);


--
-- TOC entry 3224 (class 2604 OID 25399)
-- Name: Rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rooms" ALTER COLUMN id SET DEFAULT nextval('public."Rooms_id_seq"'::regclass);


--
-- TOC entry 3386 (class 0 OID 25444)
-- Dependencies: 214
-- Data for Name: AvailableDates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AvailableDates" (id, "startDate", "endDate", "RoomId") FROM stdin;
1	2023-07-30	2023-07-31	1
\.


--
-- TOC entry 3388 (class 0 OID 25485)
-- Dependencies: 216
-- Data for Name: Bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Bookings" (id, "startDate", "endDate", "RoomId", "ClientId") FROM stdin;
1	2023-07-09	2023-07-11	1	1
2	2023-07-11	2023-07-12	1	2
4	2023-07-13	2023-07-14	1	2
5	2023-07-05	2023-07-08	1	2
\.


--
-- TOC entry 3384 (class 0 OID 25405)
-- Dependencies: 212
-- Data for Name: Clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Clients" (id, name, contact, "isVIP") FROM stdin;
1	Иванов	ivanov@example.com	t
2	Петров Петр	petrov@example.com	f
3	Сидорова Анна	sidorova@example.com	t
\.


--
-- TOC entry 3382 (class 0 OID 25396)
-- Dependencies: 210
-- Data for Name: Rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Rooms" (id, "roomNumber", "roomType") FROM stdin;
1	101	одноместный
\.


--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 213
-- Name: AvailableDates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."AvailableDates_id_seq"', 6, true);


--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 215
-- Name: Bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Bookings_id_seq"', 5, true);


--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 211
-- Name: Clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Clients_id_seq"', 1, true);


--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 209
-- Name: Rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Rooms_id_seq"', 1, true);


--
-- TOC entry 3236 (class 2606 OID 25449)
-- Name: AvailableDates AvailableDates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AvailableDates"
    ADD CONSTRAINT "AvailableDates_pkey" PRIMARY KEY (id);


--
-- TOC entry 3238 (class 2606 OID 25490)
-- Name: Bookings Bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Bookings"
    ADD CONSTRAINT "Bookings_pkey" PRIMARY KEY (id);


--
-- TOC entry 3234 (class 2606 OID 25413)
-- Name: Clients Clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_pkey" PRIMARY KEY (id);


--
-- TOC entry 3230 (class 2606 OID 25401)
-- Name: Rooms Rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rooms"
    ADD CONSTRAINT "Rooms_pkey" PRIMARY KEY (id);


--
-- TOC entry 3232 (class 2606 OID 25403)
-- Name: Rooms Rooms_roomNumber_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rooms"
    ADD CONSTRAINT "Rooms_roomNumber_key" UNIQUE ("roomNumber");


--
-- TOC entry 3239 (class 2606 OID 25450)
-- Name: AvailableDates AvailableDates_RoomId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AvailableDates"
    ADD CONSTRAINT "AvailableDates_RoomId_fkey" FOREIGN KEY ("RoomId") REFERENCES public."Rooms"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3241 (class 2606 OID 25496)
-- Name: Bookings Bookings_ClientId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Bookings"
    ADD CONSTRAINT "Bookings_ClientId_fkey" FOREIGN KEY ("ClientId") REFERENCES public."Clients"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3240 (class 2606 OID 25491)
-- Name: Bookings Bookings_RoomId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Bookings"
    ADD CONSTRAINT "Bookings_RoomId_fkey" FOREIGN KEY ("RoomId") REFERENCES public."Rooms"(id) ON UPDATE CASCADE ON DELETE SET NULL;


-- Completed on 2023-07-05 14:24:11 +05

--
-- PostgreSQL database dump complete
--


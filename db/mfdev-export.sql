--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

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

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO root;

--
-- Name: athletes; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.athletes (
    id bigint NOT NULL,
    name character varying,
    myzone_usr_guid character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.athletes OWNER TO root;

--
-- Name: athletes_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.athletes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.athletes_id_seq OWNER TO root;

--
-- Name: athletes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.athletes_id_seq OWNED BY public.athletes.id;


--
-- Name: challenge_totals; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.challenge_totals (
    id bigint NOT NULL,
    points integer,
    athlete_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.challenge_totals OWNER TO root;

--
-- Name: challenge_totals_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.challenge_totals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.challenge_totals_id_seq OWNER TO root;

--
-- Name: challenge_totals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.challenge_totals_id_seq OWNED BY public.challenge_totals.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO root;

--
-- Name: athletes id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.athletes ALTER COLUMN id SET DEFAULT nextval('public.athletes_id_seq'::regclass);


--
-- Name: challenge_totals id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.challenge_totals ALTER COLUMN id SET DEFAULT nextval('public.challenge_totals_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2019-11-01 14:50:11.836611	2019-11-01 14:50:11.836611
\.


--
-- Data for Name: athletes; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.athletes (id, name, myzone_usr_guid, created_at, updated_at) FROM stdin;
2	Rik	95d34538-e49d-11e9-943f-ac1f6b49537a	2019-11-02 12:14:04.287909	2019-11-11 15:17:10.879146
1	dbrein	2ee7ece4-e2f1-11e9-943f-ac1f6b49537a	2019-11-02 12:14:04.28052	2019-11-11 15:17:10.887559
4	Zan	9bab99c7-ec79-11e9-943f-ac1f6b49537a	2019-11-02 12:14:04.299714	2019-11-11 15:17:10.892421
5	ChipDa	923a525c-ed09-11e9-943f-ac1f6b49537a	2019-11-02 12:14:04.305545	2019-11-11 15:17:10.897059
3	Smitty	ca28eb9b-e331-11e9-943f-ac1f6b49537a	2019-11-02 12:14:04.293546	2019-11-11 15:17:10.902273
6	RyanMu	6786af75-e2d8-11e9-943f-ac1f6b49537a	2019-11-02 12:14:04.311457	2019-11-11 15:17:10.907014
8	JosephBa	f2fde533-e566-11e9-943f-ac1f6b49537a	2019-11-02 12:14:04.34565	2019-11-11 15:17:10.911857
7	Denim	4141e272-e4b1-11e9-943f-ac1f6b49537a	2019-11-02 12:14:04.32816	2019-11-11 15:17:10.920323
\.


--
-- Data for Name: challenge_totals; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.challenge_totals (id, points, athlete_id, created_at, updated_at) FROM stdin;
9	6322	1	2019-11-02 13:15:14.837899	2019-11-02 13:15:14.837899
10	5791	2	2019-11-02 13:15:14.843662	2019-11-02 13:15:14.843662
11	5359	3	2019-11-02 13:15:14.847275	2019-11-02 13:15:14.847275
12	5232	4	2019-11-02 13:15:14.850754	2019-11-02 13:15:14.850754
13	5141	5	2019-11-02 13:15:14.880148	2019-11-02 13:15:14.880148
14	5094	6	2019-11-02 13:15:14.883553	2019-11-02 13:15:14.883553
15	4366	7	2019-11-02 13:15:14.887674	2019-11-02 13:15:14.887674
16	4119	8	2019-11-02 13:15:14.891764	2019-11-02 13:15:14.891764
17	6322	1	2019-11-02 17:37:42.986608	2019-11-02 17:37:42.986608
18	6214	2	2019-11-02 17:37:43.03733	2019-11-02 17:37:43.03733
19	5471	3	2019-11-02 17:37:43.042396	2019-11-02 17:37:43.042396
20	5426	4	2019-11-02 17:37:43.047362	2019-11-02 17:37:43.047362
21	5361	5	2019-11-02 17:37:43.052054	2019-11-02 17:37:43.052054
22	5291	6	2019-11-02 17:37:43.058757	2019-11-02 17:37:43.058757
23	4505	7	2019-11-02 17:37:43.063149	2019-11-02 17:37:43.063149
24	4186	8	2019-11-02 17:37:43.067052	2019-11-02 17:37:43.067052
25	6322	1	2019-11-02 18:20:32.732647	2019-11-02 18:20:32.732647
26	6214	2	2019-11-02 18:20:32.740523	2019-11-02 18:20:32.740523
27	5529	3	2019-11-02 18:20:32.744135	2019-11-02 18:20:32.744135
28	5426	4	2019-11-02 18:20:32.747372	2019-11-02 18:20:32.747372
29	5361	5	2019-11-02 18:20:32.750753	2019-11-02 18:20:32.750753
30	5291	6	2019-11-02 18:20:32.754117	2019-11-02 18:20:32.754117
31	4505	7	2019-11-02 18:20:32.757335	2019-11-02 18:20:32.757335
32	4186	8	2019-11-02 18:20:32.760563	2019-11-02 18:20:32.760563
33	6858	1	2019-11-03 02:55:00.674056	2019-11-03 02:55:00.674056
34	6453	2	2019-11-03 02:55:00.685639	2019-11-03 02:55:00.685639
35	5645	5	2019-11-03 02:55:00.689359	2019-11-03 02:55:00.689359
36	5643	3	2019-11-03 02:55:00.693446	2019-11-03 02:55:00.693446
37	5515	4	2019-11-03 02:55:00.696861	2019-11-03 02:55:00.696861
38	5291	6	2019-11-03 02:55:00.700236	2019-11-03 02:55:00.700236
39	4813	7	2019-11-03 02:55:00.703659	2019-11-03 02:55:00.703659
40	4413	8	2019-11-03 02:55:00.707095	2019-11-03 02:55:00.707095
42	7196	1	2019-11-04 00:47:05.138319	2019-11-04 00:47:05.138319
43	7010	2	2019-11-04 00:47:05.185365	2019-11-04 00:47:05.185365
44	6055	4	2019-11-04 00:47:05.190059	2019-11-04 00:47:05.190059
45	5847	3	2019-11-04 00:47:05.195164	2019-11-04 00:47:05.195164
46	5823	5	2019-11-04 00:47:05.199722	2019-11-04 00:47:05.199722
47	5703	6	2019-11-04 00:47:05.204049	2019-11-04 00:47:05.204049
48	5083	8	2019-11-04 00:47:05.207675	2019-11-04 00:47:05.207675
49	4813	7	2019-11-04 00:47:05.211149	2019-11-04 00:47:05.211149
50	7298	1	2019-11-04 15:09:16.424437	2019-11-04 15:09:16.424437
51	7063	2	2019-11-04 15:09:16.475715	2019-11-04 15:09:16.475715
52	6238	4	2019-11-04 15:09:16.480439	2019-11-04 15:09:16.480439
53	6225	5	2019-11-04 15:09:16.485027	2019-11-04 15:09:16.485027
54	6052	3	2019-11-04 15:09:16.488676	2019-11-04 15:09:16.488676
55	5905	6	2019-11-04 15:09:16.492287	2019-11-04 15:09:16.492287
56	5266	8	2019-11-04 15:09:16.495521	2019-11-04 15:09:16.495521
57	5262	7	2019-11-04 15:09:16.498785	2019-11-04 15:09:16.498785
66	7721	1	2019-11-05 17:10:05.745175	2019-11-05 17:10:05.745175
67	7468	2	2019-11-05 17:10:05.755818	2019-11-05 17:10:05.755818
68	6524	4	2019-11-05 17:10:05.759921	2019-11-05 17:10:05.759921
69	6408	3	2019-11-05 17:10:05.763509	2019-11-05 17:10:05.763509
70	6352	5	2019-11-05 17:10:05.767379	2019-11-05 17:10:05.767379
71	6278	6	2019-11-05 17:10:05.770951	2019-11-05 17:10:05.770951
72	5611	7	2019-11-05 17:10:05.774339	2019-11-05 17:10:05.774339
73	5610	8	2019-11-05 17:10:05.777753	2019-11-05 17:10:05.777753
74	8470	1	2019-11-07 14:41:54.573461	2019-11-07 14:41:54.573461
75	8356	2	2019-11-07 14:41:54.580946	2019-11-07 14:41:54.580946
76	7195	4	2019-11-07 14:41:54.585139	2019-11-07 14:41:54.585139
77	7070	3	2019-11-07 14:41:54.589025	2019-11-07 14:41:54.589025
78	7027	5	2019-11-07 14:41:54.592533	2019-11-07 14:41:54.592533
79	6879	6	2019-11-07 14:41:54.59608	2019-11-07 14:41:54.59608
80	6157	8	2019-11-07 14:41:54.600048	2019-11-07 14:41:54.600048
81	6104	7	2019-11-07 14:41:54.603997	2019-11-07 14:41:54.603997
82	8656	1	2019-11-08 15:55:59.344815	2019-11-08 15:55:59.344815
83	8630	2	2019-11-08 15:55:59.352961	2019-11-08 15:55:59.352961
84	7429	4	2019-11-08 15:55:59.356437	2019-11-08 15:55:59.356437
85	7390	3	2019-11-08 15:55:59.3597	2019-11-08 15:55:59.3597
86	7163	5	2019-11-08 15:55:59.362972	2019-11-08 15:55:59.362972
87	7036	6	2019-11-08 15:55:59.366664	2019-11-08 15:55:59.366664
88	6668	8	2019-11-08 15:55:59.370089	2019-11-08 15:55:59.370089
89	6104	7	2019-11-08 15:55:59.373313	2019-11-08 18:15:41.73715
90	10018	2	2019-11-11 15:17:10.86857	2019-11-11 15:17:10.86857
91	9889	1	2019-11-11 15:17:10.88513	2019-11-11 15:17:10.88513
92	8623	4	2019-11-11 15:17:10.890253	2019-11-11 15:17:10.890253
93	8445	5	2019-11-11 15:17:10.894878	2019-11-11 15:17:10.894878
94	7867	3	2019-11-11 15:17:10.900017	2019-11-11 15:17:10.900017
95	7852	6	2019-11-11 15:17:10.904814	2019-11-11 15:17:10.904814
96	7034	8	2019-11-11 15:17:10.90956	2019-11-11 15:17:10.90956
97	6104	7	2019-11-11 15:17:10.916524	2019-11-11 15:17:10.916524
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.schema_migrations (version) FROM stdin;
20191101144415
20191101144717
\.


--
-- Name: athletes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.athletes_id_seq', 8, true);


--
-- Name: challenge_totals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.challenge_totals_id_seq', 97, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: athletes athletes_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.athletes
    ADD CONSTRAINT athletes_pkey PRIMARY KEY (id);


--
-- Name: challenge_totals challenge_totals_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.challenge_totals
    ADD CONSTRAINT challenge_totals_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_challenge_totals_on_athlete_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX index_challenge_totals_on_athlete_id ON public.challenge_totals USING btree (athlete_id);


--
-- PostgreSQL database dump complete
--


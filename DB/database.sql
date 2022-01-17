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
-- Name: barang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.barang (
    id integer NOT NULL,
    kode_barang character varying(255),
    nm_barang character varying(255),
    satuan_id integer,
    supplier_id integer,
    merk_id integer,
    kategori_id integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.barang OWNER TO postgres;

--
-- Name: barang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.barang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.barang_id_seq OWNER TO postgres;

--
-- Name: barang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.barang_id_seq OWNED BY public.barang.id;


--
-- Name: cabang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cabang (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    jenis_cabang character varying(255) NOT NULL,
    status_cabang character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT cabang_status_cabang_check CHECK (((status_cabang)::text = ANY ((ARRAY['Aktif'::character varying, 'Non AKtif'::character varying])::text[])))
);


ALTER TABLE public.cabang OWNER TO postgres;

--
-- Name: cabang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cabang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cabang_id_seq OWNER TO postgres;

--
-- Name: cabang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cabang_id_seq OWNED BY public.cabang.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kategori (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.kategori OWNER TO postgres;

--
-- Name: kategori_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kategori_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kategori_id_seq OWNER TO postgres;

--
-- Name: kategori_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kategori_id_seq OWNED BY public.kategori.id;


--
-- Name: merk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merk (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.merk OWNER TO postgres;

--
-- Name: merk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.merk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.merk_id_seq OWNER TO postgres;

--
-- Name: merk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.merk_id_seq OWNED BY public.merk.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: satuan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.satuan (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    status boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.satuan OWNER TO postgres;

--
-- Name: satuan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.satuan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satuan_id_seq OWNER TO postgres;

--
-- Name: satuan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.satuan_id_seq OWNED BY public.satuan.id;


--
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    alamat character varying(255),
    telpon character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- Name: supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplier_id_seq OWNER TO postgres;

--
-- Name: supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supplier_id_seq OWNED BY public.supplier.id;


--
-- Name: transaksibarang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaksibarang (
    id integer NOT NULL,
    tgltransaksi date NOT NULL,
    jenistransaksi character varying(255) NOT NULL,
    noref character varying(255),
    keterangan character varying(255),
    created_by character varying(255) NOT NULL,
    created_date date NOT NULL,
    verifikasi_by character varying(255),
    verifikasi_date date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.transaksibarang OWNER TO postgres;

--
-- Name: transaksibarang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaksibarang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaksibarang_id_seq OWNER TO postgres;

--
-- Name: transaksibarang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaksibarang_id_seq OWNED BY public.transaksibarang.id;


--
-- Name: transaksibarangdetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaksibarangdetail (
    id integer NOT NULL,
    transaksibarang_id integer NOT NULL,
    barang_id integer NOT NULL,
    qty_out double precision DEFAULT '0'::double precision NOT NULL,
    qty_in double precision DEFAULT '0'::double precision NOT NULL,
    harga double precision DEFAULT '0'::double precision NOT NULL,
    cabang_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.transaksibarangdetail OWNER TO postgres;

--
-- Name: transaksibarangdetail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaksibarangdetail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaksibarangdetail_id_seq OWNER TO postgres;

--
-- Name: transaksibarangdetail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaksibarangdetail_id_seq OWNED BY public.transaksibarangdetail.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: barang id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.barang ALTER COLUMN id SET DEFAULT nextval('public.barang_id_seq'::regclass);


--
-- Name: cabang id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cabang ALTER COLUMN id SET DEFAULT nextval('public.cabang_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: kategori id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori ALTER COLUMN id SET DEFAULT nextval('public.kategori_id_seq'::regclass);


--
-- Name: merk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merk ALTER COLUMN id SET DEFAULT nextval('public.merk_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: satuan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.satuan ALTER COLUMN id SET DEFAULT nextval('public.satuan_id_seq'::regclass);


--
-- Name: supplier id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier ALTER COLUMN id SET DEFAULT nextval('public.supplier_id_seq'::regclass);


--
-- Name: transaksibarang id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksibarang ALTER COLUMN id SET DEFAULT nextval('public.transaksibarang_id_seq'::regclass);


--
-- Name: transaksibarangdetail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksibarangdetail ALTER COLUMN id SET DEFAULT nextval('public.transaksibarangdetail_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: barang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.barang (id, kode_barang, nm_barang, satuan_id, supplier_id, merk_id, kategori_id, created_at, updated_at) FROM stdin;
5	AH-09209	aaaa	1	1	1	1	2021-09-06 10:38:23	2021-09-06 10:38:23
6	AH-092091	C	1	1	1	2	2021-09-06 22:42:10	2021-09-06 22:42:10
1	AH-09209	wqeq	1	1	1	3	2021-09-06 10:26:57	2021-09-06 10:26:57
2	AH-09209	qweqweq	1	1	1	4	2021-09-06 10:27:37	2021-09-06 10:27:37
4	AH-09209	ssss	1	1	1	5	2021-09-06 10:29:19	2021-09-06 10:29:19
3	AH-09209	sss	1	1	1	1	2021-09-06 10:28:07	2021-09-06 10:28:07
\.


--
-- Data for Name: cabang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cabang (id, name, jenis_cabang, status_cabang, created_at, updated_at) FROM stdin;
1	acaca	cabang	Aktif	\N	\N
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kategori (id, name, description, created_at, updated_at) FROM stdin;
1	Keperluan 0	Keterangan 0	2021-08-23 09:46:47	2021-08-23 09:46:47
2	Keperluan 1	Keterangan 1	2021-08-23 09:46:47	2021-08-23 09:46:47
3	Keperluan 2	Keterangan 2	2021-08-23 09:46:47	2021-08-23 09:46:47
4	Keperluan 3	Keterangan 3	2021-08-23 09:46:47	2021-08-23 09:46:47
5	Keperluan 4	Keterangan 4	2021-08-23 09:46:47	2021-08-23 09:46:47
\.


--
-- Data for Name: merk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merk (id, name, description, created_at, updated_at) FROM stdin;
1	Merk 0	Keterangan 0	2021-08-23 09:46:47	2021-08-23 09:46:47
2	Merk 1	Keterangan 1	2021-08-23 09:46:47	2021-08-23 09:46:47
3	Merk 2	Keterangan 2	2021-08-23 09:46:47	2021-08-23 09:46:47
4	Merk 3	Keterangan 3	2021-08-23 09:46:47	2021-08-23 09:46:47
5	Merk 4	Keterangan 4	2021-08-23 09:46:47	2021-08-23 09:46:47
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_11_000000_create_cabang_table	1
2	2014_10_12_000000_create_users_table	1
3	2014_10_12_100000_create_password_resets_table	1
4	2019_08_19_000000_create_failed_jobs_table	1
5	2019_12_14_000001_create_personal_access_tokens_table	1
6	2021_08_23_062433_create_satuan_table	1
7	2021_08_23_062640_create_supplier_table	1
8	2021_08_23_062831_create_merk_table	1
9	2021_08_23_062846_create_kategori_table	1
10	2021_08_23_062915_create_barang_table	1
11	2021_08_23_062936_create_transaksibarang_table	1
12	2021_08_23_062945_create_transaksibarangdetail_table	1
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, created_at, updated_at) FROM stdin;
1	App\\Models\\User	1	token-auth	88674e1a0b4e8cba2f9822da661d8af6bea8fef3f85b2f0517cf486337678a8b	["*"]	\N	2021-09-06 10:07:00	2021-09-06 10:07:00
2	App\\Models\\User	1	token-auth	cad463a570835b41cfd35ffeb92a733e7096b5e5e65a14952b65050509710f96	["*"]	\N	2021-09-06 10:08:57	2021-09-06 10:08:57
3	App\\Models\\User	1	token-auth	43a786b4663ce9d9aefc25ecca48502a83a8105e0e584d7b84123f12d4a87a18	["*"]	2021-09-06 10:42:21	2021-09-06 10:09:59	2021-09-06 10:42:21
6	App\\Models\\User	1	token-auth	33268fd3e72b12a053ed0d1ca9e45b3bf8c25ed558b94548b4495ef7e685378e	["*"]	2021-10-04 06:07:11	2021-10-04 05:30:37	2021-10-04 06:07:11
5	App\\Models\\User	1	token-auth	29a36b89c2064228aedf25483799fb8f02c534995cff9b06cfa58a3f796779b9	["*"]	2021-09-06 23:30:25	2021-09-06 22:28:13	2021-09-06 23:30:25
4	App\\Models\\User	1	token-auth	a70c47dae46f6a64e35094f32633c73508d08821718d6971d916f21868b5bd5a	["*"]	2021-09-06 22:45:37	2021-09-06 13:07:10	2021-09-06 22:45:37
\.


--
-- Data for Name: satuan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.satuan (id, name, status, created_at, updated_at) FROM stdin;
1	Kg 	t	2021-08-23 09:46:47	2021-08-23 09:46:47
2	Gr 	t	2021-08-23 09:46:47	2021-08-23 09:46:47
3	Ml 	t	2021-08-23 09:46:47	2021-08-23 09:46:47
\.


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (id, name, alamat, telpon, created_at, updated_at) FROM stdin;
1	Supplier 0	Keterangan Supplier0	\N	2021-08-23 09:46:47	2021-08-23 09:46:47
2	Supplier 1	Keterangan Supplier1	\N	2021-08-23 09:46:47	2021-08-23 09:46:47
3	Supplier 2	Keterangan Supplier2	\N	2021-08-23 09:46:47	2021-08-23 09:46:47
4	Supplier 3	Keterangan Supplier3	\N	2021-08-23 09:46:47	2021-08-23 09:46:47
5	Supplier 4	Keterangan Supplier4	\N	2021-08-23 09:46:47	2021-08-23 09:46:47
\.


--
-- Data for Name: transaksibarang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaksibarang (id, tgltransaksi, jenistransaksi, noref, keterangan, created_by, created_date, verifikasi_by, verifikasi_date, created_at, updated_at) FROM stdin;
9	2021-10-04	Jual Barang	\N	\N	1	2021-10-04	\N	2021-10-04	2021-10-04 05:47:44	2021-10-04 05:47:44
10	2021-10-04	Jual Barang	\N	\N	1	2021-10-04	\N	2021-10-04	2021-10-04 05:48:30	2021-10-04 05:48:30
13	2021-10-04	Jual Barang	\N	\N	1	2021-10-04	\N	2021-10-04	2021-10-04 05:53:38	2021-10-04 05:53:38
14	2021-10-04	Jual Barang	\N	\N	1	2021-10-04	\N	2021-10-04	2021-10-04 05:53:55	2021-10-04 05:53:55
15	2021-10-04	Jual Barang	\N	\N	1	2021-10-04	\N	2021-10-04	2021-10-04 05:56:30	2021-10-04 05:56:30
17	2021-10-04	Jual Barang	\N	\N	1	2021-10-04	\N	2021-10-04	2021-10-04 05:57:52	2021-10-04 05:57:52
18	2021-10-04	Jual Barang	\N	\N	1	2021-10-04	\N	2021-10-04	2021-10-04 05:58:23	2021-10-04 05:58:23
19	2021-10-04	Jual Barang	\N	\N	1	2021-10-04	\N	2021-10-04	2021-10-04 05:58:47	2021-10-04 05:58:47
20	2021-10-04	Jual Barang	\N	\N	1	2021-10-04	\N	2021-10-04	2021-10-04 05:59:29	2021-10-04 05:59:29
21	2021-10-04	Jual Barang	\N	\N	1	2021-10-04	\N	2021-10-04	2021-10-04 06:00:00	2021-10-04 06:00:00
22	2021-10-04	Jual Barang	\N	\N	1	2021-10-04	\N	2021-10-04	2021-10-04 06:00:31	2021-10-04 06:00:31
23	2021-10-04	Jual Barang	\N	\N	1	2021-10-04	\N	2021-10-04	2021-10-04 06:00:59	2021-10-04 06:00:59
24	2021-10-04	Jual Barang	\N	\N	1	2021-10-04	\N	2021-10-04	2021-10-04 06:01:25	2021-10-04 06:01:25
25	2021-10-04	Jual Barang	\N	\N	1	2021-10-04	\N	2021-10-04	2021-10-04 06:01:38	2021-10-04 06:01:38
26	2021-10-04	Jual Barang	\N	\N	1	2021-10-04	\N	2021-10-04	2021-10-04 06:03:05	2021-10-04 06:03:05
27	2021-10-04	Jual Barang	\N	\N	1	2021-10-04	\N	2021-10-04	2021-10-04 06:05:07	2021-10-04 06:05:07
28	2021-10-04	Jual Barang	\N	\N	1	2021-10-04	\N	2021-10-04	2021-10-04 06:05:35	2021-10-04 06:05:35
29	2021-10-04	Jual Barang	\N	\N	1	2021-10-04	\N	2021-10-04	2021-10-04 06:07:12	2021-10-04 06:07:12
\.


--
-- Data for Name: transaksibarangdetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaksibarangdetail (id, transaksibarang_id, barang_id, qty_out, qty_in, harga, cabang_id, created_at, updated_at) FROM stdin;
2	9	1	0	1	0	1	2021-10-04 05:47:44	2021-10-04 05:47:44
3	10	1	1	1	0	1	2021-10-04 05:48:30	2021-10-04 05:48:30
4	13	1	1	1	0	1	2021-10-04 05:53:38	2021-10-04 05:53:38
5	14	1	0	1	90000	1	2021-10-04 05:53:55	2021-10-04 05:53:55
6	15	1	0	1	90000	1	2021-10-04 05:56:30	2021-10-04 05:56:30
7	17	1	0	1	90000	1	2021-10-04 05:57:52	2021-10-04 05:57:52
8	18	1	0	1	90000	1	2021-10-04 05:58:23	2021-10-04 05:58:23
9	19	1	0	1	90000	1	2021-10-04 05:58:47	2021-10-04 05:58:47
10	20	1	0	1	90000	1	2021-10-04 05:59:29	2021-10-04 05:59:29
11	21	1	0	1	90000	1	2021-10-04 06:00:00	2021-10-04 06:00:00
12	22	1	0	1	90000	1	2021-10-04 06:00:31	2021-10-04 06:00:31
13	23	1	0	1	90000	1	2021-10-04 06:00:59	2021-10-04 06:00:59
14	23	2	0	1	190000	1	2021-10-04 06:00:59	2021-10-04 06:00:59
15	24	1	0	1	90000	1	2021-10-04 06:01:25	2021-10-04 06:01:25
16	24	2	0	1	190000	1	2021-10-04 06:01:25	2021-10-04 06:01:25
17	25	1	0	1	90000	1	2021-10-04 06:01:38	2021-10-04 06:01:38
18	25	2	0	1	190000	1	2021-10-04 06:01:39	2021-10-04 06:01:39
19	26	1	0	1	90000	1	2021-10-04 06:03:05	2021-10-04 06:03:05
20	26	2	0	1	190000	1	2021-10-04 06:03:05	2021-10-04 06:03:05
21	27	1	0	1	90000	1	2021-10-04 06:05:07	2021-10-04 06:05:07
22	27	2	0	1	190000	1	2021-10-04 06:05:07	2021-10-04 06:05:07
23	28	1	0	1	90000	1	2021-10-04 06:05:35	2021-10-04 06:05:35
24	28	2	0	1	190000	1	2021-10-04 06:05:35	2021-10-04 06:05:35
25	29	1	0	1	90000	1	2021-10-04 06:07:12	2021-10-04 06:07:12
26	29	2	0	1	190000	1	2021-10-04 06:07:12	2021-10-04 06:07:12
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, username, email, email_verified_at, password, status, remember_token, created_at, updated_at) FROM stdin;
1	Holil	Holil	holil.amd@gmail.com	\N	$2y$10$ngYDDIZ0gyccJMKIRQcekOHJbQGFOSa1eLZ1Adee0JYjSlJ3xfvhe	Aktif	\N	2021-08-23 09:46:46	2021-08-23 09:46:46
2	Admin	Admin	admin@gmail.com	\N	$2y$10$cIFTEbL3UY0mNZEsmki0EuXnVPH1ClB6MOATBl91gDF62DzJ6ix.6	Aktif	\N	2021-08-23 09:46:47	2021-08-23 09:46:47
3	Admin1	Admin1	admin1@gmail.com	\N	$2y$10$lRQpSNYdTVIiRVLQ0WHJXONpZq3k6U/766eYyxl3GOfnSZup9IUka	Aktif	\N	2021-08-23 09:46:47	2021-08-23 09:46:47
4	Admin1	Admin111	admin111@gmail.com	\N	$2y$10$E1YBxb6jwi9/PF7HFo9mLeI.k7IPiowyL2zvUzNWfEXOQgo/kVA2y	Aktif	\N	2021-09-06 10:02:47	2021-09-06 10:02:47
\.


--
-- Name: barang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.barang_id_seq', 6, true);


--
-- Name: cabang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cabang_id_seq', 1, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: kategori_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kategori_id_seq', 5, true);


--
-- Name: merk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.merk_id_seq', 5, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 12, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 6, true);


--
-- Name: satuan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.satuan_id_seq', 3, true);


--
-- Name: supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_id_seq', 5, true);


--
-- Name: transaksibarang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaksibarang_id_seq', 29, true);


--
-- Name: transaksibarangdetail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaksibarangdetail_id_seq', 26, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: barang barang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.barang
    ADD CONSTRAINT barang_pkey PRIMARY KEY (id);


--
-- Name: cabang cabang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cabang
    ADD CONSTRAINT cabang_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: kategori kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori
    ADD CONSTRAINT kategori_pkey PRIMARY KEY (id);


--
-- Name: merk merk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merk
    ADD CONSTRAINT merk_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: satuan satuan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.satuan
    ADD CONSTRAINT satuan_pkey PRIMARY KEY (id);


--
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id);


--
-- Name: transaksibarang transaksibarang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksibarang
    ADD CONSTRAINT transaksibarang_pkey PRIMARY KEY (id);


--
-- Name: transaksibarangdetail transaksibarangdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksibarangdetail
    ADD CONSTRAINT transaksibarangdetail_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: barang barang_kategori_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.barang
    ADD CONSTRAINT barang_kategori_id_foreign FOREIGN KEY (kategori_id) REFERENCES public.kategori(id);


--
-- Name: barang barang_merk_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.barang
    ADD CONSTRAINT barang_merk_id_foreign FOREIGN KEY (merk_id) REFERENCES public.merk(id);


--
-- Name: barang barang_satuan_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.barang
    ADD CONSTRAINT barang_satuan_id_foreign FOREIGN KEY (satuan_id) REFERENCES public.satuan(id);


--
-- Name: barang barang_supplier_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.barang
    ADD CONSTRAINT barang_supplier_id_foreign FOREIGN KEY (supplier_id) REFERENCES public.supplier(id);


--
-- Name: transaksibarangdetail transaksibarangdetail_barang_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksibarangdetail
    ADD CONSTRAINT transaksibarangdetail_barang_id_foreign FOREIGN KEY (barang_id) REFERENCES public.barang(id);


--
-- Name: transaksibarangdetail transaksibarangdetail_cabang_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksibarangdetail
    ADD CONSTRAINT transaksibarangdetail_cabang_id_foreign FOREIGN KEY (cabang_id) REFERENCES public.cabang(id);


--
-- Name: transaksibarangdetail transaksibarangdetail_transaksibarang_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksibarangdetail
    ADD CONSTRAINT transaksibarangdetail_transaksibarang_id_foreign FOREIGN KEY (transaksibarang_id) REFERENCES public.transaksibarang(id);


--
-- PostgreSQL database dump complete
--


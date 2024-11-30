--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.auth_group (id, name) FROM stdin;
2	Administrador
1	Costumers
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	primevideo	movie
8	primevideo	series
9	primevideo	genre
10	primevideo	usercontentstatus
11	app_label_example	movie
12	app_label_example	contentobject
13	app_label_example	series
14	app_label_example	genre
15	app_label_example	watchedcontent
16	app_label_example	usercontentstatus
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add movie	7	add_movie
26	Can change movie	7	change_movie
27	Can delete movie	7	delete_movie
28	Can view movie	7	view_movie
29	Can add series	8	add_series
30	Can change series	8	change_series
31	Can delete series	8	delete_series
32	Can view series	8	view_series
33	Can add genre	9	add_genre
34	Can change genre	9	change_genre
35	Can delete genre	9	delete_genre
36	Can view genre	9	view_genre
37	Can add user content status	10	add_usercontentstatus
38	Can change user content status	10	change_usercontentstatus
39	Can delete user content status	10	delete_usercontentstatus
40	Can view user content status	10	view_usercontentstatus
41	Can add movie	11	add_movie
42	Can change movie	11	change_movie
43	Can delete movie	11	delete_movie
44	Can view movie	11	view_movie
45	Can add content object	12	add_contentobject
46	Can change content object	12	change_contentobject
47	Can delete content object	12	delete_contentobject
48	Can view content object	12	view_contentobject
49	Can add series	13	add_series
50	Can change series	13	change_series
51	Can delete series	13	delete_series
52	Can view series	13	view_series
53	Can add genre	14	add_genre
54	Can change genre	14	change_genre
55	Can delete genre	14	delete_genre
56	Can view genre	14	view_genre
57	Can add watched content	15	add_watchedcontent
58	Can change watched content	15	change_watchedcontent
59	Can delete watched content	15	delete_watchedcontent
60	Can view watched content	15	view_watchedcontent
61	Can add user content status	16	add_usercontentstatus
62	Can change user content status	16	change_usercontentstatus
63	Can delete user content status	16	delete_usercontentstatus
64	Can view user content status	16	view_usercontentstatus
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	2	1
2	2	2
3	2	3
4	2	4
5	2	5
6	2	6
7	2	7
8	2	8
9	2	9
10	2	10
11	2	11
12	2	12
13	2	13
14	2	14
15	2	15
16	2	16
17	2	17
18	2	18
19	2	19
20	2	20
21	2	21
22	2	22
23	2	23
24	2	24
25	2	25
26	2	26
27	2	27
28	2	28
29	2	29
30	2	30
31	2	31
32	2	32
33	2	33
34	2	34
35	2	35
36	2	36
37	2	37
38	2	38
39	2	39
40	2	40
41	2	41
42	2	42
43	2	43
44	2	44
45	2	45
46	2	46
47	2	47
48	2	48
49	2	49
50	2	50
51	2	51
52	2	52
53	2	53
54	2	54
55	2	55
56	2	56
57	2	57
58	2	58
59	2	59
60	2	60
61	2	61
62	2	62
63	2	63
64	2	64
65	1	64
66	1	32
67	1	36
68	1	40
69	1	44
70	1	28
71	1	52
72	1	20
73	1	56
74	1	57
75	1	58
76	1	59
77	1	60
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$870000$8jxZmYla5TDLV3B1SXGdh9$qoB6iOL5Kdf0nY3vlag1TNAr13EcvaVf1plMBBj71ZQ=	2024-11-08 20:33:20.769231+00	t	admin				t	t	2024-10-03 02:22:41+00
2	pbkdf2_sha256$870000$lFUqJLCAXSo1Cc3b6T9uZg$pcN/zNsjccTpcdMyAqE16m16wgbmlc5EmGZYoQpD6dg=	2024-11-14 00:36:07.38596+00	f	1234				f	t	2024-10-03 02:22:55.450432+00
6	pbkdf2_sha256$870000$6qHPPWoHyFH4rFaPGR49u6$7qxZA1vmqj37rl9f9Imts+ZHKrUHcsH2eAmX7gfgNy0=	2024-10-09 14:27:49.44026+00	t	prueba1				f	t	2024-10-09 14:27:48.346728+00
4	pbkdf2_sha256$870000$9zEDgDWnhfhK0IkjljSCsW$zStnpJVJKbEa7Lkjof3JwsD6wfSM326nvq9XKX8DNLo=	2024-11-08 20:35:46+00	f	jira				f	t	2024-10-03 03:18:06+00
5	pbkdf2_sha256$870000$01zAWZPBlGeJ76fQPdxCJs$mK56NAF+tHIhIZ1r2L3gxyB+wRTuavSYUye4mlzAF8E=	2024-11-27 21:49:09.580786+00	t	javi95	Jimenez	Ramon	afdfafa@gmail.com	t	t	2024-10-03 04:10:40+00
3	pbkdf2_sha256$870000$KXNsgIVR1o976J3bocIFlJ$xwzP5wCQ275MwVSL/rtYTRHYJMsgHYevamIURqlp20k=	2024-11-27 21:50:33.507254+00	f	joe3				f	t	2024-10-03 02:39:28+00
7	pbkdf2_sha256$870000$DubCAnEuvxYpH7d5QnGYYP$oHhwB6hAcpgbLbe+pzdApltuLZ2GjQj6sjeIxzFF6CU=	2024-11-27 22:04:15.837339+00	t	javi				t	t	2024-11-27 21:37:38+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	7	2
2	4	1
3	3	1
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	3	40
2	3	44
3	3	28
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2024-11-27 21:39:22.125216+00	2	Administrador	2	[{"changed": {"fields": ["Permissions"]}}]	3	7
2	2024-11-27 21:41:26.471219+00	1	Costumers	2	[{"changed": {"fields": ["Permissions"]}}]	3	7
3	2024-11-27 21:44:12.069977+00	7	javi	2	[{"changed": {"fields": ["Groups"]}}]	4	7
4	2024-11-27 21:44:28.640328+00	5	javi95	2	[{"changed": {"fields": ["Superuser status"]}}]	4	7
5	2024-11-27 21:45:09.292636+00	4	jira	2	[{"changed": {"fields": ["Groups"]}}]	4	7
6	2024-11-27 21:45:33.517266+00	3	joe3	2	[{"changed": {"fields": ["Groups"]}}]	4	7
7	2024-11-27 21:50:04.824516+00	3	joe3	2	[{"changed": {"fields": ["User permissions"]}}]	4	5
8	2024-11-27 21:50:04.913276+00	3	joe3	2	[]	4	5
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-11-27 21:22:06.79329+00
2	auth	0001_initial	2024-11-27 21:22:06.861574+00
3	admin	0001_initial	2024-11-27 21:22:06.88377+00
4	admin	0002_logentry_remove_auto_add	2024-11-27 21:22:06.893948+00
5	admin	0003_logentry_add_action_flag_choices	2024-11-27 21:22:06.905776+00
6	contenttypes	0002_remove_content_type_name	2024-11-27 21:22:06.932011+00
7	auth	0002_alter_permission_name_max_length	2024-11-27 21:22:06.949257+00
8	auth	0003_alter_user_email_max_length	2024-11-27 21:22:06.963152+00
9	auth	0004_alter_user_username_opts	2024-11-27 21:22:06.976051+00
10	auth	0005_alter_user_last_login_null	2024-11-27 21:22:06.994479+00
11	auth	0006_require_contenttypes_0002	2024-11-27 21:22:06.997792+00
12	auth	0007_alter_validators_add_error_messages	2024-11-27 21:22:07.010707+00
13	auth	0008_alter_user_username_max_length	2024-11-27 21:22:07.030143+00
14	auth	0009_alter_user_last_name_max_length	2024-11-27 21:22:07.045776+00
15	auth	0010_alter_group_name_max_length	2024-11-27 21:22:07.061938+00
16	auth	0011_update_proxy_permissions	2024-11-27 21:22:07.072063+00
17	auth	0012_alter_user_first_name_max_length	2024-11-27 21:22:07.090903+00
18	primevideo	0001_initial	2024-11-27 21:22:07.148457+00
19	primevideo	0002_delete_contentobject	2024-11-27 21:22:07.154744+00
20	primevideo	0003_genre_movie_director_series_director_and_more	2024-11-27 21:22:07.250124+00
21	primevideo	0004_alter_series_options	2024-11-27 21:22:07.257886+00
22	primevideo	0005_alter_series_options_watchedcontent	2024-11-27 21:22:07.289866+00
23	primevideo	0006_movie_watched	2024-11-27 21:22:07.307383+00
24	primevideo	0007_alter_series_options_series_watched	2024-11-27 21:22:07.335655+00
25	primevideo	0008_series_duration	2024-11-27 21:22:07.352843+00
26	primevideo	0009_remove_movie_favorite_remove_movie_user_and_more	2024-11-27 21:22:07.453714+00
27	sessions	0001_initial	2024-11-27 21:22:07.463187+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
4j9kp0l1tso2wel5mn31qhlq4gjvsvf5	.eJxVjDsOwyAQBe9CHSGD-aZM7zOghV2CkwgkY1dR7h5bcpG0b2bemwXY1hK2TkuYkV2ZZZffLUJ6Uj0APqDeG0-trssc-aHwk3Y-NaTX7XT_Dgr0stdSZ52TBhx9Qojo0Y1aohFJKSm1c8KoQSifnSDwYC0BwB7QoMCgIPb5AvRQOGY:1tGQ8t:p3jGW9GlftofQnTZ7s17PB3VLcInHVd19vUJEPCFaNM	2024-12-11 22:04:15.839936+00
\.


--
-- Data for Name: primevideo_genre; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.primevideo_genre (id, name) FROM stdin;
2	Drama
3	Comedy
4	Fantasy
5	Action
6	Adventures
7	Romance
8	Horror
9	Science Fiction
10	Kids
11	Mysterious
12	Thriller
13	Animation
\.


--
-- Data for Name: primevideo_movie; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.primevideo_movie (id, title, description, created, image, duration, director) FROM stdin;
15	Harry Potter and the Order of the Phoenix	Lord Voldemort has returned, but the Ministry of Magic is doing everything it can to keep the wizarding world from knowing the truth.	2024-11-13 20:31:39.251428+00	imagecontent/HP_5_1Advs32.jpg	132	David Yates
1	IA Javineitor	Es una película en directo manipulando la imagen de la cámara con IA, probando diferentes prompts y loras graduando parámetros del control	2024-10-29 16:09:07.309806+00	imagecontent/Captura_de_pantalla_2024-03-29_155002.png	185	Javier J.
7	El Señor de los Anillos: La Comunidad del Anillo	In the first part of J.R.R. Tolkien's masterpiece, The Lord of the Rings, a young hobbit, Frodo Baggins, inherits a gold ring which holds the secret to the survival of the entire world. Fantasia y aventuras	2024-10-29 17:38:02.003542+00	imagecontent/ESDLA_laComunidaddelAnillo_KIq77lZ.jpg	171	Peter Jackson
8	El señor de los Anillos: Las dos Torres	In the part second of the Tolkien trilogy, Frodo Baggins and the other members of the Fellowship continue on their sacred quest to destroy the One Ring--but on separate paths.	2024-10-29 17:39:21.452167+00	imagecontent/ESDLA_lasDosTorres_nDG3LGb.jpg	171	Peter Jackson
9	El señor de los Anillos: El Retorno del Rey	In the conclusion of J.R.R. Tolkien's epic masterpiece, The Lord of the Rings, as armies mass for a final battle that will decide the fate of the world -- and powerful.	2024-10-29 17:41:33.914861+00	imagecontent/ESDLA_elRetornodelRey_f0Oevbg.jpg	192	Peter Jackson
10	Balada Triste de Trompeta	En 1937, en plena guerra civil, tropas republicanas irrumpen en un circo, durante el espectáculo, para reclutar a sus empleados para luchar contra las tropas nacionales. Mucho tiempo después, en los últimos años del franquismo, dos payasos luchan por el amor de una atractiva trapecista. Comedia y Drama	2024-10-29 17:50:46.28142+00	imagecontent/BaladaTristedeTrompeta_sPInUnv.jpg	100	Alex de la Iglesia
11	Harry Potter and the Philosopher's Stone	Based on the wildly popular J.K. Rowling's book about a young boy who onhis eleventh birthday discovers, he is the orphaned boy of two powerfulwizards and has unique magical powers.	2024-11-13 20:23:18.419884+00	imagecontent/HP_1_yMrRixa.jpg	146	Chris Columbus
12	Harry Potter and the Chambers of Secrets	After a long summer with the horrid Dursleys, Harry Potter is thwarted in his attempts to board the train to Hogwarts School of Witchcraft and Wizardry to begin his second year.	2024-11-13 20:26:22.311079+00	imagecontent/HP_2_FGewXKl.jpg	154	Chris Columbus
13	Harry Potter and the Prisoner of Azkaban	In Harry Potter and the Prisoner of Azkaban, Harry, Ron and Hermione return for their third year at Hogwarts, where they are forced to face escaped prisoner, Sirius Black.	2024-11-13 20:28:09.48446+00	imagecontent/HP_3_zxMUbLM.jpg	135	Alfonso Cuarón
14	Harry Potter and the Goblet of Fire	When Harry Potter's name emerges from the Goblet of Fire, he becomes a competitor in a grueling battle for glory among three wizarding schools - the Triwizard Tournament.	2024-11-13 20:29:42.143331+00	imagecontent/HP_4_gsIviYT.jpg	157	Mike Newell
16	Harry Potter and the Half-Blood Prince	Voldemort is tightening his grip on Hogwarts™ and it is no longer the safe haven it once was. Harry and Dumbledore work to find the key to unlock the Dark Lord’s defenses.	2024-11-13 20:33:58.920097+00	imagecontent/HP_6_mmGuHlq.jpg	153	David Yates
17	Harry Potter and the Deathly Hallows - Part 1	In the first part of the seventh and final adventure, Harry, Ron andHermione set out on their perilous mission to track down and destroy thesecret to Voldemort's immortality and destruction -- the Horcruxes. Ontheir own, without the guidance of their professors or the protection ofDumbledore, the three friends must now rely on one another more thanever. But there are Dark Forces in their midst ...	2024-11-13 20:36:17.945828+00	imagecontent/HP_7_093AMMz.jpg	139	David Yates
18	Harry Potter and the Deathly Hallows - Part 2	Harry, Ron and Hermione set out on their perilous mission to track downand destroy the Horcruxes--the keys to Voldemort's immortality.	2024-11-13 20:38:05.48477+00	imagecontent/HP_8.jpg	125	David Yates
19	The Truman Show	Truman doesn’t realize that his quaint hometown is a giant studio set run by a visionary producer/director/creator (Ed Harris), that folks living and working there are Hollywood actors, that even his incessantly bubbly wife is a contract player.	2024-11-13 20:41:26.741811+00	imagecontent/ElShowdeTruman_2fsMlXD.jpg	96	Peter Weir
20	The Mask	In this slick and hilarious comedy, Jim Carrey plays a mild-mannered bank clerk who finds an ancient magical mask. When he wears the mask he turns into a wild and crazy superhero, which he thoroughly enjoys. But when he seduces the girlfriend of a powerful gangster, things get complicated...	2024-11-13 20:45:58.772393+00	imagecontent/TheMask_g4fIdmg.jpg	96	Charles Russell
21	The Wolf of Wall Street	Martin Scorsese directs this true story of New York stockbroker Jordan Belfort (Leonardo DiCaprio). From the American dream to corporate greed, Belfort goes from penny stocks and righteousness to IPOs and a life of corruption in the late 80s - earning him the title "The Wolf of Wall Street."	2024-11-13 20:48:46.67439+00	imagecontent/ElLobodeWallStreet_t18svnE.jpg	179	Martin Scorsese
22	Borat Subsequent Moviefilm	Delivery of Prodigious Bribe to American Regime for Make Benefit Once Glorious Nation of Kazakhstan. Two time Academy Award nominee and Golden Globe Winner for Best Motion Picture and Best Actor, Musical or Comedy.	2024-11-13 20:51:02.656773+00	imagecontent/Borat2_S37oGWz.jpg	96	Jason Woliner
23	Gladiator	Drawing its inspiration from Anthony Mann's 'The Fall of the Roman Empire' (1964) and Stanley Kubrick's 'Spartacus' (1960), Ridley Scott's Oscar-winning take on the Roman epic lavishes the genre with the very latest in computer-generated effects technology.	2024-11-13 20:53:33.336706+00	imagecontent/Gladiator_g1X3l8S.jpeg	148	Ridley Scott
24	Dune	“Dune” tells the story of Paul Atreides, a gifted young man born into a great destiny, who must travel to the most dangerous planet in the universe to ensure the future of his people.	2024-11-13 20:56:51.963891+00	imagecontent/Dune1_70ujiek.jpg	149	Denis Villeneuve
25	Dune: Part Two	Dune: Part Two explores the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a warpath of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, he endeavors to prevent a terrible future only he can foresee.	2024-11-13 20:58:17.661741+00	imagecontent/Dune2.jpg	165	Denis Villeneuve
26	The Conjuring (2013)	Based on a true story, ghost hunters Lorraine and Ed Warren help a family terrorized by a dark spirit.	2024-11-13 21:01:43.856183+00	imagecontent/TheConjuring_yrvAEmq.jpg	107	James Wan
27	The Conjuring 2 (2016)	Renowned demonologists Lorraine and Ed Warren travel to north London to help a single mother raising four children alone in a house plagued by malicious spirits.	2024-11-13 21:03:28.788042+00	imagecontent/TheConjuring2.jpg	128	James Wan
28	Malasaña 32	La familia Olmedo compra un antiguo piso en la calle Malasaña 32 de Madrid en busca de una nueva y próspera vida sin saber que en su nueva casa no están solos y que estarán en peligro	2024-11-13 21:05:34.831735+00	imagecontent/Malasaña32_FzQwm1u.jpg	104	Albert Pintó
29	The Bogeyman	After the death of their father, three siblings move with their mother to a small town. They soon discover that in recent months there have been mysterious disappearances of several children there and they will embark on an adventure against the clock to discover the truth behind the terrifying legend of the one known as The Bogeyman.	2024-11-13 21:07:19.504259+00	imagecontent/ElHombreDelSaco_uDHjMhz.jpg	91	Ángel Gómez
30	La La Land	A jazz pianist and an aspiring actress fall in love while struggling to make ends meet.	2024-11-13 21:09:56.921531+00	imagecontent/LaLaLand_26VLmDB.jpg	122	Damien Chazelle
31	Click	When a harried workaholic is given a universal remote that allows him to pause, rewind or skip past portions of his life, he discovers which parts are truly the best of his life.	2024-11-13 21:11:20.130488+00	imagecontent/Click_R3ntuvk.jpg	103	Frank Coraci
32	Forrest Gump	A simple-minded man's innocent nature propels him through major events of recent American history.	2024-11-13 21:13:12.771608+00	imagecontent/ForrestGump_fhzje56.jpg	136	Robert Zemeckis
33	The Addams Family	Get ready to snap your fingers! The Addams Family is back on the big screen in the first animated comedy about the kookiest family on the block. Funny, outlandish, and utterly iconic, the Addams Family redefines what it means to be a good neighbor.	2024-11-13 21:19:41.53059+00	imagecontent/TheAddamsfamily_w47ZUOV.jpg	82	Conrad Vernon, Greg Tiernan
34	The Addams Family 2	Everyone's favorite spooky family is back! Distraught that their children are growing up, Morticia and Gomez decide to cram Wednesday, Pugsley and Uncle Fester into their haunted camper for one last family vacation. What could possibly go wrong?	2024-11-13 21:21:19.69848+00	imagecontent/TheAddamsfamily2_rmFWKdb.jpg	87	Greg Tiernan, Conrad Vernon
35	Hotel Transylvania Transformania	Reunite with your favorite monsters for an adventure that presents Drac with a terrifying task.	2024-11-13 21:23:34.221454+00	imagecontent/HotelTransylvaniaTransformania_9mUY5tj.jpg	88	Derek Drymon, Jennifer Kluska
36	Puss in Boots: The Last Wish	Everyone's favorite swashbuckling feline returns for a new adventure in the Shrek universe as Puss in Boots goes on a grand quest to find a magical Wishing Star.	2024-11-13 21:25:46.029094+00	imagecontent/GatoconBotas_LastWish_FqWBrD7.jpg	102	Joel Crawford, Januel P. Mercado
37	Iron Man	Suit up for action with Robert Downey Jr. in the ultimate adventure movie you've been waiting for, Iron Man! When jet-setting genius-industrialist Tony Stark is captured in enemy territory, he builds a high-tech suit of armor to escape.	2024-11-13 21:28:30.307401+00	imagecontent/IronMan1_sK4yT9J.jpg	125	Jon Favreau
38	The Matrix	Keanu Reeves stars in an explosive sci-fi adventure about a man who comes to believe that his everyday world is the product of a computer-driven digital matrix that feeds on humans.	2024-11-13 21:30:39.775117+00	imagecontent/Matrix1_91cEbYD.jpg	130	Andy Wachowski, Larry Wachowski
39	The Matrix Reloaded	Neo, Trinity & Morpheus lead revolt against Machine Army unleashing their arsenal of extraordinary skills & weaponry against systematic forces of repression & exploitation.	2024-11-13 21:33:51.738102+00	imagecontent/Matrix2_lXCvdvr.jpg	129	Unknown Director
40	The Matrix Revolutions	In this explosive final chapter of the Matrix trilogy, Neo, Morpheus and Trinity battle to defend Zion, the last real-world city, against the onslaught of the machines that have enslaved the human race. And, now as Neo learns more about his heroic powers--including the ability to see the codes of things and the people, he faces the consequences of the choice made in The Matrix Reloaded.	2024-11-13 21:35:41.08054+00	imagecontent/Matrix3_qzLu4cX.jpg	123	Lilly Wachowski, Lana Wachowski
41	The Matrix Resurrections	“The Matrix Resurrections,” the long-awaited fourth film in the groundbreaking franchise reunites original stars Keanu Reeves and Carrie-Anne Moss in the iconic roles they made famous.	2024-11-13 21:36:46.708976+00	imagecontent/Matrix4_D6SN7WY.jpg	142	Lana Wachowski
2	asdf	asdf	2024-11-27 21:47:43.270117+00	imagecontent/AttackOnTitan.jpg	2	Unknown Director
3	asdvbj	wertghjk	2024-11-27 22:04:49.494033+00	imagecontent/Captura_de_pantalla_2024-11-26_194732.png	2	Unknown Director
\.


--
-- Data for Name: primevideo_movie_genres; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.primevideo_movie_genres (id, movie_id, genre_id) FROM stdin;
1	10	2
2	10	3
3	9	4
4	9	6
5	8	4
6	8	6
7	7	4
8	7	6
9	1	8
10	1	4
11	11	10
12	11	4
13	11	6
14	11	11
15	12	10
16	12	11
17	12	4
18	12	6
19	13	11
20	13	4
21	13	6
22	14	4
23	14	6
24	15	9
25	15	11
26	15	4
27	16	9
28	16	4
29	17	11
30	17	4
31	18	11
32	18	4
33	18	6
34	19	2
35	19	3
36	20	3
37	20	5
38	21	2
39	21	3
40	22	3
41	23	2
42	23	5
43	24	2
44	24	5
45	24	6
46	25	9
47	25	2
48	25	5
49	25	6
50	24	9
51	26	8
52	26	12
53	27	8
54	27	12
55	28	8
56	28	12
57	29	8
58	29	4
59	29	6
60	30	7
61	31	2
62	31	3
63	31	7
64	32	2
65	32	7
66	33	3
67	33	13
68	34	3
69	34	13
70	35	10
71	35	13
72	35	6
73	34	10
74	33	10
75	36	10
76	36	3
77	36	13
78	37	9
79	37	4
80	37	5
81	38	9
82	38	5
83	39	9
84	39	5
85	40	9
86	40	5
87	41	9
88	41	5
\.


--
-- Data for Name: primevideo_series; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.primevideo_series (id, title, description, created, image, seasons, episodes, director, duration) FROM stdin;
2	The Office	In this US adaptation of iconic British sitcom `The Office', Steve Carrell stars as office manager Michael Scott in Scranton, Pennsylvania. This mockumentary follows the everyday cubicle lives of the staff in Michael's office and their exploits.	2024-11-10 20:26:55.773724+00	imagecontent/TheOffice_G8rfxND.jpg	7	25	Ken Kwapis	25
3	The Boys	All Episodes Available. In a more intense Season 2 of THE BOYS, Butcher, Hughie and the team reel from their losses in Season 1. On the run from the law, they struggle to fight back against the Superheroes. Meanwhile Vought, the hero management company, cashes in on the panic over Supervillains, and a new hero, Stormfront, shakes up the company and challenges an already unstable Homelander.	2024-11-10 20:32:29.525975+00	imagecontent/TheBoys_SvLsbJd.jpg	4	8	Dan Trachtenberg, Matt Shakman, Phil Sgriccia, Fred Toye, Stefan Schwartz, Jennifer Phang, Dan Attia	60
4	The Lord of the Rings: Rings of Powers	Set thousands of years before the events of J.R.R. Tolkien’s The Lord of the Rings, this epic drama follows an ensemble cast of characters, both familiar and new, as they confront the long-feared re-emergence of evil to Middle-earth.	2024-11-13 21:40:34.341927+00	imagecontent/ESDLA_RingsOfPower_3UO2llk.jpg	2	8	Christopher Newman	70
5	Two and a half Men	Welcome back to the Harpers' Malibu beach house – home to one of the funniest TV comedy hits in a long, long time. Resolute bachelor Charlie's trying (but not very hard) to remember the name of the girl currently taking a shower upstairs.	2024-11-13 21:44:12.031495+00	imagecontent/TwoAndaHalfMen_JqEIEbW.jpg	12	24	James Widdoes	20
6	Mom	From hitmaker Chuck Lorre comes his next big comedy – an irreverent and outrageous take on true family love – and dysfunction. Newly sober single mom Christy struggles to raise two children in a world full of temptations and pitfalls. Testing her sobriety is her formerly estranged mother, now back in Christy's life and eager to share passive-aggressive insights into her daughter's many mistakes.	2024-11-13 21:47:21.131653+00	imagecontent/Mom_vkYR58O.jpg	8	22	James Widdoes	23
7	Velvet	Defying their families' wishes and all social norms of 1950s Spain, heir to the prestigious Velvet fashion house Alberto Márquez and humble seamstress Ana Ribera fall in love, but their love is tested by Alberto's duty to his family's legacy.	2024-11-13 21:49:48.455518+00	imagecontent/Velvet_K25HSBg.jpg	4	15	Adriana Ugarte	95
8	Attack on Titan	Over 100 years ago, the Titans, gigantic mindless beings with an insatiable appetite for humans, appeared out of nowhere and brought humanity to the brink of extinction. Turned into food for the Titans, the survivors built gigantic walls 50 meters high, behind which they took refuge, thus renouncing the world beyond the walls.	2024-11-13 21:55:07.093898+00	imagecontent/AttackOnTitan_ON5Ygg5.jpg	6	25	Tetsurô Araki	25
9	Arrow	Protecting his city from crime and corruption, vigilante hero Oliver Queen (aka The Arrow) uses his formidable combat skills and marksmanship to go head to head with lethal foes including Deathstroke, Ra's al Ghul and the League of Assassins and become a beacon of hope for those in need.	2024-11-13 21:58:06.601218+00	imagecontent/Arrow.jpg	8	23	James Bamford	42
10	Naruto	Naruto is a young ninja apprentice who is marginalized and feared in the Hidden Leaf Village for both his hyperactive and mischievous nature and the terrible power sealed within him. Accompanied by the intense Sasuke and the resourceful Sakura, Naruto begins his apprenticeship determined to become a Hokage master, the highest distinction among ninjas, and earn the recognition of his own.	2024-11-13 22:01:09.140225+00	imagecontent/Naruto_g8VYE9U.jpg	9	52	Masashi Kishimoto	23
11	The Handmaid's Tale	The Handmaid's Tale starring Elizabeth Moss and based on Margaret Atwood's classic novel about life in the dystopia of Gilead, a totalitarian society in what was formerly part of the United States.	2024-11-13 22:03:12.948414+00	imagecontent/ElCuentoDeLaCriada_TQt3VrU.jpg	5	10	Reed Morano	55
12	Doctor Who	Adventures in time and space with the ninth Doctor and his companion Rose.	2024-11-13 22:05:40.023687+00	imagecontent/DoctorWho_5W2kRob.jpg	10	14	Phil Collinson	50
13	The Triplets	The Triplets are the protagonists of a series of stories created by the Catalan Roser Capdevilla, which were later adapted for television. The writer was inspired by her three daughters to create the three characters.	2024-11-13 22:09:23.960022+00	imagecontent/LasTresMellizas_YQceYBW.jpg	1	104	Bob Balser, Baltasar Pedrosa	26
14	Pocoyo	In the first season of Pocoyo, the protagonist, a curious and fun-loving child, constantly embarks on new adventures with his inseparable friends, Pato, Loula, Elly and Pajaroto. With Pocoyo, children will discover and learn about tolerance, respect and love.	2024-11-13 22:11:26.606221+00	imagecontent/Pocoyo_kS5k2xd.jpg	3	13	David Cantolla, Guillermo Garcia	30
15	Stories to keep you awake	Rodrigo Cortés, Rodrigo Sorogoyen, Paco Plaza and Paula Ortiz are in charge of reinterpreting this anthology of self-contained stories that will allow viewers to enjoy updated versions of the best stories by Chicho Ibáñez Serrador. The four directors pay tribute to the historical importance of the series in Spanish fiction.	2024-11-13 22:14:36.229449+00	imagecontent/HistoriasParaNoDromir_Vch7Hzz.jpg	2	4	Rodrigo Sorogoyen	45
16	The Witching Seasson	This spine-tingling anthology of horror and suspense delivers original tales of terror that capture the spirit of the Halloween season.	2024-11-13 22:16:35.585219+00	imagecontent/TheWitchingSeason_qWoHoKC.jpg	1	5	Michael Ballif	22
\.


--
-- Data for Name: primevideo_series_genres; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.primevideo_series_genres (id, series_id, genre_id) FROM stdin;
2	3	2
3	3	3
4	3	5
5	3	9
7	2	3
8	2	7
9	4	2
10	4	4
11	4	5
12	4	6
13	5	3
14	5	7
15	6	2
16	6	3
17	6	7
18	7	2
19	7	7
20	8	2
21	8	5
22	8	6
23	8	12
24	8	13
25	9	2
26	9	12
27	9	5
28	8	4
29	10	13
30	10	4
31	10	5
32	10	6
33	11	9
34	11	2
35	11	12
36	12	9
37	12	6
38	13	10
39	13	3
40	13	4
41	13	13
42	14	10
43	14	13
44	15	8
45	15	12
46	16	8
\.


--
-- Data for Name: primevideo_usercontentstatus; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.primevideo_usercontentstatus (id, watched, favorite, movie_id, series_id, user_id) FROM stdin;
1	t	t	1	\N	2
2	t	t	\N	2	2
3	t	f	\N	3	2
4	f	f	1	\N	3
5	t	t	\N	2	3
7	t	t	10	\N	3
8	t	f	7	\N	3
9	t	t	8	\N	3
10	t	t	9	\N	3
11	t	t	7	\N	2
12	t	f	8	\N	2
13	t	t	9	\N	2
14	f	f	10	\N	2
15	f	f	19	\N	3
16	f	f	7	\N	5
17	f	f	1	\N	5
18	f	f	\N	2	5
19	f	f	\N	5	3
20	f	f	\N	4	3
21	f	f	26	\N	3
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 77, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 3, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 7, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 3, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 8, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 27, true);


--
-- Name: primevideo_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.primevideo_genre_id_seq', 1, false);


--
-- Name: primevideo_movie_genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.primevideo_movie_genres_id_seq', 1, false);


--
-- Name: primevideo_movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.primevideo_movie_id_seq', 3, true);


--
-- Name: primevideo_series_genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.primevideo_series_genres_id_seq', 1, false);


--
-- Name: primevideo_series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.primevideo_series_id_seq', 1, false);


--
-- Name: primevideo_usercontentstatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.primevideo_usercontentstatus_id_seq', 3, true);


--
-- PostgreSQL database dump complete
--


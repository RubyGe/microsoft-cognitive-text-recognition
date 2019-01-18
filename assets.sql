--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.1

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
-- Name: assets; Type: TABLE; Schema: public; Owner: genieguo
--

CREATE TABLE assets (
    id integer NOT NULL,
    url text NOT NULL,
    uploaded_at timestamp without time zone DEFAULT now() NOT NULL,
    file_size character varying(255) NOT NULL,
    file_type character varying(50) NOT NULL,
    cognitive_text text
);


ALTER TABLE assets OWNER TO genieguo;

--
-- Name: assets_id_seq; Type: SEQUENCE; Schema: public; Owner: genieguo
--

CREATE SEQUENCE assets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE assets_id_seq OWNER TO genieguo;

--
-- Name: assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: genieguo
--

ALTER SEQUENCE assets_id_seq OWNED BY assets.id;


--
-- Name: assets id; Type: DEFAULT; Schema: public; Owner: genieguo
--

ALTER TABLE ONLY assets ALTER COLUMN id SET DEFAULT nextval('assets_id_seq'::regclass);


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: genieguo
--

COPY assets (id, url, uploaded_at, file_size, file_type, cognitive_text) FROM stdin;
2	https://jingxie16.files.wordpress.com/2015/08/international-students-program_flyer_ca.jpg	2019-01-17 21:59:01.026094	3.8MB	JPEG	veriæo BEGIN YOUR WITH THE VERIZON INTERNATIONAL STUDENT PROGRAM Now with no deposit required for qualified students!  | veriæo Gift Card  | GET EVEN MORE WITH THIS SPECIAL OFFER FROM VERIZON Limited Time Offer: September 19 - October 5. Receive a Verizon $25 gift card to purchase accessories or more when you get a new smartphone! New 2 yr. activation req'd.  | Join America's Largest and Most Reliable 4G LTE Network  | LEARN MORE about the program at: vzw.com/internationalstudents  | VISIT our California stores at: Berkeley: 2209 Shattuck Ave, Berkeley, CA 94704 La Jolla: 8867 Villa La Jolla Dr, La Jolla, CA 92037 Westwood: 1095 Broxton Ave, Los Angeles, CA 90024  | Activation/upgrade fee/line: Up to $35. IMPOTANT CONSUMER INFORMATION: Subject to Cust Agmt, Calling Plan & credit approval. Up to $350 early termination fee. Offers & Coverage, varying y svc, not available everywhere; see vzw.com. 02014 Verizon Wireless  | 
3	https://jingxie16.files.wordpress.com/2015/08/2014_kcon_pod_mechanical_071014.jpg	2019-01-17 21:59:01.026094	2.2MB	JPEG	veriæp HEAT UP YOUR SUMMER Get in on the fun before school starts with the hottest tech, the hottest entertainment, and the hottest sweepstakes from Verizon! THURSDAY AUGUST 7 Verizqh Wireless  | ALL NEW! LG G3 Stunning 5.5" Quad HD IPS Display Unique Laser Auto-Focus Simplified & Color-Coordinated Graphics SIM Card Capable XLTE Ready LG G Pad  | GRAND PRIZE One grand prize winner and a guest will receive: 2-day KCON VIP experience, including evening concerts Domestic round-trip airfare for 2 3-night hotel stay Plus, the grand prize winner gets all the devices and accessories on their wish list! LG Tone ProTM  | DON'T MISS KCON, THE HOTTEST K-POP EVENT OF THE SUMMER! FEATURING GIRLS' GENERATION, G-DRAGON, BTS, ICJ, VIXX, AND MORE!  | ENTER VERIZON'S "WISH FOR MORE" SWEEPSTAKES NOW FOR A CHANCE TO WIN A TRIP TO KCON AND HOT TECHNOLOGY YOU WANT! For official rules, go to verizonwireless.com/heatupyoursummer.  | HOW TO ENTER: O Visit any Verizon Wireless store between July 10th to July 29th e Shoot 3 pictures of your back-to-school wishlist: 1 smartphone, 1 tablet, and 1 accessory  | caw mwcs HAW"/  | O Upload the photos via Instagram with the hashtag "#KConWishSweepstakes" or use the online entry form at verizonwireless.com/heatupyoursummer to enter. No Purchase Necessary to enter or win. Starts 7/10/14 and ends on 7/29/14. Must be legal, U.S. resident 18 years or older to enter. Void where prohibited. Data usage applies.  | 
4	http://www.ardoinadvertising.com/wp-content/uploads/2018/09/VerizonFlyer2-front-back.jpg	2019-01-17 21:59:01.026094	484KB	JPEG	verimn BUSINESS MOVES FAST, YOUR INTERNET SHOULD TOO. With speeds available up to 300/65 Mbps, FiOS is one of the fastest and most reliable Internet services available to small businesses.  | verimn  | FiOS IS THE BEST VALUE IN THE MARKETPLACE. Not All Bundles Are Created Equal. The Verizon Business Solutions Bundle  | Verizon FiOS Internet Blazing-fast speeds of up to 300/65 Mbps for quicker uploads and downloads. Get All This Google Apps for Verizon Enjoy three email addresses with your personalized bus iness domain name (yourname@yourbusiness.com). Google Calendar. Google Docs and more. Verizon Intemet Security Suite Safeguard your business against known viruses and hackers with adv anced online security. Online Backup & Sharing Service Automatically back up your files to remote servers and enjoy 250 MB of online storage space.  | Business-Class Phone Talk all you want with one phone line and unlimited nationwide calling on our 99.996 reliable voice network. And More! Choice of No Annual Contract or 2- Year Price Guarantee with a term agreement Flexible scheduling Professional on-site installation 24/7 tech support  | FiOS  | Call 1.877.854.1430  | FiOS Click smallbusiness.verizon.com  | Call 1.877.854.1430 Click smallbusiness.verizon.com  | urn* n cummers n tut hurdle. subl&t trlrtdr* and mlnlnrn 240T*OJtWe mmtt15 Nth to cononunon pnce5 to Ealytenrnocq festra up to RIE Imerret gatrry stariard ice & trup to 8 use Gcogle Apps, a requlBI Imemet ari Onlre Ilene and  | 
1	https://jingxie16.files.wordpress.com/2015/08/international-students-program-flyer-berkeley-en1.jpg	2019-01-17 21:59:00.781575	3.4MB	JPEG	veriæp KICK OFF YOUR NEW ADVENTURE COVERED BY THE BEST NETWORK INTRODUCING THE VERIZON INTERNATIONAL STUDENT PROGRAM With no deposit required for qualified students, it's easier than ever for new students just like you to start smart with America's largest and most reliable network.  | VERIZON GIVES YOU MORE  | Head to a participating Verizon store. To qualify, you must: bring a valid student ID bring an international passport or visa have "no US credit history with TransUnion, Equifax, or Experian" when a credit check is returned Choose from the latest and greatest smartphones. Verizon offers a vast selection of Global ReadyTM SIM-card capable, XLTE ready devices Choose the plan that suits you best. Select from Verizon's flexible plan options, which include the MORE Everything, Single-Line, and ALL SET TM plans  | Snr,lSlJNG Mon, 24 F  | Take advantage of the best network on the latest and greatest devices like the Samsung GALAXY 55 Plus, on Verizon Smart Rewards, get points to spend on local deals, sav- ings on brand name merchandise, and more. Get 15,000 points for signing up before November 1st!  | To learn more, visit: vzw.com/internationalstudents  | Visit our store and ask about the International Student Program at: 2209 Shattuck Ave, Berkeley, CA 94704  | Participation in Smart Rewards may require enrollment in Verizon Selects, which personalizes marketing customers may receive from Verizon and other companies by using information about customers ' use of Verizon products and services including location, web browsing and app usage data. 02014 Verizon Wireless  | 
\.


--
-- Name: assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: genieguo
--

SELECT pg_catalog.setval('assets_id_seq', 4, true);


--
-- Name: assets assets_pkey; Type: CONSTRAINT; Schema: public; Owner: genieguo
--

ALTER TABLE ONLY assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (id);


--
-- Name: assets assets_url_key; Type: CONSTRAINT; Schema: public; Owner: genieguo
--

ALTER TABLE ONLY assets
    ADD CONSTRAINT assets_url_key UNIQUE (url);


--
-- PostgreSQL database dump complete
--


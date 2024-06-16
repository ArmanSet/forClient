--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-05-07 22:14:40 CEST

SET
statement_timeout = 0;
SET
lock_timeout = 0;
SET
idle_in_transaction_session_timeout = 0;
SET
client_encoding = 'UTF8';
SET
standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET
check_function_bodies = false;
SET
xmloption = content;
SET
client_min_messages = warning;
SET
row_security = off;

SET
default_tablespace = '';

SET
default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 83051)
-- Name: accountant; Type: TABLE; Schema: public; Owner: postgres
--

-- CREATE TABLE public.accountant
-- (
--     factory_id bigint,
--     id         bigint NOT NULL,
--     address    character varying(255),
--     name       character varying(255),
--     phone      character varying(255)
-- );


-- ALTER TABLE public.accountant OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 83050)
-- Name: accountant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

-- CREATE SEQUENCE public.accountant_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE CACHE 1;
--
--
-- ALTER SEQUENCE public.accountant_id_seq OWNER TO postgres;

--
-- TOC entry 3709 (class 0 OID 0)
-- Dependencies: 216
-- Name: accountant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

-- ALTER SEQUENCE public.accountant_id_seq OWNED BY public.accountant.id;


--
-- TOC entry 219 (class 1259 OID 83060)
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart
(
    id      bigint NOT NULL,
    address character varying(255),
    email   character varying(255),
    name    character varying(255),
    phone   character varying(255)
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 83059)
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER SEQUENCE public.cart_id_seq OWNER TO postgres;

--
-- TOC entry 3710 (class 0 OID 0)
-- Dependencies: 218
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;


--
-- TOC entry 220 (class 1259 OID 83068)
-- Name: cart_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_products
(
    cart_id     bigint NOT NULL,
    products_id bigint NOT NULL
);


ALTER TABLE public.cart_products OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 83072)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category
(
    id    bigint NOT NULL,
    image character varying(255),
    name  character varying(255),
    type  character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 83071)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER SEQUENCE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 3711 (class 0 OID 0)
-- Dependencies: 221
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 224 (class 1259 OID 83081)
-- Name: factory; Type: TABLE; Schema: public; Owner: postgres
--

-- CREATE TABLE public.factory
-- (
--     id      bigint NOT NULL,
--     address character varying(255),
--     name    character varying(255)
-- );


-- ALTER TABLE public.factory OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 83080)
-- Name: factory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--
--
-- CREATE SEQUENCE public.factory_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE CACHE 1;


-- ALTER SEQUENCE public.factory_id_seq OWNER TO postgres;

--
-- TOC entry 3712 (class 0 OID 0)
-- Dependencies: 223
-- Name: factory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

-- ALTER SEQUENCE public.factory_id_seq OWNED BY public.factory.id;


--
-- TOC entry 226 (class 1259 OID 83090)
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order"
(
    order_amount  numeric(38, 2),
    order_status  integer DEFAULT 0,
    create_time   timestamp(6) without time zone,
    id            bigint NOT NULL,
    update_time   timestamp(6) without time zone,
    user_id       bigint,
    buyer_address character varying(255),
    buyer_email   character varying(255),
    buyer_name    character varying(255),
    buyer_phone   character varying(255),
    description   character varying(255),
    name          character varying(255)
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 83099)
-- Name: order-products_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order-products_product"
(
    order_product_id bigint NOT NULL,
    product_id       bigint NOT NULL
);


ALTER TABLE public."order-products_product" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 83089)
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER SEQUENCE public.order_id_seq OWNER TO postgres;

--
-- TOC entry 3713 (class 0 OID 0)
-- Dependencies: 225
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_id_seq OWNED BY public."order".id;


--
-- TOC entry 215 (class 1259 OID 82804)
-- Name: order_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_product
(
    order_product_id bigint NOT NULL,
    product_id       bigint NOT NULL
);


ALTER TABLE public.order_product OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 83103)
-- Name: order_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_products
(
    quantity integer NOT NULL,
    cart_id  bigint,
    id       bigint  NOT NULL,
    order_id bigint
);


ALTER TABLE public.order_products OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 83102)
-- Name: order_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER SEQUENCE public.order_products_id_seq OWNER TO postgres;

--
-- TOC entry 3714 (class 0 OID 0)
-- Dependencies: 228
-- Name: order_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_products_id_seq OWNED BY public.order_products.id;


--
-- TOC entry 231 (class 1259 OID 83110)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products
(
    max_quantity   integer          NOT NULL,
    price          double precision NOT NULL,
    quantity       integer          NOT NULL,
    active         integer          NOT NULL,
    category_id    bigint,
    id             bigint           NOT NULL,
    subcategory_id bigint,
    brand          character varying(255),
    colour         character varying(255),
    description    character varying(3000),
    image          character varying(255),
    name           character varying(255),
    image2         character varying(255),
    image3         character varying(255),
    image4         character varying(255)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 83109)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 3715 (class 0 OID 0)
-- Dependencies: 230
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 233 (class 1259 OID 83119)
-- Name: subcategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subcategory
(
    category_id bigint,
    id          bigint NOT NULL,
    image       character varying(255),
    name        character varying(255),
    type        character varying(255)
);


ALTER TABLE public.subcategory OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 83118)
-- Name: subcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER SEQUENCE public.subcategory_id_seq OWNER TO postgres;

--
-- TOC entry 3716 (class 0 OID 0)
-- Dependencies: 232
-- Name: subcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subcategory_id_seq OWNED BY public.subcategory.id;


--
-- TOC entry 235 (class 1259 OID 83128)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users
(
    cart_id    bigint,
--     factory_id bigint,
    id         bigint NOT NULL,
    address    character varying(255),
    email      character varying(255),
    name       character varying(255),
    password   character varying(255),
    phone      character varying(255),
    role       character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 83127)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3717 (class 0 OID 0)
-- Dependencies: 234
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3495 (class 2604 OID 83054)
-- Name: accountant id; Type: DEFAULT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.accountant ALTER COLUMN id SET DEFAULT nextval('public.accountant_id_seq'::regclass);


--
-- TOC entry 3496 (class 2604 OID 83063)
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);


--
-- TOC entry 3497 (class 2604 OID 83075)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3498 (class 2604 OID 83084)
-- Name: factory id; Type: DEFAULT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.factory ALTER COLUMN id SET DEFAULT nextval('public.factory_id_seq'::regclass);


--
-- TOC entry 3500 (class 2604 OID 83094)
-- Name: order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order" ALTER COLUMN id SET DEFAULT nextval('public.order_id_seq'::regclass);


--
-- TOC entry 3501 (class 2604 OID 83106)
-- Name: order_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products ALTER COLUMN id SET DEFAULT nextval('public.order_products_id_seq'::regclass);


--
-- TOC entry 3502 (class 2604 OID 83113)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 3503 (class 2604 OID 83122)
-- Name: subcategory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategory ALTER COLUMN id SET DEFAULT nextval('public.subcategory_id_seq'::regclass);


--
-- TOC entry 3504 (class 2604 OID 83131)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3685 (class 0 OID 83051)
-- Dependencies: 217
-- Data for Name: accountant; Type: TABLE DATA; Schema: public; Owner: postgres
--

-- Inserting data into the public.accountant table
-- Inserting data into the public.accountant table
-- INSERT INTO public.accountant (factory_id, id, address, name, phone)
-- VALUES (1, 1, 'address_value_1', 'name_value_1', 'phone_value_1'),
--        (2, 2, 'address_value_2', 'name_value_2', 'phone_value_2'),
--        (3, 3, 'address_value_3', 'name_value_3', 'phone_value_3');

-- Inserting data into the public.cart table
-- Inserting data into the public.cart table
INSERT INTO public.cart (id, address, email, name, phone)
VALUES (1, 'Onderwijslaan 51- 2', 'arman.setoian@gmail.com', 'Arman Setoian', '0491283791'),
       (2, 'Some other address', 'another.email@example.com', 'Another Name', '9876543210');
-- Repeat the above INSERT statement for each row in the public.cart table
-- Repeat the above INSERT statement for each row in the public.cart table
;
-- Similarly, create INSERT statements for other tables like public.cart_products, public.category, public.factory, public.order, public.order-products_product, public.order_product, public.order_products, and public.products
-- INSERT INTO public.factory (id, name, address)
-- VALUES (2, 'Factory Name', 'Factory Address');

-- INSERT INTO public.factory (id, name, address)
-- VALUES (1, 'Factory', 'Address');
-- INSERT INTO public.factory (id, name, address)
-- VALUES (3, 'Name', 'Factory');

-- Добавление записей в таблицу category
INSERT INTO public.category (id, name, type, image)
VALUES (1111, 'Oils', 'Oils',
        'https://media.autodoc.de/360_photos/7889241/h-preview.jpg'),
       (2222, 'Tires and Wheels', 'tires', 'https://cdn.webshopapp.com/shops/44951/files/449008563/image.jpg'),
       (3333, 'Auto Electronics', 'Electronics',
        'https://ybvl.ru/upload/medialibrary/315/315fe22ba3d167ea73f448f9ff17eb02.jpg'),
       (4444, 'Instruments ', 'instruments',
        'https://oil2go.com.ua/storage/files/filemanager/nabor-instrumentov-dlya-avto.jpg'),
       (5555, 'Auto Accessories', 'Accessories',
        'https://carlife.nl/wp-content/uploads/2020/01/autoaccessoires-2-1920x1440.jpg'),
       (6666, 'Brushes', 'Brushes',
        'https://cdn.vianor-tyres.ru/images/info/3shetki-bkg.png');

-- Добавление записей в таблицу subcategory
INSERT INTO public.subcategory (id, name, type, image, category_id)
VALUES (1111, 'Brake Fluid', 'Brake Fluid',
        'https://luxmobil.kz/d/14860457.jpg',
        1111),
       (2222, 'Summer Tires', 'Summer Tires',
        'https://auto.vercity.ru/img/magazine/2019/05/20/1558352673.jpg',
        2222),
       (3333, 'Batteries', 'Batteries',
        'https://autostrada-shop.ru/wp-content/uploads/2016/08/%D0%90%D0%BA%D0%BE%D0%BC-EFB-60-%D0%BE%D0%BF.jpg',
        3333),
       (4444, 'Auto Tools', 'Auto Tools',
        'https://cdn.autodoc.de/thumb?id=13658623&m=0&n=0&lng=nl&rev=94077835',
        4444),
       (5555, 'Fire Extinguisher', 'Fire Extinguisher',
        'https://lider01.ru/upload/iblock/539/5399917997ea42b2486c2dc76c93e52c.jpg',
        5555),
       (6666, 'Brushes for Cars', 'Brushes for Cars',
        'https://marshal.ru/ckeditor_assets/pictures/181/content_dvorniki.jpeg',
        6666),
       (7777, 'Motor Oil', 'Motor Oil',
        'https://maslomarket.com/upload/iblock/d18/398ofonavp1yj0y5vxuh2afg3uumfcqr.jpg',
        1111),
       (8888, 'Wheels', 'Sport Shoes',
        'https://vianor39.ru/upload/iblock/98e/slgybrh7sncoqoxia3rufwhvodfw2rl3.jpg',
        2222),
       (9999, 'Auto Fuses', 'Auto Fuses',
        'https://dalincom.ru/images/201801/goods_img/10340_P_1516221572824.jpg',
        3333),
       (1010, 'Saw', 'Saw',
        'https://cdn.toolstation.be/images/160916-BE/800/40194.jpg',
        4444),
       (11111, 'First aid Kit ', 'First aid Kit', 'https://www.sunmed.ru/upload/iblock/780/78069df9a8fb3c7bbb740bd6af7a5511.jpg', 5555),
       (12122, 'Brushes for Trucks', 'Brushes for Trucks',
        'https://perevozka24.ru/img/ck_upload/Opera%20%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA_2022-12-27_130318_yandex.ru.png',
        6666),
       (13133, 'Coolant', 'Coolant',
        'https://kerner.ru/photos/0/7/076c666e75210fdd0fb07e067e3e3997.jpg',
        1111);


-- Добавление записей в таблицу products

INSERT INTO public.products (id, name, description, colour, brand, image, image2, image3, image4, price, quantity,
                             max_quantity,active, subcategory_id)
VALUES (11111, 'GEnergy Brake Fluid  ', 'Brake fluid G-Energy Expert DOT 4, 2451500003 is intended for the brake and clutch systems of domestic and foreign cars. The product meets the DOT-4 standard. The liquid is used at air temperatures from -50 to +50 degrees.', 'Grey', 'G Energy',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtohimiya/1119789/560x504/55627342.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtohimiya/1119789/560x504/55627336.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtohimiya/1119789/560x504/72760268.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtohimiya/1119789/560x504/72760274.jpg',
        100.0,
        0, 20,1, 1111),
       (22222, 'Summer Tires Ultra',
        'Соблазняют скоростью. Поражают управлением.Летние шины для мощных спортивных автомобилей Ikon Autograph Ultra 2 со сбалансированным и прочным сцеплением с дорогой',
        'Black', 'Ikon',
        'https://s1.shinservice.ru/catalog/ikon/ikon-ultra2__1.jpg?v=62',
        'https://s1.shinservice.ru/catalog/ikon/ikon-ultra2__2.jpg?v=62',
        'https://s1.shinservice.ru/catalog/ikon/ikon-ultra2__3.jpg?v=62',
        'https://shinapoint.ru/upload/iblock/d80/d80d01bc79ef1cfaa5f985b771468b08.jpg',
        200.0,
        0, 30,1, 2222),
       (33333, 'Battery Varta',
        'Best batteries for your car',
        'White', 'Varta',
        'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRIuqhH0OYx3Tj5dtVNJJMPi8TQWWMaLp5eyWxaoql7-zHQdmZBN3ik-qqdeyoLR0gyd-yDm_B4V0usMq_V9k3qSqkZOeGSNKVzG20b0dvbsEAhWNdUNSlyBw',
        'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTuCvObIQsnk_k86EFuKqUFQzd_8e8-bJ96QBu4VClgtjTZHjjL9pgjBwtf6wAvxU5n9x_Z7axNEAdYWoMl3-ORYeQSReHMWZVppJzjuDSGFwyhb1l2d_gQ83A',
        'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSfZCTNasZinW9S7cvq39mhMyEWc1dDaSacpzthSokbrlIO1U054S7_W7koayQ3ir4SeLJLWGidW9UqiUDHnK7hDP_3TC-pIRT-ToRgXAkfGyCrXjL6l9sOvhU',
        'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQC01VM5BEGyl0_bfbY6tNlQP288x7N6hjJ1VE9beQpURfezCW9QCxybFLqKDwGDckulY6Jh3zNRn-7cZ_0GpwTQVGKskJzde1Q88IyqpGDt3Q_fNLTvluS-w',
        300.0, 0, 40,1, 3333),
       (44444, 'Auto Tools Inforce', 'Набор инструментов Inforce 127 предметов 1/2 дюйма и 1/4 дюйма 06-07-16 предназначен для монтажных, демонтажных и ремонтных работ в автосервисах и мастерских', 'Black', 'Inforce',
        'https://cdn.vseinstrumenti.ru/images/goods/ruchnoj-instrument/nabory-ruchnogo-instrumenta/1065866/560x504/52792444.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/ruchnoj-instrument/nabory-ruchnogo-instrumenta/1065866/560x504/52792445.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/ruchnoj-instrument/nabory-ruchnogo-instrumenta/1065866/560x504/52792446.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/ruchnoj-instrument/nabory-ruchnogo-instrumenta/1065866/560x504/52792447.jpg',
        400.0, 0, 50,1, 4444),
       (55555, 'Fire Extinguisher Gigant',
        'Огнетушитель Gigant ОП-4(з)-АВСЕ-01 GT-4 подходит для организаций, его можно использовать и в быту при тушении локальных возгораний.',
        'Red', 'Gigant', 'https://cdn.vseinstrumenti.ru/images/goods/skladskoe-oborudovanie-i-tehnika-dlya-sklada/pozharnoe-oborudovanie/1906904/560x504/54253232.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/skladskoe-oborudovanie-i-tehnika-dlya-sklada/pozharnoe-oborudovanie/1906904/560x504/54253233.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/skladskoe-oborudovanie-i-tehnika-dlya-sklada/pozharnoe-oborudovanie/1906904/560x504/54253234.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/skladskoe-oborudovanie-i-tehnika-dlya-sklada/pozharnoe-oborudovanie/1906904/560x504/54253237.jpg',
        500.0, 0, 60,1, 5555),
       (66666, 'Brushes for car Hybrid', 'Современная гибридная технология объединяет аэродинамичный профиль бескаркасных щеток и идеальный контакт с лобовым стеклом классической каркасной щетки', 'Black', 'Hybrid',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/3529902/560x504/71707789.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/3529902/560x504/70436785.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/3529902/560x504/70436815.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/3529902/560x504/70436797.jpg',
        600.0, 0, 70,1, 6666),
       (77777, 'Motor Oil Gigant', 'Полусинтетическое масло Gigant обеспечивает стабильную работу двигателя путем смазывания поверхностей трущихся деталей.', 'Brown', 'Gigant',
        'https://cdn.vseinstrumenti.ru/images/goods/rashodnye-materialy-i-osnastka/rashodnye-materialy-dlya-sadovoj-tehniki/1562398/560x504/52687704.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/rashodnye-materialy-i-osnastka/rashodnye-materialy-dlya-sadovoj-tehniki/1562398/560x504/52687705.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/rashodnye-materialy-i-osnastka/rashodnye-materialy-dlya-sadovoj-tehniki/1562398/560x504/53944625.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/rashodnye-materialy-i-osnastka/rashodnye-materialy-dlya-sadovoj-tehniki/1562398/560x504/53944627.jpg',
        700.0, 0, 80,1, 7777),
       (88888, 'Wheel HRE', 'Данные диски изготовлены по новой технологии "Flow Forming"', 'Black', 'HRE',
        'https://ro-sa.ru/netcat_files/multifile/2118/d93c6eab9a7e11ecb00ef4034357ec9f_002f8cf89c5011ecb00ef4034357ec9f.jpg',
        'https://ro-sa.ru/netcat_files/multifile/2118/d93c6eab9a7e11ecb00ef4034357ec9f_002f8cf99c5011ecb00ef4034357ec9f.jpg',
        'https://ro-sa.ru/netcat_files/multifile/2118/d93c6eab9a7e11ecb00ef4034357ec9f_002f8cfa9c5011ecb00ef4034357ec9f.jpg',
        'https://ro-sa.ru/netcat_files/multifile/2118/d93c6eab9a7e11ecb00ef4034357ec9f_002f8cfb9c5011ecb00ef4034357ec9f.jpg',
        800.0, 0, 90,1, 8888),
       (99999, 'Auto Fuses Airline',
        'Предохранители Airline стандарт, в пластиковой коробке с экстрактором, 180 шт., 5-35 А AFU-S-P180 – комплект предохранителей разных номиналов в пластиковой коробке',
        'Blue', 'Airline',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/1948023/560x504/68454145.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/1948023/560x504/68454151.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/1948023/560x504/68454157.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/1948023/560x504/68454163.jpg',
        900.0, 0, 100,1, 9999),
       (10101, 'Saw Ryobi', 'Сабельная пила Ryobi RRS1200-K 5133002472 подходит для грубого и быстрого реза металла, древесины, пластика.', 'Yellow', 'Ryobi',
        'https://cdn.vseinstrumenti.ru/images/goods/stroitelnyj-instrument/pily/778435/560x504/51438117.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/stroitelnyj-instrument/pily/778435/560x504/51438118.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/stroitelnyj-instrument/pily/778435/560x504/51438119.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/stroitelnyj-instrument/pily/778435/560x504/51438121.jpg',
        1000.0, 0, 110,1, 1010),
       (111111, 'First aid Kit Fest', 'Аптечка для оказания первой помощи работникам ФЭСТ, футляр 8-2 (приказ 1331н) 2313 предназначена для оказания первой помощи работникам на производственных участках и в рабочих кабинетах','White', 'Fest',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/1927539/560x504/57671954.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/1927539/560x504/57671960.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/1927539/560x504/57671966.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/1927539/560x504/57671972.jpg', 1100.0, 0, 120,1, 11111),
       (12122, 'Brushes for Truck Artway', 'Дворник бескаркасный 15"/380 мм Artway AL-380 с чистящим лезвием из высококачественной натуральной резины,', 'Black', 'Artway',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/2849690/560x504/56883818.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/2849690/560x504/56883824.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/2849690/560x504/56883830.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/2849690/560x504/56883836.jpg',
        1200.0, 0, 130,1, 12122),
       (13133, 'Coolant Felix', 'Профессиональный карбоксилатный антифриз с увеличенным ресурсом эксплуатации', 'White', 'Felix',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtohimiya/1374669/560x504/67353559.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtohimiya/1374669/560x504/65659867.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtohimiya/1374669/560x504/67353553.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtohimiya/1374669/560x504/65659861.jpg',
        1300.0, 0, 140,1, 13133),
       (14144, 'Brushes for Car DSV', 'Щетка с/о мультиадаптерная 400 мм/16" DSV R001600 отлично убирает любые типы загрязнений: дождь, снег и наледь, пыль и песок, нефтепродукты, насекомые ', 'Black', 'DSV', 'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/2872340/560x504/56954900.jpg', 'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/2872340/560x504/56954906.jpg', 'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/2872340/560x504/56954918.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/2872340/560x504/56954924.jpg', 1400.0, 0, 150,1, 6666),
       (15155, 'Brushes for Car Frame', 'Всесезонная каркасная щетка стеклоочистителя 22"/55 см (3 переходника) Goodyear FRAME GY000322 имеет специальное графитовое покрытие и уникальная форма чистящего лезвия обеспечивают великолепное удаление влаги и грязи с поверхности стекла автомобиля', 'Black', 'Frame', 'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/832771/560x504/62475942.jpg', 'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/832771/560x504/52310151.jpg', 'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/832771/560x504/52310154.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/832771/560x504/52310155.jpg', 1500.0, 0, 160,1, 6666),
       (16166, 'Battery Solite', 'Аккумуляторная батарея SOLITE 6СТ59 236х128х220 70B24L используется в качестве вспомогательного источника электроэнергии, подходит для холодного запуска двигателя, обеспечивает необходимую стартовую мощность и высокую скорость зарядки', 'Black', 'Solite', 'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/1109364/560x504/51318331.jpg', 'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/1109364/560x504/71260147.jpg', 'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/1109364/560x504/131078084.jpg',
        'https://cdn.vseinstrumenti.ru/images/goods/oborudovanie-dlya-avtoservisa-i-garazha/avtoaksessuary/1109364/560x504/131078090.jpg', 16000.0, 0, 1717,1, 3333);
--        (17, 'Product Name 17', 'Description 17', 'Colour 17', 'Brand 17', 'Image 65', 'Image 66', 'Image 67',
--         'Image 68', 1700.0, 0, 180, 5),
--        (18, 'Product Name 18', 'Description 18', 'Colour 18', 'Brand 18', 'Image 69', 'Image 70', 'Image 71',
--         'Image 72', 1800.0, 0, 190, 6);


--
-- TOC entry 3718 (class 0 OID 0)
-- Dependencies: 216
-- Name: accountant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

-- SELECT pg_catalog.setval('public.accountant_id_seq', 1, false);


--
-- TOC entry 3719 (class 0 OID 0)
-- Dependencies: 218
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 54, true);


--
-- TOC entry 3720 (class 0 OID 0)
-- Dependencies: 221
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 6, true);


--
-- TOC entry 3721 (class 0 OID 0)
-- Dependencies: 223
-- Name: factory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

-- SELECT pg_catalog.setval('public.factory_id_seq', 1, false);


--
-- TOC entry 3722 (class 0 OID 0)
-- Dependencies: 225
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_id_seq', 19, true);


--
-- TOC entry 3723 (class 0 OID 0)
-- Dependencies: 228
-- Name: order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_products_id_seq', 209, true);


--
-- TOC entry 3724 (class 0 OID 0)
-- Dependencies: 230
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 6, true);


--
-- TOC entry 3725 (class 0 OID 0)
-- Dependencies: 232
-- Name: subcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subcategory_id_seq', 7, true);


--
-- TOC entry 3726 (class 0 OID 0)
-- Dependencies: 234
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- TOC entry 3506 (class 2606 OID 83058)
-- Name: accountant accountant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.accountant
--     ADD CONSTRAINT accountant_pkey PRIMARY KEY (id);


--
-- TOC entry 3508 (class 2606 OID 83067)
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3510 (class 2606 OID 83079)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3512 (class 2606 OID 83088)
-- Name: factory factory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.factory
--     ADD CONSTRAINT factory_pkey PRIMARY KEY (id);


--
-- TOC entry 3514 (class 2606 OID 83098)
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- TOC entry 3516 (class 2606 OID 83108)
-- Name: order_products order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (id);


--
-- TOC entry 3518 (class 2606 OID 83117)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3520 (class 2606 OID 83126)
-- Name: subcategory subcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategory
    ADD CONSTRAINT subcategory_pkey PRIMARY KEY (id);


--
-- TOC entry 3522 (class 2606 OID 83137)
-- Name: users users_cart_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cart_id_key UNIQUE (cart_id);


--
-- TOC entry 3524 (class 2606 OID 83139)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3526 (class 2606 OID 83135)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3535 (class 2606 OID 83180)
-- Name: products fk1cf90etcu98x1e6n9aks3tel3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk1cf90etcu98x1e6n9aks3tel3 FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3533 (class 2606 OID 83170)
-- Name: order_products fk4xn93j6lqih2g6n01j7y5htkx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT fk4xn93j6lqih2g6n01j7y5htkx FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- TOC entry 3528 (class 2606 OID 83150)
-- Name: cart_products fk7xg877l1r2f279hmlcowu1cth; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_products
    ADD CONSTRAINT fk7xg877l1r2f279hmlcowu1cth FOREIGN KEY (products_id) REFERENCES public.products(id);


--
-- TOC entry 3527 (class 2606 OID 83140)
-- Name: accountant fkb5s61bljil1bm78y19uubasb6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.accountant
--     ADD CONSTRAINT fkb5s61bljil1bm78y19uubasb6 FOREIGN KEY (factory_id) REFERENCES public.factory(id);


--
-- TOC entry 3538 (class 2606 OID 83200)
-- Name: users fkcrnexpe5i83hs95bywleo3efe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.users
--     ADD CONSTRAINT fkcrnexpe5i83hs95bywleo3efe FOREIGN KEY (factory_id) REFERENCES public.factory(id);


--
-- TOC entry 3531 (class 2606 OID 83165)
-- Name: order-products_product fke10okyur6cdvldmcdci8ng6o9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order-products_product"
    ADD CONSTRAINT fke10okyur6cdvldmcdci8ng6o9 FOREIGN KEY (order_product_id) REFERENCES public.order_products(id);


--
-- TOC entry 3537 (class 2606 OID 83190)
-- Name: subcategory fke4hdbsmrx9bs9gpj1fh4mg0ku; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategory
    ADD CONSTRAINT fke4hdbsmrx9bs9gpj1fh4mg0ku FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3530 (class 2606 OID 83155)
-- Name: order fkh3c37jq3nrv0f2edcxk0ine72; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT fkh3c37jq3nrv0f2edcxk0ine72 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3534 (class 2606 OID 83175)
-- Name: order_products fkhva1mlxebnkr41a5n7a8l1nhg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT fkhva1mlxebnkr41a5n7a8l1nhg FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- TOC entry 3536 (class 2606 OID 83185)
-- Name: products fkiyysl9lg2lf7wrbs51epcocke; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fkiyysl9lg2lf7wrbs51epcocke FOREIGN KEY (subcategory_id) REFERENCES public.subcategory(id);


--
-- TOC entry 3529 (class 2606 OID 83145)
-- Name: cart_products fknlhjc091rdu9k5c8u9xwp280w; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_products
    ADD CONSTRAINT fknlhjc091rdu9k5c8u9xwp280w FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- TOC entry 3539 (class 2606 OID 83195)
-- Name: users fkqmifheg6lnigfifvlmpjnuny8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fkqmifheg6lnigfifvlmpjnuny8 FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- TOC entry 3532 (class 2606 OID 83160)
-- Name: order-products_product fkr5esgs4jdqs1e8t85xtamod3s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order-products_product"
    ADD CONSTRAINT fkr5esgs4jdqs1e8t85xtamod3s FOREIGN KEY (product_id) REFERENCES public.products(id);


-- Completed on 2024-05-07 22:14:40 CEST

--
-- PostgreSQL database dump complete
--


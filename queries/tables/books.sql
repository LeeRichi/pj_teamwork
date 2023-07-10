-- Table: application.books

-- DROP TABLE IF EXISTS application.books;

-- CREATE TABLE IF NOT EXISTS application.books
-- (
--     id integer NOT NULL DEFAULT nextval('application.books_id_seq'::regclass),
--     book_name character varying(50) COLLATE pg_catalog."default",
--     isbn character varying(13) COLLATE pg_catalog."default",
--     publishing_year integer,
--     description character varying(1000) COLLATE pg_catalog."default",
--     image_url character varying COLLATE pg_catalog."default",
--     borrowing_period integer,
--     quantity integer,
--     CONSTRAINT books_pkey PRIMARY KEY (id)
-- )

-- TABLESPACE pg_default;

-- ALTER TABLE IF EXISTS application.books
--     OWNER to postgres;


CREATE TABLE IF NOT EXISTS public.books
(
    id integer GENERATED ALWAYS AS IDENTITY,
    book_name character varying(50),
    isbn character varying(13),
    publishing_year integer,
    _description character varying(1000),
    image_url character varying,
    borrowing_period integer,
    quantity integer,
    CONSTRAINT books_pkey PRIMARY KEY (id)
);
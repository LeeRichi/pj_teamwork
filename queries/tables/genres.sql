-- Table: application.genres

-- DROP TABLE IF EXISTS application.genres;

-- CREATE TABLE IF NOT EXISTS application.genres
-- (
--     id integer NOT NULL DEFAULT nextval('application.genres_id_seq'::regclass),
--     genre_name character varying(30) COLLATE pg_catalog."default",
--     CONSTRAINT genres_pkey PRIMARY KEY (id)
-- )

-- TABLESPACE pg_default;

-- ALTER TABLE IF EXISTS application.genres
--     OWNER to admin;


CREATE TABLE IF NOT EXISTS public.genres
(
    id integer NOT NULL,
    genre_name character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT genres_pkey PRIMARY KEY (id)
)

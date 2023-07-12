CREATE TABLE IF NOT EXISTS public.genres
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    genre_name character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT genres_pkey PRIMARY KEY (id)
);
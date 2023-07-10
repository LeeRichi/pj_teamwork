CREATE TABLE IF NOT EXISTS public.authors
(
    id integer NOT NULL,
    author_name character varying(30), 
    CONSTRAINT authors_pkey PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS public.authors
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    author_name character varying(30), 
    CONSTRAINT authors_pkey PRIMARY KEY (id)
);


-- ALTER TABLE public.authors
-- ALTER COLUMN id SET DATA TYPE integer,
-- ALTER COLUMN id SET NOT NULL,
-- ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

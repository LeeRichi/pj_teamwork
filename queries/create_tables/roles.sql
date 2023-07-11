ALTER TABLE public.roles
ALTER COLUMN id integer GENERATED ALWAYS AS IDENTITY;

CREATE TABLE IF NOT EXISTS public.roles
(
    id integer GENERATED ALWAYS AS IDENTITY,
    name character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT roles_pkey PRIMARY KEY (id)
)
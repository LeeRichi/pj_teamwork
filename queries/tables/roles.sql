-- Table: application.roles

-- DROP TABLE IF EXISTS application.roles;

-- CREATE TABLE IF NOT EXISTS application.roles
-- (
--     id integer NOT NULL DEFAULT nextval('application.roles_id_seq'::regclass),
--     name character varying(30) COLLATE pg_catalog."default",
--     CONSTRAINT roles_pkey PRIMARY KEY (id)
-- )

-- TABLESPACE pg_default;

-- ALTER TABLE IF EXISTS application.roles
--     OWNER to admin;



CREATE TABLE IF NOT EXISTS public.roles
(
    id integer NOT NULL,
    name character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT roles_pkey PRIMARY KEY (id)
)
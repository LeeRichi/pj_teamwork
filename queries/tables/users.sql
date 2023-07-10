-- Table: application.users

-- DROP TABLE IF EXISTS application.users;

-- CREATE TABLE IF NOT EXISTS application.users
-- (
--     id integer NOT NULL DEFAULT nextval('application.users_id_seq'::regclass),
--     first_name character varying(30) COLLATE pg_catalog."default",
--     last_name character varying(30) COLLATE pg_catalog."default",
--     email character varying(50) COLLATE pg_catalog."default",
--     password character varying(50) COLLATE pg_catalog."default",
--     role integer,
--     CONSTRAINT users_pkey PRIMARY KEY (id),
--     CONSTRAINT role FOREIGN KEY (role)
--         REFERENCES application.roles (id) MATCH SIMPLE
--         ON UPDATE NO ACTION
--         ON DELETE NO ACTION
--         NOT VALID
-- )

-- TABLESPACE pg_default;

-- ALTER TABLE IF EXISTS application.users
--     OWNER to admin;


CREATE TABLE IF NOT EXISTS public.users
(
    id integer GENERATED ALWAYS AS IDENTITY,
    first_name character varying(30) COLLATE pg_catalog."default",
    last_name character varying(30) COLLATE pg_catalog."default",
    email character varying(50) COLLATE pg_catalog."default",
    password character varying(50) COLLATE pg_catalog."default",
    role integer,
    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT role FOREIGN KEY (role)
        REFERENCES public.roles (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

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
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
);

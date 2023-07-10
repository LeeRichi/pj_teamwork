-- Table: application.reviews

-- DROP TABLE IF EXISTS application.reviews;

-- CREATE TABLE IF NOT EXISTS application.reviews
-- (
--     id integer NOT NULL DEFAULT nextval('application.reviews_id_seq'::regclass),
--     comment character varying COLLATE pg_catalog."default",
--     rating smallint,
--     book_id integer,
--     user_id integer,
--     CONSTRAINT reviews_pkey PRIMARY KEY (id),
--     CONSTRAINT book_id FOREIGN KEY (book_id)
--         REFERENCES application.books (id) MATCH SIMPLE
--         ON UPDATE NO ACTION
--         ON DELETE NO ACTION
--         NOT VALID,
--     CONSTRAINT user_id FOREIGN KEY (user_id)
--         REFERENCES application.users (id) MATCH SIMPLE
--         ON UPDATE NO ACTION
--         ON DELETE NO ACTION
--         NOT VALID
-- )

-- TABLESPACE pg_default;

-- ALTER TABLE IF EXISTS application.reviews
--     OWNER to admin;



CREATE TABLE IF NOT EXISTS public.reviews
(
    id integer NOT NULL,
    comment character varying COLLATE pg_catalog."default",
    rating smallint,
    book_id integer,
    user_id integer,
    CONSTRAINT reviews_pkey PRIMARY KEY (id),
    CONSTRAINT book_id FOREIGN KEY (book_id)
        REFERENCES public.books (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
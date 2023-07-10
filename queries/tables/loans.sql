-- Table: application.loans

-- DROP TABLE IF EXISTS application.loans;

CREATE TABLE IF NOT EXISTS application.loans
(
    id integer NOT NULL DEFAULT nextval('application.loans_id_seq'::regclass),
    borrowed_date date,
    returned_date date,
    due_date date,
    book_id integer,
    user_id integer,
    CONSTRAINT loans_pkey PRIMARY KEY (id),
    CONSTRAINT book_id FOREIGN KEY (book_id)
        REFERENCES application.books (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES application.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS application.loans
    OWNER to admin;



CREATE TABLE IF NOT EXISTS public.loans
(
    id integer GENERATED ALWAYS AS IDENTITY,
    borrowed_date date,
    returned_date date,
    due_date date,
    book_id integer,
    user_id integer,
    CONSTRAINT loans_pkey PRIMARY KEY (id),
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
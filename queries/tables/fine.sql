-- Table: application.fine

-- DROP TABLE IF EXISTS application.fine;

CREATE TABLE IF NOT EXISTS application.fine
(
    id integer NOT NULL DEFAULT nextval('application.fine_id_seq'::regclass),
    "created_date " date,
    due_date date,
    payment_date date,
    balance numeric(5,2)[],
    loan_id integer,
    CONSTRAINT fine_pkey PRIMARY KEY (id),
    CONSTRAINT loan_id FOREIGN KEY (loan_id)
        REFERENCES application.loans (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS application.fine
    OWNER to admin;


CREATE TABLE IF NOT EXISTS public.fine
(
    id integer GENERATED ALWAYS AS IDENTITY,
    created_date date,
    due_date date,
    payment_date date,
    balance numeric(5,2)[],
    loan_id integer,
    CONSTRAINT fine_pkey PRIMARY KEY (id),
    CONSTRAINT loan_id FOREIGN KEY (loan_id)
        REFERENCES public.loans (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

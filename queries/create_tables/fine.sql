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
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
);

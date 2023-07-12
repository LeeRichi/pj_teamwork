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
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
);
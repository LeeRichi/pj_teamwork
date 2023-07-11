CREATE TABLE IF NOT EXISTS public.reviews
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    comment character varying COLLATE pg_catalog."default",
    rating smallint,
    book_id integer,
    user_id integer,
    CONSTRAINT reviews_pkey PRIMARY KEY (id),
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
)
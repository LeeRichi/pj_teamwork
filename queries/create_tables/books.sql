CREATE TABLE IF NOT EXISTS public.books
(
    id integer GENERATED ALWAYS AS IDENTITY,
    book_name character varying(50),
    isbn character varying(13),
    publishing_year integer,
    _description character varying(1000),
    image_url character varying,
    borrowing_period integer,
    quantity integer,
    CONSTRAINT books_pkey PRIMARY KEY (id)
);
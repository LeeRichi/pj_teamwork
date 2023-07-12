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

CREATE TABLE IF NOT EXISTS public.genres
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    genre_name character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT genres_pkey PRIMARY KEY (id)
);

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
);

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

ALTER TABLE public.roles
ALTER COLUMN id integer GENERATED ALWAYS AS IDENTITY;

CREATE TABLE IF NOT EXISTS public.roles
(
    id integer GENERATED ALWAYS AS IDENTITY,
    name character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT roles_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.book_genre
(
    book_id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    genre_id integer,
    CONSTRAINT book_id FOREIGN KEY (book_id)
        REFERENCES public.books (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT genre_id FOREIGN KEY (genre_id)
        REFERENCES public.genres (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
);

CREATE TABLE IF NOT EXISTS public.book_author
(
    book_id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    author_id integer,
    CONSTRAINT author_id FOREIGN KEY (author_id)
        REFERENCES public.authors (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT book_id FOREIGN KEY (book_id)
        REFERENCES public.books (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.authors
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    author_name character varying(30), 
    CONSTRAINT authors_pkey PRIMARY KEY (id)
);





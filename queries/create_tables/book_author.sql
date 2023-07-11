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

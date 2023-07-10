CREATE TABLE IF NOT EXISTS public.book_genre
(
    book_id integer,
    genre_id integer,
    CONSTRAINT book_id FOREIGN KEY (book_id)
        REFERENCES public.books (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT genre_id FOREIGN KEY (genre_id)
        REFERENCES public.genres (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
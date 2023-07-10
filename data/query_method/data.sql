-- read this line first 
-- you can replace 'appliction' to your own schema name

INSERT INTO application.books (book_name, isbn, publishing_year, description, image_url, borrowing_period, quantity)
VALUES 
    ('Book 1', '9781234567890', 2022, 'Description of Book 1', 'https://example.com/book1.jpg', 14, 5),
    ('Book 2', '9780987654321', 2020, 'Description of Book 2', 'https://example.com/book2.jpg', 21, 3),
    ('Book 3', '9785678901234', 2019, 'Description of Book 3', 'https://example.com/book3.jpg', 7, 10),
    ('Book 4', '9780123456789', 2021, 'Description of Book 4', 'https://example.com/book4.jpg', 14, 2),
    ('Book 5', '9785432109876', 2018, 'Description of Book 5', 'https://example.com/book5.jpg', 30, 8);


INSERT INTO application.users (first_name, last_name, email, password, role)
VALUES 
    ('John', 'Doe', 'johndoe@example.com', 'pass123', 1),
    ('Jane', 'Smith', 'janesmith@example.com', 'pass456', 2),
    ('Alice', 'Johnson', 'alicejohnson@example.com', 'pass789', 2),
    ('Bob', 'Williams', 'bobwilliams@example.com', 'pass321', 3);

INSERT INTO application.roles (id, name)
VALUES 
    (1, 'Admin'),
    (2, 'Member'),
    (3, 'Guest');


INSERT INTO application.fine (created_date, due_date, payment_date, balance, loan_id)
VALUES 
    ('2022-07-01', '2022-07-15', '2022-07-16', ARRAY[25.00], 1),
    ('2022-08-01', '2022-08-10', '2022-08-12', ARRAY[15.50], 2),
    ('2022-09-01', '2022-09-05', NULL, ARRAY[10.00], 3);


INSERT INTO application.loans (borrowed_date, returned_date, due_date, book_id, user_id)
VALUES 
    ('2022-07-01', '2022-07-10', '2022-07-15', 1, 1),
    ('2022-08-01', '2022-08-08', '2022-08-10', 2, 2),
    ('2022-09-01', '2022-09-04', '2022-09-05', 3, 3);


INSERT INTO application.authors (id, author_name)
VALUES 
    (1, 'Jennifer Adams'),
    (2, 'Benjamin Martin'),
    (3, 'Emily Thompson'),
    (4, 'Samuel Davis');

INSERT INTO application.book_author (book_id, author_id)
VALUES 
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 2),
    (3, 4);


INSERT INTO application.genres (id, genre_name)
VALUES 
    (1, 'Fiction'),
    (2, 'Romance'),
    (3, 'Mystery'),
    (4, 'Science Fiction');

INSERT INTO application.book_genre (book_id, genre_id)
VALUES 
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 2),
    (3, 4);


INSERT INTO application.reviews (id, comment, rating, book_id, user_id)
VALUES 
    (1, 'Great book!', 5, 1, 1),
    (2, 'Enjoyed reading it.', 4, 2, 2),
    (3, 'Could have been better.', 3, 3, 1),
    (4, 'Highly recommended!', 5, 1, 3);
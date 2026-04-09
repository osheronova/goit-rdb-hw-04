INSERT INTO authors (author_name) VALUES
('Тарас Шевченко'),
('Ліна Костенко');

INSERT INTO genres (genre_name) VALUES
('Поезія'),
('Роман');

INSERT INTO books (title, publication_year, author_id, genre_id) VALUES
('Тіні забутих предків', 1911, 1, 1),
('Маруся Чурай', 1979, 2, 2);

INSERT INTO users (username, email) VALUES
('ivan_petrenko', 'ivan@example.com'),
('olena_koval', 'olena@example.com');

INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) VALUES
(1, 1, '2024-01-15', '2024-02-15'),
(2, 2, '2024-03-01', NULL);
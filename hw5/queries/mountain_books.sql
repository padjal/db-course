SELECT isbn
FROM books JOIN stores on books.isbn = stores.book_isbn
WHERE category_name = 'Горы' AND isbn NOT IN (
    SELECT isbn
    FROM books JOIN stores on books.isbn = stores.book_isbn
    WHERE category_name = 'Путешествия'
    );


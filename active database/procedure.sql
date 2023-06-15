-- 1) Procedure: Menampilkan detail film berdasarkan ID
CREATE OR REPLACE PROCEDURE GetMovieDetails(
    IN movie_id INT
)
AS $$
DECLARE
    movie_record movie%ROWTYPE;
BEGIN
    SELECT * INTO movie_record FROM movie WHERE id = movie_id;
    
    IF FOUND THEN
        RAISE NOTICE 'Movie Details: %', movie_record;
    ELSE
        RAISE NOTICE 'Movie not found with ID: %', movie_id;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Pemanggilan prosedur GetMovieDetails
CALL GetMovieDetails(1);

--2) Procedure: Menampilkan daftar film yang dirilis dalam rentang tanggal tertentu
CREATE OR REPLACE PROCEDURE GetMoviesByYearRange(
    IN start_year DATE,
    IN end_year DATE
)
AS $$
DECLARE
    movie_record movie%ROWTYPE;
BEGIN
    FOR movie_record IN SELECT * FROM movie WHERE tahun_rilis BETWEEN start_year AND end_year LOOP
        RAISE NOTICE 'Movie: %', movie_record;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

CALL GetMoviesByYearRange(DATE '2000-01-01', DATE '2022-12-31');

-- 3) Procedure: Menampilkan daftar film berdasarkan genre
CREATE OR REPLACE PROCEDURE GetMoviesByGenre(
    IN genre_name VARCHAR(50)
)
AS $$
DECLARE
    movie_title movie.nama%TYPE;
BEGIN
    FOR movie_title IN
        SELECT m.nama
        FROM movie m
        INNER JOIN genre g ON m.genre_id = g.id
        WHERE g.nama = genre_name
    LOOP
        RAISE NOTICE 'Judul Film: %', movie_title;
    END LOOP;

    IF NOT FOUND THEN
        RAISE NOTICE 'Tidak ada film dengan genre %', genre_name;
    END IF;
END;
$$ LANGUAGE plpgsql;

CALL GetMoviesByGenre('Action');


--  4) Procedure: Menampilkan daftar film yang mendapat rating tertinggi
CREATE OR REPLACE PROCEDURE GetTopRatedMovies()
AS $$
DECLARE
    movie_name movie.nama%TYPE;
    movie_rating user_rating.rating%TYPE;
BEGIN
    SELECT m.nama, u.rating
    INTO movie_name, movie_rating
    FROM movie m
    INNER JOIN user_rating u ON m.id = u.movie_id
    WHERE u.rating = (SELECT MAX(rating) FROM user_rating)
    ORDER BY u.rating DESC;

    RAISE NOTICE 'Movie dengan rating tertinggi: % dengan rating: %', movie_name, movie_rating;
END;
$$ LANGUAGE plpgsql;

CALL GetTopRatedMovies();

-- 5) Procedure: Menampilkan daftar film yang memiliki jumlah bookmark tertinggi
CREATE OR REPLACE PROCEDURE GetPopularMoviesByBookmark()
AS $$
DECLARE
    movie_name movie.nama%TYPE;
    bookmark_count INT;
BEGIN
    SELECT m.nama, COUNT(b.movie_id)
    INTO movie_name, bookmark_count
    FROM movie m
    INNER JOIN bookmark b ON m.id = b.movie_id
    GROUP BY m.nama
    ORDER BY COUNT(b.movie_id) DESC
    LIMIT 1;

    RAISE NOTICE 'Film dengan jumlah bookmark tertinggi: % dengan jumlah bookmark: %', movie_name, bookmark_count;
END;
$$ LANGUAGE plpgsql;

-- Contoh pemanggilan prosedur
CALL GetPopularMoviesByBookmark();


-- 6) Procedure: Menampilkan daftar film yang memiliki jumlah like tertinggi
CREATE OR REPLACE PROCEDURE GetPopularMoviesByLikes()
AS $$
DECLARE
    movie_name movie.nama%TYPE;
    like_count INT;
BEGIN
    SELECT m.nama, COUNT(l.movie_id)
    INTO movie_name, like_count
    FROM movie m
    INNER JOIN likes l ON m.id = l.movie_id
    GROUP BY m.nama
    ORDER BY COUNT(l.movie_id) DESC
    LIMIT 1;

    RAISE NOTICE 'Film dengan jumlah like tertinggi: % dengan jumlah like: %', movie_name, like_count;
END;
$$ LANGUAGE plpgsql;

CALL GetPopularMoviesByLikes();


-- 7) Procedure: Menampilkan daftar film yang memiliki jumlah komentar tertinggi
CREATE OR REPLACE PROCEDURE GetMoviesByHighestCommentCount()
AS $$
DECLARE
    movie_name movie.nama%TYPE;
    comment_count INT;
BEGIN
    SELECT m.nama, COUNT(c.movie_id)
    INTO movie_name, comment_count
    FROM movie m
    INNER JOIN comment c ON m.id = c.movie_id
    GROUP BY m.nama
    ORDER BY COUNT(c.movie_id) DESC
    LIMIT 1;

    RAISE NOTICE 'Film dengan jumlah komentar tertinggi: % dengan jumlah komentar: %', movie_name, comment_count;
END;
$$ LANGUAGE plpgsql;

CALL GetMoviesByHighestCommentCount();

-- 8) Procedure: Menampilkan daftar film yang direkomendasikan berdasarkan rating dan jumlah rating
--Prosedur ini akan mencari film-film yang memiliki setidaknya 3 rating,
--kemudian akan mengurutkannya berdasarkan rating rata-rata tertinggi dan jumlah rating tertinggi, 
--serta membatasi hasilnya hingga 5 film teratas.

CREATE OR REPLACE PROCEDURE GetRecommendedMoviesByRatingAndCount()
AS $$
DECLARE
    movie_name movie.nama%TYPE;
    avg_rating FLOAT;
    rating_count INT;
    movie_cursor CURSOR FOR
        SELECT m.nama, AVG(ur.rating), COUNT(ur.rating)
        FROM movie m
        INNER JOIN user_rating ur ON m.id = ur.movie_id
        GROUP BY m.nama
        HAVING COUNT(ur.rating) >= 3 -- Ambil film dengan setidaknya 3 rating
        ORDER BY AVG(ur.rating) DESC, COUNT(ur.rating) DESC
        LIMIT 5; -- Ambil 5 film teratas
BEGIN
    RAISE NOTICE 'Daftar film yang direkomendasikan:';
    RAISE NOTICE '-----------------------------------';
    
    OPEN movie_cursor;
    LOOP
        FETCH movie_cursor INTO movie_name, avg_rating, rating_count;
        EXIT WHEN NOT FOUND;
        
        RAISE NOTICE 'Film: %, Rating Rata-rata: %, Jumlah Rating: %', movie_name, avg_rating, rating_count;
    END LOOP;
    
    CLOSE movie_cursor;
END;
$$ LANGUAGE plpgsql;


CALL GetRecommendedMoviesByRatingAndCount();

--9) Procedure: Menampilkan daftar film berdasarkan kata kunci pencarian
CREATE OR REPLACE PROCEDURE SearchMoviesByKeyword(
    IN search_keyword VARCHAR(100)
)
AS $$
DECLARE
    movie_name movie.nama%TYPE;
BEGIN
    RAISE NOTICE 'Hasil Pencarian Film untuk Kata Kunci: %', search_keyword;
    RAISE NOTICE '---------------------------------------';

    FOR movie_name IN
        SELECT nama
        FROM movie
        WHERE LOWER(nama) LIKE '%' || LOWER(search_keyword) || '%'
    LOOP
        RAISE NOTICE 'Film: %', movie_name;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

CALL SearchMoviesByKeyword('Fast');




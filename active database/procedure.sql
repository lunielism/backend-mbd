-- 1. Procedure: Menampilkan detail film berdasarkan ID
CREATE OR REPLACE PROCEDURE GetMovieDetails(
    IN movie_id INT
)
AS $$
BEGIN
    SELECT * FROM movie WHERE id = movie_id;
END;
$$ LANGUAGE plpgsql;


-- 2. Procedure: Menampilkan daftar film yang dirilis dalam rentang tahun tertentu
CREATE OR REPLACE PROCEDURE GetMoviesByYearRange(
    IN start_year INT,
    IN end_year INT
)
AS $$
BEGIN
    SELECT * FROM movie WHERE tahun_rilis BETWEEN start_year AND end_year;
END;
$$ LANGUAGE plpgsql;


-- 3. Procedure: Menampilkan daftar film berdasarkan genre
CREATE OR REPLACE PROCEDURE GetMoviesByGenre(
    IN genre_name VARCHAR(50)
)
AS $$
BEGIN
    SELECT * FROM movie m INNER JOIN genre g ON m.genre_id = g.id WHERE g.nama = genre_name;
END;
$$ LANGUAGE plpgsql;


-- 4. Procedure: Menampilkan daftar film yang mendapat rating tertinggi
CREATE OR REPLACE PROCEDURE GetTopRatedMovies(
    OUT movie_count INT,
    OUT avg_rating NUMERIC
)
AS $$
BEGIN
    SELECT COUNT(*) INTO movie_count FROM movie;
    SELECT AVG(rating) INTO avg_rating FROM user_rating;
END;
$$ LANGUAGE plpgsql;


-- 5. Procedure: Menampilkan daftar film yang memiliki jumlah bookmark tertinggi
CREATE OR REPLACE PROCEDURE GetPopularMoviesByBookmark(
    OUT movie_count INT
)
AS $$
BEGIN
    SELECT COUNT(*) INTO movie_count FROM bookmark GROUP BY movie_id ORDER BY COUNT(*) DESC;
END;
$$ LANGUAGE plpgsql;


-- 6. Procedure: Menampilkan daftar film yang memiliki jumlah like tertinggi
CREATE OR REPLACE PROCEDURE GetPopularMoviesByLike(
    OUT movie_count INT
)
AS $$
BEGIN
    SELECT COUNT(*) INTO movie_count FROM likes WHERE like_status = 'like' GROUP BY movie_id ORDER BY COUNT(*) DESC;
END;
$$ LANGUAGE plpgsql;


-- 7. Procedure: Menampilkan daftar film yang memiliki jumlah dislike tertinggi
CREATE OR REPLACE PROCEDURE GetPopularMoviesByDislike(
    OUT movie_count INT
)
AS $$
BEGIN
    SELECT COUNT(*) INTO movie_count FROM likes WHERE like_status = 'dislike' GROUP BY movie_id ORDER BY COUNT(*) DESC;
END;
$$ LANGUAGE plpgsql;


-- 8. Procedure: Menampilkan daftar film yang memiliki jumlah komentar tertinggi
CREATE OR REPLACE PROCEDURE GetPopularMoviesByComment(
    OUT movie_count INT
)
AS $$
BEGIN
    SELECT COUNT(*) INTO movie_count FROM comment GROUP BY movie_id ORDER BY COUNT(*) DESC;
END;
$$ LANGUAGE plpgsql;


-- 9. Procedure: Menampilkan daftar film yang direkomendasikan berdasarkan rating dan jumlah rating
CREATE OR REPLACE PROCEDURE GetRecommendedMovies(
    IN min_rating NUMERIC,
    IN min_rating_count INT
)
AS $$
BEGIN
    SELECT * FROM movie WHERE id IN (
        SELECT movie_id FROM user_rating 
        GROUP BY movie_id 
        HAVING AVG(rating) >= min_rating AND COUNT(*) >= min_rating_count
    );
END;
$$ LANGUAGE plpgsql;


-- 10. Procedure: Menampilkan daftar film berdasarkan kata kunci pencarian
CREATE OR REPLACE PROCEDURE SearchMovies(
    IN keyword VARCHAR(100)
)
AS $$
BEGIN
    SELECT * FROM movie WHERE nama ILIKE '%' || keyword || '%' OR deskripsi ILIKE '%' || keyword || '%';
END;
$$ LANGUAGE plpgsql;

-- Pemanggilan prosedur GetMovieDetails
CALL GetMovieDetails(1);

-- Pemanggilan prosedur GetMoviesByYearRange
CALL GetMoviesByYearRange(2000, 2020);

-- Pemanggilan prosedur GetMoviesByGenre
CALL GetMoviesByGenre('Action');

-- Pemanggilan prosedur GetTopRatedMovies
CALL GetTopRatedMovies(OUT movie_count, OUT avg_rating);

-- Pemanggilan prosedur GetPopularMoviesByBookmark
CALL GetPopularMoviesByBookmark(OUT movie_count);

-- Pemanggilan prosedur GetPopularMoviesByLike
CALL GetPopularMoviesByLike(OUT movie_count);

-- Pemanggilan prosedur GetPopularMoviesByDislike
CALL GetPopularMoviesByDislike(OUT movie_count);

-- Pemanggilan prosedur GetPopularMoviesByComment
CALL GetPopularMoviesByComment(OUT movie_count);

-- Pemanggilan prosedur GetRecommendedMovies
CALL GetRecommendedMovies(4.0, 10);

-- Pemanggilan prosedur SearchMovies
CALL SearchMovies('action');


--index utama yang dipilih: id, genre, rating_umur_id, movie_status
--index sisanya: contoh


-- indeks pada kolom 'id'
CREATE INDEX idx_movie_id ON movie (id);
SELECT * FROM movie WHERE id = 50;

-- Indeks pada kolom 'nama'
CREATE INDEX idx_movie_judul ON movie (nama);

-- Indeks pada kolom 'tahun_rilis'
CREATE INDEX idx_movie_tahun_rilis ON movie (tahun_rilis);

--  Indeks pada kolom 'genre'
CREATE INDEX idx_movie_genre_id ON movie (genre_id);

-- Indeks pada kolom rating_umur_id di tabel movie:
CREATE INDEX idx_movie_rating_umur_id ON movie (rating_umur_id);

-- Indeks pada kolom movie_status_id di tabel movie:
CREATE INDEX idx_movie_movie_status_id ON movie (movie_status_id);

-- Menambahkan indeks pada tabel movie berdasarkan kolom genre_id
CREATE INDEX idx_movie_genre ON movie (genre_id);

--melihat index yang ada pada tabel movie
SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'movie';


--statistik indeks movie

SELECT * FROM pg_stat_all_indexes WHERE relname = 'movie';

-- Indeks pada kolom 'rating_umur_id'
SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'movie' AND indexname = 'idx_movie_rating_umur_id';

-- Indeks pada kolom 'movie_status_id'
SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'movie' AND indexname = 'idx_movie_movie_status_id';

-- Indeks pada kolom 'genre_id'
SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'movie' AND indexname = 'idx_movie_genre';


-- Menambahkan indeks pada tabel user_rating berdasarkan kolom movie_id
CREATE INDEX idx_user_rating_movie ON user_rating (movie_id);

-- Menambahkan indeks pada tabel comment berdasarkan kolom movie_id dan users_id
CREATE INDEX idx_comment_movie_users ON comment (movie_id, users_id);

-- Menambahkan indeks pada tabel subscription berdasarkan kolom users_id
CREATE INDEX idx_subscription_users ON subscription (users_id);

-- Menambahkan indeks pada tabel payment berdasarkan kolom subscription_id
CREATE INDEX idx_payment_subscription ON payment (subscription_id);


--1. View: `view_movie_list`
--Deskripsi: Menampilkan daftar film beserta informasi tahun rilis, genre, dan rating umur.

SELECT movie.id, movie.nama, movie.tahun_rilis, genre.nama AS genre, rating_umur.rate AS rating_umur
FROM movie
JOIN genre ON movie.genre_id = genre.id
JOIN rating_umur ON movie.rating_umur_id = rating_umur.id;


--2. View: `view_user_ratings`
--Deskripsi: Menampilkan rating yang diberikan oleh pengguna untuk setiap film.

SELECT user_rating.id, users.nama AS user_nama, movie.nama AS movie_nama, user_rating.rating
FROM user_rating
JOIN users ON user_rating.users_id = users.id
JOIN movie ON user_rating.movie_id = movie.id;


--3. View: `view_bookmarked_movies`
--Deskripsi: Menampilkan daftar film yang ditandai sebagai bookmark oleh pengguna.

SELECT bookmark.id, users.nama AS user_nama, movie.nama AS movie_nama, bookmark.waktu_bookmark
FROM bookmark
JOIN users ON bookmark.users_id = users.id
JOIN movie ON bookmark.movie_id = movie.id;


--4. View: `view_liked_movies`
--Deskripsi: Menampilkan daftar film yang disukai oleh pengguna.

SELECT likes.id, users.nama AS user_nama, movie.nama AS movie_nama, likes.like_status
FROM likes
JOIN users ON likes.users_id = users.id
JOIN movie ON likes.movie_id = movie.id;


--5. View: `view_comments`
--Deskripsi: Menampilkan komentar yang diberikan oleh pengguna untuk setiap film.

SELECT comment.id, users.nama AS user_nama, movie.nama AS movie_nama, comment.message, comment.waktu_comment
FROM comment
JOIN users ON comment.users_id = users.id
JOIN movie ON comment.movie_id = movie.id;


--6. View: `view_subscriptions`
--Deskripsi: Menampilkan informasi langganan pengguna.

SELECT subscription.id, users.nama AS user_nama, subscription.start_date, subscription.end_date, subscription.status
FROM subscription
JOIN users ON subscription.users_id = users.id;


--7. View: `view_payments`
--Deskripsi: Menampilkan informasi pembayaran dan metode pembayaran pengguna.

SELECT payment.id, subscription.id AS subscription_id, users.nama AS user_nama, payment.payment_date, payment.total, payment.status, payment_method.method AS payment_method
FROM payment
JOIN subscription ON payment.subscription_id = subscription.id
JOIN users ON subscription.users_id = users.id
JOIN payment_method ON payment.payment_method_id = payment_method.id;


--8. View: `view_movies_with_ratings`
--Deskripsi: Menampilkan daftar film beserta informasi genre, rating umur, dan rata-rata rating dari pengguna.

SELECT movie.id, movie.nama, movie.tahun_rilis, genre.nama AS genre, rating_umur.rate AS rating_umur, AVG(user_rating.rating) AS avg_rating
FROM movie
JOIN genre ON movie.genre_id = genre.id
JOIN rating_umur ON movie.rating_umur_id = rating_umur.id
LEFT JOIN user_rating ON movie.id = user_rating.movie_id
GROUP BY movie.id;


--9. View: `view_popular_movies`
--Deskripsi: Menampilkan daftar film berdasarkan popularitasnya berdasarkan jumlah rating yang diberikan oleh pengguna.

SELECT movie.id, movie.nama, movie.tahun_rilis, genre.nama AS genre, rating_umur.rate AS rating_umur, COUNT(user_rating.rating) AS total_ratings
FROM movie
JOIN genre ON movie.genre_id = genre.id
JOIN rating_umur ON movie.rating_umur_id = rating_umur.id
LEFT JOIN user_rating ON movie.id = user_rating.movie_id
GROUP BY movie.id
ORDER BY total_ratings DESC;


--10. View: `view_active_users`
--Deskripsi: Menampilkan daftar pengguna aktif.

SELECT users.id, users.nama, users.email
FROM users
JOIN subscription ON users.id = subscription.users_id
WHERE subscription.status = true;



--11. View: `view_recently_released_movies`
--Deskripsi: Menampilkan daftar film yang dirilis dalam 30 hari terakhir.

SELECT movie.id, movie.nama, movie.tahun_rilis, genre.nama AS genre, rating_umur.rate AS rating_umur
FROM movie
JOIN genre ON movie.genre_id = genre.id
JOIN rating_umur ON movie.rating_umur_id = rating_umur.id
WHERE movie.tahun_rilis >= CURRENT_DATE - INTERVAL '30 days';


--12. View: `view_top_rated_movies`
--Deskripsi: Menampilkan daftar film berdasarkan rating tertinggi dari pengguna.

SELECT movie.id, movie.nama, movie.tahun_rilis, genre.nama AS genre, rating_umur.rate AS rating_umur, AVG(user_rating.rating) AS avg_rating
FROM movie
JOIN genre ON movie.genre_id = genre.id
JOIN rating_umur ON movie.rating_umur_id = rating_umur.id
JOIN user_rating ON movie.id = user_rating.movie_id
GROUP BY movie.id, movie.nama, movie.tahun_rilis, genre.nama, rating_umur.rate
ORDER BY avg_rating DESC;



--13. View: `view_user_bookmarks`
--Deskripsi: Menampilkan daftar film yang ditandai sebagai bookmark oleh pengguna tertentu.

SELECT bookmark.id, users.nama AS user_nama, movie.nama AS movie_nama, bookmark.waktu_bookmark
FROM bookmark
JOIN users ON bookmark.users_id = users.id
JOIN movie ON bookmark.movie_id = movie.id
WHERE users.id = 2;

--Gantilah `<user_id>` dengan ID pengguna yang ingin Anda periksa.

--14. View: `view_user_ratings_count`
--Deskripsi: Menampilkan jumlah rating yang diberikan oleh pengguna tertentu untuk setiap film.

SELECT users.nama AS user_nama, movie.nama AS movie_nama, COUNT(user_rating.rating) AS rating_count
FROM user_rating
JOIN users ON user_rating.users_id = users.id
JOIN movie ON user_rating.movie_id = movie.id
WHERE users.id = 2
GROUP BY users.nama, movie.nama;

--Gantilah `<user_id>` dengan ID pengguna yang ingin Anda periksa.

--15. View: `view_highly_rated_movies`
--Deskripsi: Menampilkan daftar film yang memiliki rating rata-rata lebih tinggi dari 4.

SELECT movie.id, movie.nama, movie.tahun_rilis, genre.nama AS genre, rating_umur.rate AS rating_umur, AVG(user_rating.rating) AS avg_rating
FROM movie
JOIN genre ON movie.genre_id = genre.id
JOIN rating_umur ON movie.rating_umur_id = rating_umur.id
JOIN user_rating ON movie.id = user_rating.movie_id
GROUP BY movie.id, movie.nama, movie.tahun_rilis, genre.nama, rating_umur.rate
HAVING AVG(user_rating.rating) > 4;


--16. View: `view_active_subscriptions`
--Deskripsi: Menampilkan daftar langganan aktif beserta informasi pengguna.

SELECT subscription.id, users.nama AS user_nama, subscription.start_date, subscription.end_date
FROM subscription
JOIN users ON subscription.users_id = users.id
WHERE subscription.status = true;


--17. View: `view_monthly_payments`
--Deskripsi: Menampilkan pembayaran bulanan pengguna beserta metode pembayaran.

SELECT payment.id, subscription.id AS subscription_id, users.nama AS user_nama, payment.payment_date, payment.total, payment_method.method AS payment_method
FROM payment
JOIN subscription ON payment.subscription_id = subscription.id
JOIN users ON subscription.users_id = users.id
JOIN payment_method ON
payment.payment_method_id = payment_method.id
WHERE payment.payment_date >= CURRENT_DATE - INTERVAL '30 days';


--18. View: `view_recent_comments`
--Deskripsi: Menampilkan komentar terbaru untuk setiap film.

SELECT comment.id, users.nama AS user_nama, movie.nama AS movie_nama, comment.message, comment.waktu_comment
FROM comment
JOIN users ON comment.users_id = users.id
JOIN movie ON comment.movie_id = movie.id
ORDER BY comment.waktu_comment DESC;


--19. View: `view_genre_statistics`
--Deskripsi: Menampilkan statistik genre film, termasuk jumlah film dalam setiap genre.

SELECT genre.nama AS genre, COUNT(movie.id) AS jumlah_film
FROM genre
LEFT JOIN movie ON genre.id = movie.genre_id
GROUP BY genre.nama;


--20. View: `view_user_activity`
--Deskripsi: Menampilkan aktivitas pengguna, termasuk jumlah rating, bookmark, dan komentar yang mereka berikan.

SELECT users.id, users.nama AS user_nama, COUNT(DISTINCT user_rating.id) AS total_rating, COUNT(DISTINCT bookmark.id) AS total_bookmark, COUNT(DISTINCT comment.id) AS total_comment
FROM users
LEFT JOIN user_rating ON users.id = user_rating.users_id
LEFT JOIN bookmark ON users.id = bookmark.users_id
LEFT JOIN comment ON users.id = comment.users_id
GROUP BY users.id, users.nama;

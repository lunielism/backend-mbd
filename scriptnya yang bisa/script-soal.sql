--1) Tampilkan daftar film berbayar bergenre horror yang memiliki durasi di atas 120 menit. 
SELECT m.nama AS movie_name, g.nama AS genre, ms.jenis AS movie_status
FROM movie m
JOIN genre g ON m.genre_id = g.id
JOIN movie_status ms ON m.movie_status_id = ms.id
WHERE EXTRACT(EPOCH FROM m.durasi) > 7200 -- 7200 detik = 120 menit
  AND g.nama = 'Horror'
  AND ms.jenis = 'Paid';

--2) Tampilkan nama dan genre film gratis yang diproduksi oleh Warner Bros. Pictures
SELECT m.nama AS movie_name, g.nama AS genre
FROM movie m
JOIN movie_status ms ON m.movie_status_id = ms.id
JOIN genre g ON m.genre_id = g.id
WHERE ms.jenis = 'Free'
  AND m.studio_produksi = 'Warner Bros. Pictures';

--3) Tampilkan film film yang rilis pada tahun 2022 dengan genre action atau adventure. 
SELECT m.nama AS movie_name, m.tahun_rilis
FROM movie m
JOIN genre g ON m.genre_id = g.id
WHERE EXTRACT(YEAR FROM m.tahun_rilis) = 2022
  AND (g.nama = 'Action' OR g.nama = 'Adventure');

--4) Tampilkan lima daftar film (movie) yang memiliki jumlah rating (user_rating) paling banyak di antara semua film
SELECT m.nama AS film, COUNT(ur.id) AS jumlah_rating
FROM movie m
LEFT JOIN user_rating ur ON m.id = ur.movie_id
GROUP BY m.nama
ORDER BY jumlah_rating DESC
LIMIT 5;

--5) Tampilkan jumlah pengguna yang memiliki status langganan tidak aktif (status = false) sebelum minggu kedua Juni 2023.
SELECT COUNT(*) AS jumlah_pengguna_tidak_aktif
FROM users u
INNER JOIN subscription s ON u.id = s.users_id
WHERE s.status = false
  AND s.end_date < '2023-06-08';

--6) Tampilkan daftar genre (genre) beserta jumlah film (movie) yang termasuk dalam setiap genre, hanya untuk genre-genre yang memiliki lebih dari 5 film. Sertakan juga informasi rata-rata durasi film dalam setiap genre tersebut. Urutkan hasil berdasarkan jumlah film secara descending.

SELECT g.nama AS genre, COUNT(*) AS jumlah_film, AVG(m.durasi) AS rata_rata_durasi
FROM genre g
JOIN movie m ON g.id = m.genre_id
GROUP BY g.nama
HAVING COUNT(*) > 5
ORDER BY jumlah_film DESC;


--7) Tampilkan 5 pengguna teratas beserta nama pengguna (nama_pengguna), email, tanggal pembayaran (payment_date), dan nama metode pembayaran (metode_pembayaran) yang menggunakan metode pembayaran 'E-Wallet' dalam transaksi pembayaran pada bulan Juni. Hasilnya harus diurutkan berdasarkan tanggal pembayaran.
SELECT u.nama AS nama_pengguna, u.email, p.payment_date, pm.method AS metode_pembayaran
FROM users u
INNER JOIN payment p ON u.id = p.subscription_id
INNER JOIN payment_method pm ON p.payment_method_id = pm.id
WHERE
  pm.method = 'E-Wallet'
  AND EXTRACT(MONTH FROM p.payment_date) = 6
  AND p.payment_method_id = (
    SELECT id
    FROM payment_method
    WHERE method = 'E-Wallet'
  )
ORDER BY p.payment_date ASC
LIMIT 5;
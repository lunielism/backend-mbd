--1. Trigger: Update total rating film setelah setiap penilaian baru


CREATE OR REPLACE FUNCTION update_movie_rating_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE movie SET rating_total = get_movie_rating_total(NEW.movie_id) WHERE id = NEW.movie_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_movie_rating_trigger
AFTER INSERT ON user_rating
FOR EACH ROW
EXECUTE FUNCTION update_movie_rating_total();


--2. Trigger: Update total bookmark film setelah setiap penambahan bookmark baru


CREATE OR REPLACE FUNCTION update_movie_bookmark_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE movie SET bookmark_total = get_movie_bookmark_total(NEW.movie_id) WHERE id = NEW.movie_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_movie_bookmark_trigger
AFTER INSERT ON bookmark
FOR EACH ROW
EXECUTE FUNCTION update_movie_bookmark_total();


--3. Trigger: Update total like film setelah setiap penambahan like baru


CREATE OR REPLACE FUNCTION update_movie_like_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE movie SET like_total = get_movie_like_total(NEW.movie_id) WHERE id = NEW.movie_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_movie_like_trigger
AFTER INSERT ON likes
FOR EACH ROW
EXECUTE FUNCTION update_movie_like_total();


--4. Trigger: Update total film dengan rating di atas nilai tertentu setelah setiap penilaian baru


CREATE OR REPLACE FUNCTION update_movies_with_rating_above_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE movie SET movies_with_rating_above_total = get_movies_with_rating_above(NEW.rating_threshold);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_movies_with_rating_above_trigger
AFTER INSERT ON user_rating
FOR EACH ROW
EXECUTE FUNCTION update_movies_with_rating_above_total();


--5. Trigger: Update total komentar film setelah setiap penambahan komentar baru


CREATE OR REPLACE FUNCTION update_movie_comment_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE movie SET comment_total = get_movie_comment_total(NEW.movie_id) WHERE id = NEW.movie_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_movie_comment_trigger
AFTER INSERT ON comment
FOR EACH ROW
EXECUTE FUNCTION update_movie_comment_total();


--6. Trigger: Update total subscriber aktif setelah setiap perubahan status langganan


CREATE OR REPLACE FUNCTION update_active_subscriber_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE subscription_summary SET active_subscriber_total = get_active_subscriber_total();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_active_subscriber_trigger
AFTER INSERT OR UPDATE OR DELETE ON subscription
FOR EACH ROW
EXECUTE FUNCTION update_active_subscriber_total();


--7. Trigger: Update total subscriber tidak aktif setelah setiap perubahan status langganan


CREATE OR REPLACE FUNCTION update_inactive_subscriber_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE subscription_summary SET inactive_subscriber_total = get_inactive_subscriber_total();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_inactive_subscriber_trigger
AFTER INSERT OR UPDATE OR DELETE ON subscription
FOR EACH ROW
EXECUTE FUNCTION update_inactive_subscriber_total();


--8. Trigger: Update total transaksi pembayaran setelah setiap pembayaran baru


CREATE OR REPLACE FUNCTION update_payment_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE payment_summary SET payment_total = get_payment_total();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_payment_trigger
AFTER INSERT ON payment
FOR EACH ROW
EXECUTE FUNCTION update_payment_total();


--9. Trigger: Update total transaksi pembayaran sukses setelah setiap pembayaran baru


CREATE OR REPLACE FUNCTION update_successful_payment_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE payment_summary SET successful_payment_total = get_successful_payment_total();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_successful_payment_trigger
AFTER INSERT ON payment
FOR EACH ROW
EXECUTE FUNCTION update_successful_payment_total();


--10. Trigger: Update total transaksi pembayaran gagal setelah setiap pembayaran baru


CREATE OR REPLACE FUNCTION update_failed_payment_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE payment_summary SET failed_payment_total = get_failed_payment_total();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_failed_payment_trigger
AFTER INSERT ON payment
FOR EACH ROW
EXECUTE FUNCTION update_failed_payment_total();


--11. Trigger: Update total pengguna yang memberikan rating setelah setiap penilaian baru


CREATE OR REPLACE FUNCTION update_user_rating_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE user_summary SET user_rating_total = get_user_rating_total();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_user_rating_trigger
AFTER INSERT ON user_rating
FOR EACH ROW
EXECUTE FUNCTION update_user_rating_total();


--12. Trigger: Update total pengguna yang memberikan bookmark setelah setiap penambahan bookmark baru


CREATE OR REPLACE FUNCTION update_user_bookmark_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE user_summary SET user_bookmark_total = get_user_bookmark_total();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_user_bookmark_trigger
AFTER INSERT ON bookmark
FOR EACH ROW
EXECUTE FUNCTION update_user_bookmark_total();


--13. Trigger: Update total pengguna yang memberikan like setelah setiap penambahan like baru


CREATE OR REPLACE FUNCTION update_user_like_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE user_summary SET user_like_total = get_user_like_total();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_user_like_trigger
AFTER INSERT ON likes
FOR EACH ROW
EXECUTE FUNCTION update_user_like_total();


--15. Trigger: Update total pengguna yang memberikan komentar setelah setiap penambahan komentar baru


CREATE OR REPLACE FUNCTION update_user_comment_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE user_summary SET user_comment_total = get_user_comment_total();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_user_comment_trigger
AFTER INSERT ON comment
FOR EACH ROW
EXECUTE FUNCTION update_user_comment_total();


--16. Trigger: Update total pengguna dengan status langganan

 aktif setelah setiap perubahan status langganan


CREATE OR REPLACE FUNCTION update_active_subscription_user_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE user_summary SET active_subscription_user_total = get_active_subscription_user_total();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_active_subscription_user_trigger
AFTER INSERT OR UPDATE ON subscription
FOR EACH ROW
EXECUTE FUNCTION update_active_subscription_user_total();


--17. Trigger: Update total pengguna dengan status langganan tidak aktif setelah setiap perubahan status langganan


CREATE OR REPLACE FUNCTION update_inactive_subscription_user_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE user_summary SET inactive_subscription_user_total = get_inactive_subscription_user_total();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_inactive_subscription_user_trigger
AFTER INSERT OR UPDATE ON subscription
FOR EACH ROW
EXECUTE FUNCTION update_inactive_subscription_user_total();


--18. Trigger: Update total genre film setelah setiap penambahan genre baru


CREATE OR REPLACE FUNCTION update_genre_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE movie_summary SET genre_total = get_genre_total();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_genre_trigger
AFTER INSERT ON genre
FOR EACH ROW
EXECUTE FUNCTION update_genre_total();


--19. Trigger: Update total rating umur setelah setiap penambahan rating umur baru


CREATE OR REPLACE FUNCTION update_rating_umur_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE movie_summary SET rating_umur_total = get_rating_umur_total();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_rating_umur_trigger
AFTER INSERT ON rating_umur
FOR EACH ROW
EXECUTE FUNCTION update_rating_umur_total();


--20. Trigger: Update total pengguna setelah setiap penambahan pengguna baru


CREATE OR REPLACE FUNCTION update_user_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE user_summary SET user_total = get_user_total();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_user_trigger
AFTER INSERT ON users
FOR EACH ROW
EXECUTE FUNCTION update_user_total();

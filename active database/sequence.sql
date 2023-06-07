-- Sequence: seq_movie_status_id
-- Deskripsi: Sequence untuk kolom id pada tabel movie_status
CREATE SEQUENCE seq_movie_status_id
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

-- Sequence: seq_rating_umur_id
-- Deskripsi: Sequence untuk kolom id pada tabel rating_umur
CREATE SEQUENCE seq_rating_umur_id
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

-- Sequence: seq_genre_id
-- Deskripsi: Sequence untuk kolom id pada tabel genre
CREATE SEQUENCE seq_genre_id
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

-- Sequence: seq_movie_id
-- Deskripsi: Sequence untuk kolom id pada tabel movie
CREATE SEQUENCE seq_movie_id
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

-- Sequence: seq_users_id
-- Deskripsi: Sequence untuk kolom id pada tabel users
CREATE SEQUENCE seq_users_id
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

-- Sequence: seq_user_rating_id
-- Deskripsi: Sequence untuk kolom id pada tabel user_rating
CREATE SEQUENCE seq_user_rating_id
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

-- Sequence: seq_bookmark_id
-- Deskripsi: Sequence untuk kolom id pada tabel bookmark
CREATE SEQUENCE seq_bookmark_id
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

-- Sequence: seq_likes_id
-- Deskripsi: Sequence untuk kolom id pada tabel likes
CREATE SEQUENCE seq_likes_id
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

-- Sequence: seq_comment_id
-- Deskripsi: Sequence untuk kolom id pada tabel comment
CREATE SEQUENCE seq_comment_id
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

-- Sequence: seq_subscription_id
-- Deskripsi: Sequence untuk kolom id pada tabel subscription
CREATE SEQUENCE seq_subscription_id
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

-- Sequence: seq_payment_method_id
-- Deskripsi: Sequence untuk kolom id pada tabel payment_method
CREATE SEQUENCE seq_payment_method_id
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

-- Sequence: seq_payment_id
-- Deskripsi: Sequence untuk kolom id pada tabel payment
CREATE SEQUENCE seq_payment_id
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

-- Trigger: set_movie_status_id
-- Function: set_movie_status_id
-- Deskripsi: Trigger untuk mengatur nilai id pada kolom movie_status_id di tabel movie
CREATE OR REPLACE FUNCTION set_movie_status_id()
RETURNS TRIGGER AS $$
BEGIN
    NEW.movie_status_id := nextval('seq_movie_status_id');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger: set_rating_umur_id
-- Function: set_rating_umur_id
-- Deskripsi: Trigger untuk mengatur nilai id pada kolom rating_umur_id di tabel movie
CREATE OR REPLACE FUNCTION set_rating_umur_id()
RETURNS TRIGGER AS $$
BEGIN
    NEW.rating_umur_id := nextval('seq_rating_umur_id');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger: set_genre_id
-- Function: set_genre_id
-- Deskripsi: Trigger untuk mengatur nilai id pada kolom genre_id di tabel movie
CREATE OR REPLACE FUNCTION set_genre_id()
RETURNS TRIGGER AS $$
BEGIN
    NEW.genre_id := nextval('seq_genre_id');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger: set_movie_id
-- Function: set_movie_id
-- Deskripsi: Trigger untuk mengatur nilai id pada kolom movie_id di tabel user_rating, bookmark, likes, comment, dan payment
CREATE OR REPLACE FUNCTION set_movie_id()
RETURNS TRIGGER AS $$
BEGIN
    NEW.movie_id := nextval('seq_movie_id');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger: set_users_id
-- Function: set_users_id
-- Deskripsi: Trigger untuk mengatur nilai id pada kolom users_id di tabel user_rating, bookmark, likes, comment, subscription, dan payment
CREATE OR REPLACE FUNCTION set_users_id()
RETURNS TRIGGER AS $$
BEGIN
    NEW.users_id := nextval('seq_users_id');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger: set_user_rating_id
-- Function: set_user_rating_id
-- Deskripsi: Trigger untuk mengatur nilai id pada kolom id di tabel user_rating
CREATE OR REPLACE FUNCTION set_user_rating_id()
RETURNS TRIGGER AS $$
BEGIN
    NEW.id := nextval('seq_user_rating_id');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger: set_bookmark_id
-- Function: set_bookmark_id
-- Deskripsi: Trigger untuk mengatur nilai id pada kolom id di tabel bookmark
CREATE OR REPLACE FUNCTION set_bookmark_id()
RETURNS TRIGGER AS $$
BEGIN
    NEW.id := nextval('seq_bookmark_id');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger: set_likes_id
-- Function: set_likes_id
-- Deskripsi: Trigger untuk mengatur nilai id pada kolom id di tabel likes
CREATE OR REPLACE FUNCTION set_likes_id()
RETURNS TRIGGER AS $$
BEGIN
    NEW.id := nextval('seq_likes_id');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger: set_comment_id
-- Function: set_comment_id
-- Deskripsi: Trigger untuk mengatur nilai id pada kolom id di tabel comment
CREATE OR REPLACE FUNCTION set_comment_id()
RETURNS TRIGGER AS $$
BEGIN
    NEW.id := nextval('seq_comment_id');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger: set_subscription_id
-- Function: set_subscription_id
-- Deskripsi: Trigger untuk mengatur nilai id pada kolom id di tabel subscription
CREATE OR REPLACE FUNCTION set_subscription_id()
RETURNS TRIGGER AS $$
BEGIN
    NEW.id := nextval('seq_subscription_id');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger: set_payment_method_id
-- Function: set_payment_method_id
-- Deskripsi: Trigger untuk mengatur nilai id pada kolom payment_method_id di tabel payment
CREATE OR REPLACE FUNCTION set_payment_method_id()
RETURNS TRIGGER AS $$
BEGIN
    NEW.payment_method_id := nextval('seq_payment_method_id');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger: set_payment_id
-- Function: set_payment_id
-- Deskripsi: Trigger untuk mengatur nilai id pada kolom id di tabel payment
CREATE OR REPLACE FUNCTION set_payment_id()
RETURNS TRIGGER AS $$
BEGIN
    NEW.id := nextval('seq_payment_id');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger: set_movie_status_id_trigger
-- Deskripsi: Trigger yang dipicu saat melakukan INSERT pada tabel movie
CREATE TRIGGER set_movie_status_id_trigger
BEFORE INSERT ON movie
FOR EACH ROW
EXECUTE FUNCTION set_movie_status_id();

-- Trigger: set_rating_umur_id_trigger
-- Deskripsi: Trigger yang dipicu saat melakukan INSERT pada tabel movie
CREATE TRIGGER set_rating_umur_id_trigger
BEFORE INSERT ON movie
FOR EACH ROW
EXECUTE FUNCTION set_rating_umur_id();

-- Trigger: set_genre_id_trigger
-- Deskripsi: Trigger yang dipicu saat melakukan INSERT pada tabel movie
CREATE TRIGGER set_genre_id_trigger
BEFORE INSERT ON movie
FOR EACH ROW
EXECUTE FUNCTION set_genre_id();

-- Trigger: set_movie_id_trigger
-- Deskripsi: Trigger yang dipicu saat melakukan INSERT pada tabel user_rating, bookmark, likes, comment, dan payment
CREATE TRIGGER set_movie_id_trigger
BEFORE INSERT ON user_rating, bookmark, likes, comment, payment
FOR EACH ROW
EXECUTE FUNCTION set_movie_id();

-- Trigger: set_users_id_trigger
-- Deskripsi: Trigger yang dipicu saat melakukan INSERT pada tabel user_rating, bookmark, likes, comment, subscription, dan payment
CREATE TRIGGER set_users_id_trigger
BEFORE INSERT ON user_rating, bookmark, likes, comment, subscription, payment
FOR EACH ROW
EXECUTE FUNCTION set_users_id();

-- Trigger: set_user_rating_id_trigger
-- Deskripsi: Trigger yang dipicu saat melakukan INSERT pada tabel user_rating
CREATE TRIGGER set_user_rating_id_trigger
BEFORE INSERT ON user_rating
FOR EACH ROW
EXECUTE FUNCTION set_user_rating_id();

-- Trigger: set_bookmark_id_trigger
-- Deskripsi: Trigger yang dipicu saat melakukan INSERT pada tabel bookmark
CREATE TRIGGER set_bookmark_id_trigger
BEFORE INSERT ON bookmark
FOR EACH ROW
EXECUTE FUNCTION set_bookmark_id();

-- Trigger: set_likes_id_trigger
-- Deskripsi: Trigger yang dipicu saat melakukan INSERT pada tabel likes
CREATE TRIGGER set_likes_id_trigger
BEFORE INSERT ON likes
FOR EACH ROW
EXECUTE FUNCTION set_likes_id();

-- Trigger: set_comment_id_trigger
-- Deskripsi: Trigger yang dipicu saat melakukan INSERT pada tabel comment
CREATE TRIGGER set_comment_id_trigger
BEFORE INSERT ON comment
FOR EACH ROW
EXECUTE FUNCTION set_comment_id();

-- Trigger: set_subscription_id_trigger
-- Deskripsi: Trigger yang dipicu saat melakukan INSERT pada tabel subscription
CREATE TRIGGER set_subscription_id_trigger
BEFORE INSERT ON subscription
FOR EACH ROW
EXECUTE FUNCTION set_subscription_id();

-- Trigger: set_payment_method_id_trigger
-- Deskripsi: Trigger yang dipicu saat melakukan INSERT pada tabel payment
CREATE TRIGGER set_payment_method_id_trigger
BEFORE INSERT ON payment
FOR EACH ROW
EXECUTE FUNCTION set_payment_method_id();

-- Trigger: set_payment_id_trigger
-- Deskripsi: Trigger yang dipicu saat melakukan INSERT pada tabel payment
CREATE TRIGGER set_payment_id_trigger
BEFORE INSERT ON payment
FOR EACH ROW
EXECUTE FUNCTION set_payment_id();

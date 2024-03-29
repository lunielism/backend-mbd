SELECT * FROM movie_status;
SELECT * FROM rating_umur;
SELECT * FROM genre;
SELECT * FROM movie;
SELECT * FROM users;
SELECT * FROM user_rating;
SELECT * FROM bookmark;
SELECT * FROM likes;
SELECT * FROM comment;
SELECT * FROM subscription;
SELECT * FROM payment_method;
SELECT * FROM payment;

-- 1. Membuat tabel movie_status
CREATE TABLE movie_status (
  id INT PRIMARY KEY,
  jenis VARCHAR(15)
);

--2.  Membuat tabel rating_umur
CREATE TABLE rating_umur (
  id INT PRIMARY KEY,
  rate VARCHAR(50)
);

--3. Membuat tabel genre
CREATE TABLE genre (
  id INT PRIMARY KEY,
  nama VARCHAR(50)
);

--4. Membuat tabel movie
CREATE TABLE movie (
  id INT PRIMARY KEY,
  nama VARCHAR(50),
  tahun_rilis DATE,
  deskripsi VARCHAR(1000),
  resolusi INT,
  durasi INTERVAL,
  director VARCHAR(100),
  studio_produksi VARCHAR(100),
  genre_id INT,
  rating_umur_id INT,
  movie_status_id INT, 
  FOREIGN KEY (genre_id) REFERENCES genre(id),
  FOREIGN KEY (rating_umur_id) REFERENCES rating_umur(id),
  FOREIGN KEY (movie_status_id) REFERENCES movie_status(id)
);

--5. Membuat tabel users
CREATE TABLE users (
  id INT PRIMARY KEY,
  nama VARCHAR(100),
  email VARCHAR(50),
  password VARCHAR(10)
);

--6. Membuat tabel user_rating
CREATE TABLE user_rating (
  id INT PRIMARY KEY,
  rating INT,
  movie_id INT,
  users_id INT,
  FOREIGN KEY (movie_id) REFERENCES movie(id),
  FOREIGN KEY (users_id) REFERENCES users(id)
);

--7. Membuat tabel bookmark
CREATE TABLE bookmark (
  id INT PRIMARY KEY,
  bookmark_status BOOLEAN,
  users_id INT,
  movie_id INT,
  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (movie_id) REFERENCES movie(id)
);

--8. Membuat tabel likes
CREATE TABLE likes (
  id INT PRIMARY KEY,
  like_status BOOLEAN, 
  users_id INT,
  movie_id INT,
  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (movie_id) REFERENCES movie(id)
);

--9. Membuat tabel comment
CREATE TABLE comment (
  id INT PRIMARY KEY,
  message VARCHAR(100),
  waktu_comment TIMESTAMP,
  users_id INT,
  movie_id INT,
  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (movie_id) REFERENCES movie(id)
);

--10. Membuat tabel subscription
CREATE TABLE subscription (
  id INT PRIMARY KEY,
  start_date DATE,
  end_date DATE,
  status BOOLEAN,
  users_id INT,
  FOREIGN KEY (users_id) REFERENCES users(id)
);

--11. Membuat tabel payment_method
CREATE TABLE payment_method (
  id INT PRIMARY KEY,
  method VARCHAR(50)
);

--12. Membuat tabel payment
CREATE TABLE payment (
  id INT PRIMARY KEY,
  payment_date DATE,
  total MONEY,
  status BOOLEAN,
  subscription_id INT,
  payment_method_id INT,
  FOREIGN KEY (subscription_id) REFERENCES subscription(id),
  FOREIGN KEY (payment_method_id) REFERENCES payment_method(id)
);


--1. Insert into movie_status
INSERT INTO movie_status (id, jenis)
VALUES
  (1, 'Paid'),
  (2, 'Free');

--2. Insert into rating_umur
INSERT INTO rating_umur (id, rate)
VALUES
  (1, 'General'),
  (2, '13+'),
  (3, '17+'),
  (4, '21+');

--3. Insert into genre
INSERT INTO genre (id, nama)
VALUES
  (1, 'Action'),
  (2, 'Drama'),
  (3, 'Comedy'),
  (4, 'Thriller'),
  (5, 'Romance'),
  (6, 'Adventure'),
  (7, 'Sci-Fi'),
  (8, 'Horror'),
  (9, 'Animation');

--4.movie
INSERT INTO movie (id, nama, tahun_rilis, deskripsi, resolusi, durasi, director, studio_produksi, genre_id, rating_umur_id, movie_status_id)
VALUES
  (1, 'Avengers: Endgame', '2019-04-26', 'After the devastating events of Avengers: Infinity War, the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos'' actions and restore balance to the universe.', 1080, INTERVAL '03:01:00', 'Anthony Russo, Joe Russo', 'Marvel Studios', 1, 1, 1),
  (2, 'The Shawshank Redemption', '1994-09-23', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 1080, INTERVAL '02:22:00', 'Frank Darabont', 'Columbia Pictures', 2, 1, 1),
  (3, 'Pulp Fiction', '1994-10-14', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 1080,  INTERVAL'02:34:00', 'Quentin Tarantino', 'Miramax Films', 3, 1, 1),
  (4, 'Inception', '2010-07-16', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', 1080, INTERVAL '02:28:00', 'Christopher Nolan', 'Warner Bros. Pictures', 4, 1, 1),
  (5, 'The Notebook', '2004-06-25', 'A poor yet passionate young man falls in love with a rich young woman, giving her a sense of freedom, but they are soon separated because of their social differences.', 1080, INTERVAL '02:03:00', 'Nick Cassavetes', 'New Line Cinema', 5, 1, 1),
  (6, 'Indiana Jones and the Raiders of the Lost Ark', '1981-06-12', 'Archaeologist and adventurer Indiana Jones is hired by the U.S. government to find the Ark of the Covenant before the Nazis.', 1080, INTERVAL '01:55:00', 'Steven Spielberg', 'Paramount Pictures', 6, 1, 1),
  (7, 'The Matrix', '1999-03-31', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', 1080, INTERVAL '02:16:00', 'Lana Wachowski, Lilly Wachowski', 'Warner Bros. Pictures', 7, 1, 1),
  (8, 'The Shining', '1980-05-23', 'A family heads to an isolated hotel for the winter where a sinister presence influences the father into violence, while his psychic son sees horrific forebodings from both past and future.', 1080, INTERVAL '02:26:00', 'Stanley Kubrick', 'Warner Bros. Pictures', 8, 1, 1),
  (9, 'Toy Story', '1995-11-22', 'A cowboy doll is profoundly threatened and jealous when a new spaceman figure supplants him as top toy in a boy''s room.', 1080, INTERVAL '01:21:00', 'John Lasseter', 'Pixar Animation Studios', 9, 1, 1),
  (10, 'Mad Max: Fury Road', '2015-05-15', 'In a post-apocalyptic wasteland, a woman rebels against a tyrannical ruler in search for her homeland with the aid of a group of female prisoners, a psychotic worshiper, and a drifter named Max.', 1080, INTERVAL '02:00:00', 'George Miller', 'Warner Bros. Pictures', 1, 2, 1),
  (11, 'The Fault in Our Stars', '2014-06-06', 'Two teenage cancer patients begin a life-affirming journey to visit a reclusive author in Amsterdam.', 1080, INTERVAL '02:06:00', 'Josh Boone', '20th Century Fox', 2, 2, 1),
  (12, 'Superbad', '2007-08-17', 'Two co-dependent high school seniors are forced to deal with separation anxiety after their plan to stage a booze-soaked party goes awry.', 1080, INTERVAL '01:59:00', 'Greg Mottola', 'Columbia Pictures', 3, 2, 1),
  (13, 'Gone Girl', '2014-10-03', 'With his wife''s disappearance having become the focus of an intense media circus, a man sees the spotlight turned on him when it''s suspected that he may not be innocent.', 1080, INTERVAL '02:29:00', 'David Fincher', '20th Century Fox', 4, 2, 1),
  (14, 'La La Land', '2016-12-09', 'While navigating their careers in Los Angeles, a pianist and an actress fall in love while attempting to reconcile their aspirations for the future.', 1080, INTERVAL '02:08:00', 'Damien Chazelle', 'Lionsgate', 5, 2, 1),
  (15, 'Jurassic Park', '1993-06-11', 'A pragmatic paleontologist visiting an almost complete theme park is tasked with protecting a couple of kids after a power failure causes the park''s cloned dinosaurs to run loose.', 1080, INTERVAL '02:07:00', 'Steven Spielberg', 'Universal Pictures', 6, 2, 1),
  (16, 'Interstellar', '2014-11-07', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity''s survival.', 1080, INTERVAL '02:49:00', 'Christopher Nolan', 'Paramount Pictures', 7, 2, 1),
  (17, 'Get Out', '2017-02-24', 'A young African-American visits his white girlfriend''s parents for the weekend, where his simmering uneasiness about their reception of him eventually reaches a boiling point.', 1080, INTERVAL'01:44:00', 'Jordan Peele', 'Universal Pictures', 8, 2, 1),
  (18, 'Finding Nemo', '2003-05-30', 'After his son is captured in the Great Barrier Reef and taken to Sydney, a timid clownfish sets out on a journey to bring him home.', 1080, INTERVAL'01:40:00', 'Andrew Stanton', 'Pixar Animation Studios', 9, 2, 1),
  (19, 'John Wick', '2014-10-24', 'An ex-hit-man comes out of retirement to track down the gangsters that killed his dog and took everything from him.', 1080, INTERVAL'01:41:00', 'Chad Stahelski', 'Lionsgate', 1, 3, 1),
  (20, 'Fight Club', '1999-10-15', 'An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much, much more.', 1080, INTERVAL'02:19:00', 'David Fincher', '20th Century Fox', 2, 3, 1),
  (21, 'The Hangover', '2009-06-05', 'Three buddies wake up from a bachelor party in Las Vegas, with no memory of the previous night and the bachelor missing. They make their way around the city in order to find their friend before his wedding.', 1080, INTERVAL'01:40:00', 'Todd Phillips', 'Warner Bros. Pictures', 3, 3, 1),
  (22, 'Se7en', '1995-09-22', 'Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.', 1080, INTERVAL'02:07:00', 'David Fincher', 'New Line Cinema', 4, 3, 1),
  (23, 'Eternal Sunshine of the Spotless Mind', '2004-03-19', 'When their relationship turns sour, a couple undergoes a medical procedure to have each other erased from their memories.', 1080, INTERVAL'01:48:00', 'Michel Gondry', 'Focus Features', 5, 3, 1),
  (24, 'The Lord of the Rings: The Fellowship of the Ring', '2001-12-19', 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.', 1080, INTERVAL'02:58:00', 'Peter Jackson', 'New Line Cinema', 6, 3, 1),
  (25, 'Blade Runner', '1982-06-25', 'A blade runner must pursue and terminate four replicants who stole a ship in space, and have returned to Earth to find their creator.', 1080, INTERVAL'01:57:00', 'Ridley Scott', 'Warner Bros. Pictures', 7, 3, 1),
  (26, 'The Exorcist', '1973-12-26', 'When a 12-year-old girl is possessed by a mysterious entity, her mother seeks the help of two priests to save her.', 1080,INTERVAL '02:02:00', 'William Friedkin', 'Warner Bros. Pictures', 8, 3, 1),
  (27, 'Shrek', '2001-05-18', 'A mean lord exiles fairytale creatures to the swamp of a grumpy ogre, who must go on a quest and rescue a princess for the lord in order to get his land back.', 1080, INTERVAL'01:30:00', 'Andrew Adamson, Vicky Jenson', 'DreamWorks Animation', 9, 3, 1),
  (28, 'Die Hard', '1988-07-20', 'An NYPD officer tries to save his wife and several others taken hostage by German terrorists during a Christmas party at the Nakatomi Plaza in Los Angeles.', 1080, INTERVAL'02:12:00', 'John McTiernan', '20th Century Fox', 1, 4, 1),
  (29, 'The Godfather', '1972-03-24', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 1080, INTERVAL'02:55:00', 'Francis Ford Coppola', 'Paramount Pictures', 2, 4, 1),
  (30, 'The Big Lebowski', '1998-03-06', 'Jeff "The Dude" Lebowski, mistaken for a millionaire of the same name, seeks restitution for his ruined rug and enlists his bowling buddies to help get it.', 1080, INTERVAL'01:57:00', 'Joel Coen, Ethan Coen', 'PolyGram Filmed Entertainment', 3, 4, 1),
  (31, 'Heat', '1995-12-15', 'A group of professional bank robbers start to feel the heat from police when they unknowingly leave a clue at their latest heist.', 1080, INTERVAL'02:50:00', 'Michael Mann', 'Warner Bros. Pictures', 4, 4, 1),
  (32, 'Casablanca', '1942-11-26', 'A cynical American expatriate struggles to decide whether or not he should help his former lover and her fugitive husband escape French Morocco.', 1080, INTERVAL'01:42:00', 'Michael Curtiz', 'Warner Bros. Pictures', 5, 4, 1),
  (33, 'Raiders of the Lost Ark', '1981-06-12', 'Archaeologist and adventurer Indiana Jones is hired by the U.S. government to find the Ark of the Covenant before the Nazis.', 1080, INTERVAL'01:55:00', 'Steven Spielberg', 'Paramount Pictures', 6, 4, 1),
  (34, 'Blade Runner 2049', '2017-10-06', 'A young blade runner''s discovery of a long-buried secret leads him to track down former blade runner Rick Deckard, who''s been missing for thirty years.', 1080, INTERVAL'02:44:00', 'Denis Villeneuve', 'Warner Bros. Pictures', 7, 4, 1),
  (35, 'The Shining', '1980-05-23', 'A family heads to an isolated hotel for the winter where a sinister presence influences the father into violence, while his psychic son sees horrific forebodings from both past and future.', 1080, INTERVAL'02:26:00', 'Stanley Kubrick', 'Warner Bros. Pictures', 8, 4, 1),
  (36, 'Frozen 2', '2019-11-22', 'Anna, Elsa, Kristoff, Olaf, and Sven leave Arendelle to travel to an ancient, autumn-bound forest of an enchanted land. They set out to find the origin of Elsa''s powers in order to save their kingdom.', 1080, INTERVAL'01:43:00', 'Jennifer Lee, Chris Buck', 'Walt Disney Animation Studios', 9, 1, 2),
  (37, 'Black Widow', '2021-07-09', 'Natasha Romanoff, also known as Black Widow, confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.', 1080, INTERVAL'02:14:00', 'Cate Shortland', 'Marvel Studios', 1, 2, 2),
  (38, 'The French Dispatch', '2021-10-22', 'A love letter to journalists set in an outpost of an American newspaper in a fictional 20th-century French city that brings to life a collection of stories published in "The French Dispatch" magazine.', 1080, INTERVAL'01:48:00', 'Wes Anderson', 'Searchlight Pictures', 2, 2, 2),
  (39, 'Free Guy', '2021-08-13', 'A bank teller discovers that he''s actually an NPC inside a brutal, open-world video game.', 1080, INTERVAL'01:55:00', 'Shawn Levy', '20th Century Studios', 3, 2, 2),
  (40, 'No Time to Die', '2021-10-08', 'James Bond has left active service. His peace is short-lived when Felix Leiter, an old friend from the CIA, turns up asking for help, leading Bond onto the trail of a mysterious villain armed with dangerous new technology.', 1080, INTERVAL'02:43:00', 'Cary Joji Fukunaga', 'Metro-Goldwyn-Mayer', 4, 2, 2),
  (41, 'The Last Letter from Your Lover', '2021-07-23', 'A pair of interwoven stories set in the present and past follow an ambitious journalist determined to solve the mystery of a forbidden love affair at the center of a trove of secret love letters from 1965.', 1080, INTERVAL'01:50:00', 'Augustine Frizzell', 'Stu-dioCanal, The Film Farm', 5, 2, 2),
  (42, 'Jungle Cruise', '2021-07-30', 'Based on Disneyland''s theme park ride where a small riverboat takes a group of travelers through a jungle filled with dangerous animals and reptiles, but with a supernatural element.', 1080, INTERVAL'02:07:00', 'Jaume Collet-Serra', 'Walt Disney Pictures', 6, 2, 2),
  (43, 'Dune', '2021-10-22', 'Feature adaptation of Frank Herbert''s science fiction novel, about the son of a noble family entrusted with the protection of the most valuable asset and most vital element in the galaxy.', 1080, INTERVAL'02:35:00', 'Denis Villeneuve', 'Warner Bros. Pictures', 7, 2, 2),
  (44, 'Halloween Kills', '2021-10-15', 'The saga of Michael Myers and Laurie Strode continues in the next thrilling chapter of the Halloween series.', 1080, INTERVAL'01:45:00', 'David Gordon Green', 'Universal Pictures', 8, 2, 2),
  (45, 'Sing 2', '2021-12-22', 'Buster Moon and his friends must persuade reclusive rock star Clay Calloway to join them for the opening of a new show.', 1080, INTERVAL'01:52:00', 'Garth Jennings', 'Universal Pictures', 9, 2, 2),
  (46, 'Top Gun: Maverick', '2022-05-27', 'After more than thirty years of service as one of the Navy''s top aviators, Pete "Maverick" Mitchell is where he belongs, pushing the envelope as a courageous test pilot and dodging the advancement in rank that would ground him.', 1080, INTERVAL'02:18:00', 'Joseph Kosinski', 'Paramount Pictures', 1, 3, 2),
  (47, 'Belfast', '2022-09-16', 'A young boy and his working-class family experience the tumultuous late 1960s.', 1080, INTERVAL'01:37:00', 'Kenneth Branagh', 'Focus Features', 2, 3, 2),
  (48, 'Jackass Forever', '2022-10-22', 'Celebrating the joy of being back together with your best friends and a perfectly executed shot to the dingdong, the original jackass crew return for another round of hilarious, wildly absurd, and often dangerous displays of comedy with a little help from some exciting new cast.', 1080, INTERVAL'01:45:00', 'Jeff Tremaine', 'Paramount Pictures', 3, 3, 2),
  (49, 'Malignant', '2021-09-10', 'Madison is paralyzed by shocking visions of grisly murders, and her torment worsens as she discovers that these waking dreams are in fact terrifying realities.', 1080, INTERVAL'01:51:00', 'James Wan', 'Warner Bros. Pictures', 4, 3, 2),
  (50, 'Deep Water', '2022-01-14', 'A well-to-do husband who allows his wife to have affairs in order to avoid a divorce becomes a prime suspect in the disappearance of her lovers.', 1080, INTERVAL'02:16:00', 'Adrian Lyne', '20th Century Studios', 5, 3, 2),
  (51, 'Jurassic World: Dominion', '2022-06-10', 'Plot unknown. Third installment of the "Jurassic World" franchise.', 1080, INTERVAL'02:20:00', 'Colin Trevorrow', 'Universal Pictures', 6, 3, 2),
  (52, 'The Matrix Resurrections', '2021-12-22', 'The Matrix Resurrections is an upcoming American science fiction action film produced, co-written, and directed by Lana Wachowski. It is the fourth installment in The Matrix film series, set to be produced and released by Warner Bros. Pictures.', 1080, INTERVAL'02:28:00', 'Lana Wachowski', 'Warner Bros. Pictures', 7, 3, 2),
  (53, 'Scream', '2022-01-14', 'A new installment of the "Scream" horror franchise will follow a woman returning to her home town to try to find out who has been committing a series of vicious crimes.', 1080, INTERVAL'01:52:00', 'Matt Bettinelli-Olpin, Tyler Gillett', 'Paramount Pictures', 8, 3, 2),
  (54, 'Toy Story 4', '2019-06-21', 'When a new toy called "Forky" joins Woody and the gang, a road trip alongside old and new friends reveals how big the world can be for a toy.', 1080, INTERVAL'01:40:00', 'Josh Cooley', 'Pixar Animation Studios', 9, 1, 2),
  (55, 'Fast & Furious 9', '2021-06-25', 'Cipher enlists the help of Jakob, Dom''s younger brother, to take revenge on Dom and his team.', 1080, INTERVAL'02:25:00', 'Justin Lin', 'Universal Pictures', 1, 2, 2),
  (56, 'The Trial of the Chicago 7', '2020-10-16', 'The story of 7 people on trial stemming from various charges surrounding the uprising at the 1968 Democratic National Convention in Chicago, Illinois.', 1080, INTERVAL'02:09:00', 'Aaron Sorkin', 'Cross Creek Pictures', 2, 2, 2),
  (57, 'Ghostbusters: Afterlife', '2021-11-19', 'When a single mom and her two kids arrive in a small town, they begin to discover their connection to the original Ghostbusters and the secret legacy their grandfather left behind.', 1080, INTERVAL'02:04:00', 'Jason Reitman', 'Columbia Pictures', 3, 2, 2),
  (58, 'Tenet', '2020-09-03', 'Armed with only one word -- Tenet -- and fighting for the survival of the entire world, the Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.', 1080, INTERVAL'02:30:00', 'Christopher Nolan', 'Warner Bros. Pictures', 4, 2, 2),
  (59, 'The Kissing Booth 2', '2020-07-24', 'In the sequel to 2018''s THE KISSING BOOTH, high school senior Elle juggles a long-distance relationship with her dreamy boyfriend Noah, college applications, and a new friendship with a handsome classmate that could change everything.', 1080, INTERVAL'02:10:00', 'Vince Marcello', 'Komixx Entertainment', 5, 2, 2),
  (60, 'Indiana Jones 5', '2022-06-29', 'The plot is unknown at this time.', 1080, INTERVAL'01:09:00', 'James Mangold', 'Lucasfilm Ltd.', 6, 2, 2),
  (61, 'Avatar 2', '2022-12-16', 'A sequel to Avatar (2009).', 1080, INTERVAL'01:09:00', 'James Cameron', '20th Century Studios', 7, 2, 2),
  (62, 'Halloween Ends', '2022-10-14', 'The saga of Michael Myers and Laurie Strode ends.', 1080, INTERVAL'01:09:00', 'David Gordon Green', 'Universal Pictures', 8, 2, 2),
  (63, 'Minions: The Rise of Gru', '2022-07-01', 'The untold story of one twelve-year-old''s dream to become the world''s greatest supervillain.', 1080, INTERVAL'01:09:00', 'Kyle Balda', 'Illumination Entertainment', 9, 2, 2),
  (64, 'John Wick: Chapter 4', '2022-05-27', 'Plot unknown.', 1080, INTERVAL'01:09:00', 'Chad Stahelski', 'Lionsgate', 1, 3, 2),
  (65, 'Killers of the Flower Moon', '2022-09-16', 'Members of the Osage tribe in the United States are murdered under mysterious circumstances in the 1920s sparking a major F.B.I. investigation involving J. Edgar Hoover.', 1080, INTERVAL'01:09:00', 'Martin Scorsese', 'Apple Studios', 2, 3, 2),
  (66, 'Don''t Worry Darling', '2022-11-23', 'A psychological thriller about a 1950s housewife whose reality begins to crack, revealing a disturbing truth underneath.', 1080, INTERVAL'01:09:00', 'Olivia Wilde', 'New Line Cinema', 3, 3, 2),
  (67, 'Nightmare Alley', '2021-12-17', 'An ambitious carny with a talent for manipulating people with a few well-chosen words hooks up with a female psychiatrist who is even more dangerous than he is.', 1080, INTERVAL'01:09:00', 'Guillermo del Toro', 'Searchlight Pictures', 4, 3, 2),
  (68, 'The French Dispatch', '2021-10-22', 'A love letter to journalists set in an outpost of an American newspaper in a fictional twentieth century French city that brings to life a collection of stories published in "The French Dispatch Magazine".', 1080, INTERVAL'01:48:00', 'Wes Anderson', 'Searchlight Pictures', 5, 3, 2),
  (69, 'Mission: Impossible 7', '2022-05-27', 'Seventh entry in the Mission: Impossible series.', 1080, INTERVAL'01:09:00', 'Christopher McQuarrie', 'Paramount Pictures', 6, 3, 2),
  (70, 'Black Adam', '2022-07-29', 'Plot unknown. The film will be a prequel focusing on Black Adam''s origin story, while also introducing the superhero team Justice Society of America.', 1080, INTERVAL'01:09:00', 'Jaume Collet-Serra', 'Warner Bros. Pictures', 7, 3, 2),
  (71, 'Salem''s Lot', '2023-05-23', 'A man who returns to his hometown to confront the sinister forces responsible for his mother''s death when he was a young boy.', 1080, INTERVAL '01:09:00', 'Gary Dauberman', 'New Line Cinema', 8, 3, 2),
  (72, 'Rumble', '2022-02-18', 'In a world where monster wrestling is a global sport and monsters are superstar athletes, teenage Winnie seeks to follow in her father''s footsteps by coaching a lovable underdog monster into a champion.', 1080, INTERVAL'01:09:00', 'Hamish Grieve', 'Paramount Animation', 9, 3, 2);er wrestling is a global sport and monsters are superstar athletes, teenage Winnie seeks to follow in her father''s footsteps by coaching a lovable underdog monster into a champion.', 1080, INTERVAL'01:09:00', 'Hamish Grieve', 'Paramount Animation', 9, 3, 3);

--5. tabel users
INSERT INTO users (id, nama, email, password) VALUES
(1, 'John Doe', 'johndoe@example.com', 'password1'),
(2, 'Jane Smith', 'janesmith@example.com', 'password2'),
(3, 'David Johnson', 'davidjohnson@example.com', 'password3'),
(4, 'Sarah Williams', 'sarahwilliams@example.com', 'password4'),
(5, 'Michael Brown', 'michaelbrown@example.com', 'password5'),
(6, 'Jennifer Davis', 'jenniferdavis@example.com', 'password6'),
(7, 'Christopher Miller', 'christophermiller@example.com', 'password7'),
(8, 'Jessica Wilson', 'jessicawilson@example.com', 'password8'),
(9, 'Matthew Taylor', 'matthewtaylor@example.com', 'password9'),
(10, 'Emily Anderson', 'emilyanderson@example.com', 'password10'),
(11, 'Daniel Thomas', 'danielthomas@example.com', 'password11'),
(12, 'Olivia Martinez', 'oliviamartinez@example.com', 'password12'),
(13, 'Andrew Clark', 'andrewclark@example.com', 'password13'),
(14, 'Emma Rodriguez', 'emmarodriguez@example.com', 'password14'),
(15, 'Joseph Lee', 'josephlee@example.com', 'password15'),
(16, 'Madison Walker', 'madisonwalker@example.com', 'password16'),
(17, 'Joshua Hall', 'joshuahall@example.com', 'password17'),
(18, 'Ava Green', 'avagreen@example.com', 'password18'),
(19, 'Christopher Adams', 'christopheradams@example.com', 'password19'),
(20, 'Sophia Campbell', 'sophiacampbell@example.com', 'password20'),
(21, 'Logan Hill', 'loganhill@example.com', 'password21'),
(22, 'Isabella Mitchell', 'isabellamitchell@example.com', 'password22'),
(23, 'Joseph Phillips', 'josephphillips@example.com', 'password23'),
(24, 'Mia Turner', 'miaturner@example.com', 'password24'),
(25, 'Ethan Carter', 'ethancarter@example.com', 'password25'),
(26, 'Charlotte Murphy', 'charlottemurphy@example.com', 'password26'),
(27, 'David Stewart', 'davidstewart@example.com', 'password27'),
(28, 'Abigail Rivera', 'abigailrivera@example.com', 'password28'),
(29, 'Alexander Coleman', 'alexandercoleman@example.com', 'password29'),
(30, 'Emily Barnes', 'emilybarnes@example.com', 'password30');

--6. tabel user_rating
INSERT INTO user_rating (id, rating, movie_id, users_id) VALUES
(1, 4, 1, 1),
(2, 3, 4, 1),
(3, 5, 3, 2),
(4, 4, 1, 2),
(5, 2, 4, 3),
(6, 4, 5, 3),
(7, 5, 6, 4),
(8, 3, 2, 4),
(9, 4, 7, 5),
(10, 2, 8, 5),
(11, 5, 9, 6),
(12, 3, 10, 6),
(13, 4, 11, 7),
(14, 2, 12, 7),
(15, 5, 13, 8),
(16, 4, 14, 8),
(17, 3, 15, 9),
(18, 2, 16, 9),
(19, 4, 17, 10),
(20, 5, 18, 10),
(21, 3, 19, 11),
(22, 4, 20, 11),
(23, 2, 21, 12),
(24, 5, 22, 12),
(25, 4, 23, 13),
(26, 3, 24, 13),
(27, 5, 25, 14),
(28, 2, 26, 14),
(29, 4, 27, 15),
(30, 3, 28, 15),
(31, 1, 29, 16),
(32, 3, 30, 16),
(33, 5, 31, 17),
(34, 4, 32, 17),
(35, 2, 33, 18),
(36, 4, 34, 18),
(37, 5, 35, 19),
(38, 3, 36, 19),
(39, 4, 37, 20),
(40, 2, 38, 20),
(41, 5, 39, 21),
(42, 4, 40, 21),
(43, 3, 41, 22),
(44, 4, 42, 22),
(45, 2, 43, 23),
(46, 5, 44, 23),
(47, 4, 45, 24),
(48, 3, 46, 24),
(49, 5, 47, 25),
(50, 2, 48, 25),
(51, 4, 49, 26),
(52, 3, 50, 26),
(53, 5, 51, 27),
(54, 4, 52, 27),
(55, 2, 53, 28),
(56, 4, 54, 28),
(57, 5, 55, 29),
(58, 3, 56, 29),
(59, 4, 57, 30),
(60, 2, 58, 30),
(61, 5, 59, 1),
(62, 4, 60, 1),
(63, 3, 61, 2),
(64, 4, 62, 2),
(65, 2, 63, 3),
(66, 5, 64, 3),
(67, 4, 65, 4),
(68, 3, 66, 4),
(69, 5, 67, 5),
(70, 2, 68, 5),
(71, 4, 69, 6),
(72, 3, 70, 6),
(73, 5, 71, 7),
(74, 4, 72, 7),
(75, 2, 1, 8),
(76, 4, 2, 8),
(77, 5, 3, 9),
(78, 3, 4, 9),
(79, 4, 5, 10),
(80, 2, 6, 10),
(81, 5, 7, 11),
(82, 4, 8, 11),
(83, 3, 9, 12),
(84, 4, 10, 12),
(85, 2, 11, 13),
(86, 5, 12, 13),
(87, 4, 13, 14),
(88, 3, 14, 14),
(89, 5, 15, 15),
(90, 2, 16, 15);

--7.bookmark
INSERT INTO bookmark (id, bookmark_status, users_id, movie_id) VALUES
(1, true, 17, 66),
(2, true, 3, 31),
(3, true, 10, 14),
(4, true, 29, 40),
(5, true, 20, 67),
(6, true, 25, 19),
(7, true, 18, 64),
(8, true, 22, 54),
(9, true, 5, 10),
(10, true, 4, 45),
(11, true, 26, 47),
(12, true, 27, 51),
(13, true, 2, 61),
(14, true, 13, 33),
(15, true, 11, 7),
(16, true, 24, 69),
(17, true, 30, 21),
(18, true, 1, 48),
(19, true, 14, 72),
(20, true, 15, 27),
(21, true, 12, 3),
(22, true, 6, 35),
(23, true, 16, 62),
(24, true, 9, 42),
(25, true, 28, 68),
(26, true, 7, 58),
(27, true, 8, 5),
(28, true, 23, 55),
(29, true, 21, 43),
(30, true, 19, 71),
(31, true, 15, 1),
(32, true, 28, 39),
(33, true, 18, 66),
(34, true, 6, 44),
(35, true, 24, 60),
(36, true, 4, 11),
(37, true, 14, 36),
(38, true, 12, 53),
(39, true, 23, 70),
(40, true, 17, 9),
(41, true, 30, 30),
(42, true, 5, 57),
(43, true, 7, 15),
(44, true, 20, 32),
(45, true, 11, 47),
(46, true, 25, 63),
(47, true, 10, 22),
(48, true, 2, 4),
(49, true, 19, 52),
(50, true, 22, 37),
(51, true, 29, 23),
(52, true, 26, 13),
(53, true, 16, 16),
(54, true, 27, 41),
(55, true, 13, 59),
(56, true, 9, 64),
(57, true, 1, 18),
(58, true, 3, 38),
(59, true, 8, 65),
(60, true, 21, 49),
(61, true, 28, 56),
(62, true, 15, 34),
(63, true, 12, 2),
(64, true, 30, 26),
(65, true, 18, 70),
(66, true, 14, 6),
(67, true, 10, 53),
(68, true, 23, 45),
(69, true, 24, 72),
(70, true, 5, 67),
(71, true, 17, 58),
(72, true, 4, 8),
(73, true, 26, 29),
(74, true, 6, 33),
(75, true, 2, 54),
(76, true, 25, 20),
(77, true, 7, 42),
(78, true, 12, 59),
(79, true, 21, 51),
(80, true, 11, 40),
(81, true, 27, 7),
(82, true, 13, 31),
(83, true, 30, 36),
(84, true, 20, 55),
(85, true, 28, 63),
(86, true, 19, 71),
(87, true, 15, 13),
(88, true, 1, 17),
(89, true, 14, 66),
(90, true, 22, 46),
(91, true, 10, 10),
(92, true, 4, 50),
(93, true, 29, 25),
(94, true, 5, 38),
(95, true, 24, 60),
(96, true, 18, 35),
(97, true, 17, 69),
(98, true, 6, 28),
(99, true, 27, 39),
(100, true, 3, 43),
(101, false, 9, 6),
(102, false, 20, 32),
(103, false, 1, 57),
(104, false, 14, 72),
(105, false, 10, 23),
(106, false, 15, 1),
(107, false, 28, 39),
(108, false, 5, 17),
(109, false, 17, 69),
(110, false, 6, 28),
(111, false, 27, 39),
(112, false, 3, 43),
(113, false, 12, 27),
(114, false, 7, 66),
(115, false, 21, 49),
(116, false, 25, 19),
(117, false, 11, 47),
(118, false, 2, 4),
(119, false, 16, 16),
(120, false, 24, 69),
(121, false, 4, 8),
(122, false, 13, 33),
(123, false, 30, 21),
(124, false, 22, 46),
(125, false, 9, 42),
(126, false, 19, 71),
(127, false, 8, 5),
(128, false, 23, 55),
(129, false, 28, 56),
(130, false, 15, 34),
(131, false, 17, 58),
(132, false, 30, 70),
(133, false, 1, 48),
(134, false, 14, 36),
(135, false, 13, 59),
(136, false, 20, 67),
(137, false, 27, 41),
(138, false, 12, 2),
(139, false, 5, 10),
(140, false, 29, 40),
(141, false, 18, 64),
(142, false, 26, 47),
(143, false, 21, 43),
(144, false, 3, 31),
(145, false, 25, 63),
(146, false, 7, 15),
(147, false, 4, 45),
(148, false, 10, 14),
(149, false, 22, 54),
(150, false, 6, 35);

--8. tabel comment
INSERT INTO comment (id, message, waktu_comment, users_id, movie_id) VALUES
(1, 'Great movie!', '2023-01-01 10:00:00', 5, 15),
(2, 'I loved the storyline!', '2023-01-02 12:30:00', 10, 35),
(3, 'Amazing cinematography!', '2023-01-03 15:45:00', 15, 50),
(4, 'The acting was top-notch.', '2023-01-04 17:20:00', 8, 20),
(5, 'This movie made me cry.', '2023-01-05 19:10:00', 3, 66),
(6, 'I was on the edge of my seat throughout the movie.', '2023-01-06 21:05:00', 16, 45),
(7, 'The soundtrack was incredible!', '2023-01-07 09:30:00', 7, 32),
(8, 'I would definitely recommend this movie!', '2023-01-08 11:45:00', 21, 55),
(9, 'The plot twist blew my mind!', '2023-01-09 14:20:00', 13, 23),
(10, 'The special effects were stunning.', '2023-01-10 16:55:00', 25, 48),
(11, 'I couldn''t stop laughing!', '2023-01-11 18:40:00', 4, 11),
(12, 'The performances were outstanding.', '2023-01-12 20:15:00', 19, 42),
(13, 'This movie left me speechless.', '2023-01-13 09:20:00', 2, 7),
(14, 'I enjoyed every minute of it!', '2023-01-14 11:10:00', 27, 38),
(15, 'The chemistry between the actors was amazing.', '2023-01-15 13:25:00', 12, 27),
(16, 'I was pleasantly surprised by this movie.', '2023-01-16 15:40:00', 18, 59),
(17, 'The dialogue was clever and witty.', '2023-01-17 17:15:00', 9, 17),
(18, 'I''m already planning to watch it again!', '2023-01-18 19:05:00', 24, 51),
(19, 'The cinematography was breathtaking.', '2023-01-19 21:00:00', 1, 36),
(20, 'The characters were so relatable.', '2023-01-20 09:45:00', 6, 29),
(21, 'I was hooked from the beginning.', '2023-01-21 12:00:00', 14, 47),
(22, 'The suspense kept me on the edge of my seat.', '2023-01-22 14:15:00', 20, 64),
(23, 'It''s a must-watch!', '2023-01-23 16:30:00', 11, 13),
(24, 'The movie had a powerful message.', '2023-01-24 18:25:00', 26, 41),
(25, 'The visual effects were mind-blowing.', '2023-01-25 20:40:00', 17, 56),
(26, 'I was completely immersed in the story.', '2023-01-26 09:10:00', 22, 33),
(27, 'The movie exceeded my expectations.', '2023-01-27 11:35:00', 5, 25),
(28, 'I couldn''t take my eyes off the screen.', '2023-01-28 13:50:00', 23, 53),
(29, 'The movie left me in awe.', '2023-01-29 16:05:00', 16, 22),
(30, 'I can''t wait to watch it again!', '2023-01-30 18:20:00', 7, 37);

--9. Tabel subscription
-- Subscription berstatus true (1 Juni - 30 Juni)
INSERT INTO subscription (id, start_date, end_date, status, users_id) VALUES
(1, '2023-06-01', '2023-06-30', true, 1),
(2, '2023-06-02', '2023-07-01', true, 2),
(3, '2023-06-03', '2023-07-02', true, 3),
(4, '2023-06-04', '2023-07-03', true, 4),
(5, '2023-06-05', '2023-07-04', true, 5),
(6, '2023-06-06', '2023-07-05', true, 6),
(7, '2023-06-07', '2023-07-06', true, 7),
(8, '2023-06-08', '2023-07-07', true, 8),
(9, '2023-06-09', '2023-07-08', true, 9),
(10, '2023-06-10', '2023-07-09', true, 10),
(11, '2023-06-11', '2023-07-10', true, 11),
(12, '2023-06-12', '2023-07-11', true, 12),
(13, '2023-06-13', '2023-07-12', true, 13),
(14, '2023-06-14', '2023-07-13', true, 14),
(15, '2023-06-15', '2023-07-14', true, 15);

-- Subscription berstatus false (di bawah 1 Juni)
INSERT INTO subscription (id, start_date, end_date, status, users_id) VALUES
(16, '2023-05-01', '2023-05-31', false, 16),
(17, '2023-05-02', '2023-06-01', false, 17),
(18, '2023-05-03', '2023-06-02', false, 18),
(19, '2023-05-04', '2023-06-03', false, 19),
(20, '2023-05-05', '2023-06-04', false, 20),
(21, '2023-05-06', '2023-06-05', false, 21),
(22, '2023-05-07', '2023-06-06', false, 22),
(23, '2023-05-08', '2023-06-07', false, 23),
(24, '2023-05-09', '2023-06-08', false, 24),
(25, '2023-05-10', '2023-06-09', false, 25),
(26, '2023-05-11', '2023-06-10', false, 26),
(27, '2023-05-12', '2023-06-11', false, 27),
(28, '2023-05-13', '2023-06-12', false, 28),
(29, '2023-05-14', '2023-06-13', false, 29),
(30, '2023-05-15', '2023-06-14', false, 30);

--10. Tabel payment_method
INSERT INTO payment_method (id, method) VALUES
(1, 'Kartu Kredit'),
(2, 'Transfer Bank'),
(3, 'E-Wallet');

--11. Tabel payment
INSERT INTO payment (id, payment_date, total, status, subscription_id, payment_method_id) VALUES
(1, '2023-06-01', 100000, true, 1, 1),
(2, '2023-06-02', 100000, true, 2, 1),
(3, '2023-06-03', 100000, true, 3, 1),
(4, '2023-06-04', 100000, true, 4, 1),
(5, '2023-06-05', 100000, true, 5, 1),
(6, '2023-06-06', 100000, true, 6, 1),
(7, '2023-06-07', 100000, true, 7, 1),
(8, '2023-06-08', 100000, true, 8, 1),
(9, '2023-06-09', 100000, true, 9, 1),
(10, '2023-06-10', 100000, true, 10, 1),
(11, '2023-06-11', 100000, true, 11, 1),
(12, '2023-06-12', 100000, true, 12, 1),
(13, '2023-06-13', 100000, true, 13, 1),
(14, '2023-06-14', 100000, true, 14, 1),
(15, '2023-06-15', 100000, true, 15, 1),
(16, '2023-06-01', 0, false, 16, 2),
(17, '2023-06-02', 0, false, 17, 2),
(18, '2023-06-03', 0, false, 18, 2),
(19, '2023-06-04', 0, false, 19, 2),
(20, '2023-06-05', 0, false, 20, 2),
(21, '2023-06-06', 0, false, 21, 2),
(22, '2023-06-07', 0, false, 22, 2),
(23, '2023-06-08', 0, false, 23, 2),
(24, '2023-06-09', 0, false, 24, 2),
(25, '2023-06-10', 0, false, 25, 2),
(26, '2023-06-11', 0, false, 26, 2),
(27, '2023-06-12', 0, false, 27, 2),
(28, '2023-06-13', 0, false, 28, 2),
(29, '2023-06-14', 0, false, 29, 2),
(30, '2023-06-15', 0, false, 30, 2),
(31, '2023-06-01', 0, false, 1, 3),
(32, '2023-06-02', 0, false, 2, 3),
(33, '2023-06-03', 0, false, 3, 3),
(34, '2023-06-04', 0, false, 4, 3),
(35, '2023-06-05', 0, false, 5, 3),
(36, '2023-06-06', 0, false, 6, 3),
(37, '2023-06-07', 0, false, 7, 3),
(38, '2023-06-08', 0, false, 8, 3),
(39, '2023-06-09', 0, false, 9, 3),
(40, '2023-06-10', 0, false, 10, 3),
(41, '2023-06-11', 0, false, 11, 3),
(42, '2023-06-12', 0, false, 12, 3),
(43, '2023-06-13', 0, false, 13, 3),
(44, '2023-06-14', 0, false, 14, 3),
(45, '2023-06-15', 0, false, 15, 3);

--12. likes dari UI.
INSERT INTO likes (id, like_status, users_id, movie_id) VALUES
(1, true, 7, 62),
(2, true, 11, 35),
(3, true, 19, 28),
(4, true, 2, 67),
(5, true, 24, 54),
(6, true, 30, 14),
(7, true, 6, 22),
(8, true, 15, 49),
(9, true, 27, 71),
(10, true, 10, 4),
(11, true, 26, 52),
(12, true, 12, 1),
(13, true, 13, 5),
(14, true, 25, 32),
(15, true, 17, 63),
(16, true, 9, 37),
(17, true, 23, 72),
(18, true, 8, 55),
(19, true, 20, 12),
(20, true, 29, 68),
(21, true, 21, 18),
(22, true, 3, 41),
(23, true, 1, 9),
(24, true, 14, 44),
(25, true, 16, 34),
(26, true, 28, 19),
(27, true, 4, 7),
(28, true, 18, 65),
(29, true, 22, 60),
(30, true, 5, 42),
(31, true, 30, 56),
(32, true, 7, 38),
(33, true, 26, 31),
(34, true, 9, 70),
(35, true, 1, 17),
(36, true, 17, 15),
(37, true, 12, 51),
(38, true, 25, 47),
(39, true, 13, 61),
(40, true, 3, 6),
(41, true, 11, 26),
(42, true, 29, 25),
(43, true, 20, 20),
(44, true, 10, 58),
(45, true, 19, 50),
(46, true, 16, 10),
(47, true, 6, 64),
(48, true, 8, 27),
(49, true, 27, 36),
(50, true, 22, 69),
(51, true, 5, 23),
(52, true, 14, 40),
(53, true, 4, 13),
(54, true, 28, 30),
(55, true, 18, 45),
(56, true, 30, 16),
(57, true, 2, 3),
(58, true, 21, 39),
(59, true, 23, 33),
(60, true, 15, 48),
(61, true, 9, 66),
(62, true, 17, 53),
(63, true, 12, 59),
(64, true, 1, 8),
(65, true, 10, 29),
(66, true, 19, 24),
(67, true, 13, 46),
(68, true, 16, 57),
(69, true, 6, 43),
(70, true, 22, 11),
(71, true, 5, 2),
(72, true, 27, 21),
(73, true, 8, 67),
(74, true, 30, 44),
(75, true, 11, 68),
(76, true, 21, 56),
(77, true, 4, 26),
(78, true, 17, 71),
(79, true, 3, 35),
(80, true, 14, 64),
(81, true, 28, 54),
(82, true, 9, 25),
(83, true, 10, 20),
(84, true, 22, 36),
(85, true, 5, 51),
(86, true, 12, 7),
(87, true, 30, 33),
(88, true, 1, 66),
(89, true, 19, 30),
(90, true, 6, 46),
(91, true, 13, 63),
(92, true, 16, 9),
(93, true, 27, 37),
(94, true, 8, 42),
(95, true, 11, 58),
(96, true, 17, 19),
(97, true, 21, 22),
(98, true, 14, 55),
(99, true, 28, 14),
(100, true, 4, 40),
(101, false, 7, 62),
(102, false, 11, 35),
(103, false, 19, 28),
(104, false, 2, 67),
(105, false, 24, 54),
(106, false, 30, 14),
(107, false, 6, 22),
(108, false, 15, 49),
(109, false, 27, 71),
(110, false, 10, 4),
(111, false, 26, 52),
(112, false, 12, 1),
(113, false, 13, 5),
(114, false, 25, 32),
(115, false, 17, 63),
(116, false, 9, 37),
(117, false, 23, 72),
(118, false, 8, 55),
(119, false, 20, 12),
(120, false, 29, 68),
(121, false, 21, 18),
(122, false, 3, 41),
(123, false, 1, 9),
(124, false, 14, 44),
(125, false, 16, 34),
(126, false, 28, 19),
(127, false, 4, 7),
(128, false, 18, 65),
(129, false, 22, 60),
(130, false, 5, 42),
(131, false, 30, 56),
(132, false, 7, 38),
(133, false, 26, 31),
(134, false, 9, 70),
(135, false, 1, 17),
(136, false, 17, 15),
(137, false, 12, 51),
(138, false, 25, 47),
(139, false, 13, 61),
(140, false, 3, 6),
(141, false, 11, 26),
(142, false, 29, 25),
(143, false, 20, 20),
(144, false, 10, 58),
(145, false, 19, 50),
(146, false, 16, 10),
(147, false, 6, 64),
(148, false, 8, 27),
(149, false, 27, 36),
(150, false, 22, 69);

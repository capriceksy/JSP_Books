DROP DATABASE books;

CREATE DATABASE books;
USE BOOKS;

CREATE TABLE user (
   user_pk INT AUTO_INCREMENT PRIMARY KEY,
   user_email VARCHAR(1000) NOT NULL,
   user_name VARCHAR(500) NOT NULL,
   user_password VARCHAR(500) NOT NULL,
   user_phone VARCHAR(500) NOT NULL,
   user_zipcode VARCHAR(500),
   user_address VARCHAR(2000),
   user_address_detail VARCHAR(2000),
   user_address_etc VARCHAR(2000),
   user_bank VARCHAR(1000),
   user_bank_account VARCHAR(1000)
);
CREATE TABLE admin (
   admin_pk INT AUTO_INCREMENT PRIMARY KEY,
   admin_email VARCHAR(1000) NOT NULL,
   admin_name VARCHAR(500) NOT NULL,
   admin_password VARCHAR(500) NOT NULL,
   admin_authorized VARCHAR(300),
   admin_expired VARCHAR(300)
);
CREATE TABLE post (
   post_pk INT AUTO_INCREMENT PRIMARY KEY,
   post_title VARCHAR(300) not null,
   post_text VARCHAR(1000) not null,
   post_owner int,
   post_created datetime default now(),
   post_viewed int default 0,
   FOREIGN KEY (post_owner) 
		REFERENCES user (user_pk)
);
CREATE TABLE post_files (
   post_file_pk BIGINT PRIMARY KEY,
   post_file_post_ownersystem VARCHAR(1000),
   post_file_origin VARCHAR(300),
   post_pk INT
);
CREATE TABLE post_notice (
   notice_pk INT AUTO_INCREMENT PRIMARY KEY,
   notice_pin enum('Y','N') default 'N' not null,
   post_pk INT,
   FOREIGN KEY (post_pk)
		REFERENCES post (post_pk)
);
CREATE TABLE post_event (
   event_pk INT AUTO_INCREMENT PRIMARY KEY,
   event_started VARCHAR(300),
   event_ended VARCHAR(300),
   event_like int default 0,
   post_pk INT,
   FOREIGN KEY (post_pk)
		REFERENCES post (post_pk)
);
-- CREATE TABLE book_genre (
--    book_genre_pk INT AUTO_INCREMENT PRIMARY KEY,
--    book_genre_name VARCHAR(300)
-- );
-- CREATE TABLE book_country (
--    book_country_pk INT AUTO_INCREMENT PRIMARY KEY,
--    book_country_name VARCHAR(300)
-- );
CREATE TABLE new_book (
   new_book_pk INT AUTO_INCREMENT PRIMARY KEY,
   new_book_title VARCHAR(300),
   new_book_subtitle VARCHAR(300),
   new_book_info TEXT,
   new_book_info_short TEXT,
   new_book_org_image VARCHAR(300),
   new_book_image VARCHAR(300),
   new_book_price VARCHAR(300),
   new_book_writer VARCHAR(300),
   new_book_translater VARCHAR(300),
   new_book_publisher VARCHAR(300),
   new_book_created VARCHAR(300),
   new_book_pages VARCHAR(300),
   new_book_mount VARCHAR(300),
   new_book_genre VARCHAR(300),
   new_book_country VARCHAR(300)
   -- FOREIGN KEY (new_book_genre)
   --    REFERENCES book_genre (book_genre_pk),
   -- FOREIGN KEY (new_book_country)
   --    REFERENCES book_country (book_country_pk)
);
CREATE TABLE old_book (
   new_book_pk INT,
   old_book_pk INT AUTO_INCREMENT PRIMARY KEY,
   old_book_discount INT,
   FOREIGN KEY (new_book_pk)
      REFERENCES new_book (new_book_pk)
);
CREATE TABLE album (
   album_pk INT AUTO_INCREMENT PRIMARY KEY,
   album_title VARCHAR(300),
   album_title_song VARCHAR(300),
   album_singer VARCHAR(300),
   album_release VARCHAR(300)
);

# INSERT 문

INSERT INTO user
(user_email,user_name,user_password,user_phone) VALUES
('dmswo0845@gmail.com','고결','1111','01071468059'),
('seungy98@gmail.com','권승연','1111','01066849394'),
('khyejin9796@gmail.com','권혜진','1111','01099177371'),
('igoodithief@naver.com','김명현','1111','01082174761'),
('tomset92@gmail.com','배효찬','1111','01023347936'),
('hollymolly@gmail.com','이민석','1111','01097818756'),
('tonke1234@naver.com','정병찬','1111','01030833187');
INSERT INTO admin
(admin_email,admin_name,admin_password) VALUES
('sample@gmail.com','샘플','1111');
INSERT INTO book_genre (book_genre_name) VALUES
('소설'),('시/에세이'),('경제/경영'),('자기계발'),('사회/과학'),
('역사/문화'),('인문'),('자연과학'),('어린이'),('문학'),
('경제인문'),('컴퓨터'),('기타');
INSERT INTO book_country (book_country_name) VALUES
('국내'),('국외');
DROP DATABASE IF EXISTS videoteque;
CREATE DATABASE videoteque;
USE videoteque;

CREATE TABLE addresses (
	aid			INT PRIMARY KEY AUTO_INCREMENT,
	country 	VARCHAR(15) NOT NULL,
	city	 	VARCHAR(20) NOT NULL,
	street	 	VARCHAR(20) NOT NULL,
	building	INT NOT NULL,
	apartment	INT,
	zipcode		varchar(6) NOT NULL
);

CREATE TABLE clients (
	cid			INT PRIMARY KEY AUTO_INCREMENT,
	first_name 	VARCHAR(15) NOT NULL,
	last_name 	VARCHAR(15) NOT NULL,
	phone_no 	VARCHAR(12) NOT NULL,
	email 		VARCHAR(30) NOT NULL,
	aid			INT NOT NULL,
	billing_aid	INT NOT NULL,
	CONSTRAINT clients_email_uk UNIQUE(email),
	CONSTRAINT clients_aid_fk FOREIGN KEY (aid) REFERENCES addresses(aid),
	CONSTRAINT clients_billing_aid_fk FOREIGN KEY (aid) REFERENCES addresses(aid)
);

CREATE TABLE videos (
	vid			INT PRIMARY KEY AUTO_INCREMENT,
	categorie 	VARCHAR(20) NOT NULL,
	price	 	DECIMAL(4,2) NOT NULL CHECK (price > 0),
	title	 	VARCHAR(30) NOT NULL,
	year 		INT(4) NOT NULL,
	director	VARCHAR(20) NOT NULL
);

CREATE TABLE orders (
	cid				INT NOT NULL FOREIGN KEY (cid) REFERENCES clients,
	vid				INT NOT NULL FOREIGN KEY (vid) REFERENCES videos,
	rent_duration 	INT CHECK (rent_duration IN (1, 3, 7)),
	order_date		DATE DEFAULT (now())
);
-- CREATE DATABASE
CREATE DATABASE CINEMA_TICKET_MANAGEMENT_SYSTEM
GO

DROP DATABASE CINEMA_TICKET_MANAGEMENT_SYSTEM

--CREATE TABLE 



-- Table: cinemas
CREATE TABLE cinemas (
    cinema_id INT identity(1, 1) PRIMARY KEY,
    cinema_name VARCHAR(255) NOT NULL,
    cinema_address VARCHAR(255) NOT NULL
);

-- Table: room
CREATE TABLE room (
    room_id INT PRIMARY KEY,
    cinema_id INT NOT NULL,
    room_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (cinema_id) REFERENCES cinemas(cinema_id)
);

-- Table: movies
CREATE TABLE movies (
    movie_id INT identity(1, 1) PRIMARY KEY,
    movie_name VARCHAR(255) NOT NULL,
    movie_description TEXT,
    movie_trailer VARCHAR(255),
    movie_cens VARCHAR(255),
    movie_genres VARCHAR(255),
    movie_release DATE,
    movie_length INT,
    movie_format VARCHAR(255)
);

-- Table: schedule
CREATE TABLE schedule (
    schedule_id INT PRIMARY KEY,
    movie_id INT NOT NULL,
    room_id INT NOT NULL,  
	schedule_date DATE NOT NULL,
    schedule_start TIME NOT NULL,
    schedule_end TIME NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (room_id) REFERENCES room(room_id)
);
CREATE TABLE run_time(
	run_time_id INT PRIMARY KEY NOT NULL,
	schedule_id INT,
	movie_id INT NOT NULL,
	run_time INT NOT NULL,
	FOREIGN KEY (schedule_id) REFERENCES schedule(schedule_id)
);


-- Table: seats
CREATE TABLE seats (
    seat_id INT PRIMARY KEY,    
    room_id INT NOT NULL,
    row CHAR(1) NOT NULL,
    number INT NOT NULL,
    FOREIGN KEY (room_id) REFERENCES room(room_id)
);

-- Table: users
CREATE TABLE users (
    user_id INT identity(1, 1) PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
	avatar varchar(255),
	role VARCHAR(10) NOT NULL,
    fullname nVARCHAR(255),
    birthday DATE,
    gender nvarchar,
    email VARCHAR(255),
    city VARCHAR(255),
    phone VARCHAR(50)
);



-- Table: booking
CREATE TABLE booking (
    booking_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    schedule_id INT NOT NULL,
    seat_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(schedule_id),
    FOREIGN KEY (seat_id) REFERENCES seats(seat_id)
);

--table: booking detail
CREATE TABLE booking_detail (
    booking__detail_id INT PRIMARY KEY,
    booking_id INT,
    schedule_id INT NOT NULL,
    seat_id INT NOT NULL,
	room_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
);


create table Food (
	food_id int identity(1, 1) primary key,
	food_name nvarchar(50) not null,
	describe nvarchar(100) not null,
	price int not null
);

-- INSERT DATA TO DATABASE
INSERT INTO cinemas (cinema_name, cinema_address)
VALUES
    ('F Ha Noi', 'Ha Noi'),
    ('F Ho Chi Minh', 'Ho Chi Minh City'),
    ('F Da Nang', 'Da Nang'),
    ('F Hai Phong', 'Hai Phong'),
    ('F Can Tho', 'Can Tho'),
    ('F Nha Trang', 'Nha Trang'),
    ('F Hue', 'Hue'),
    ('F Vung Tau', 'Vung Tau'),
    ('F Quy Nhon', 'Quy Nhon'),
    ('F Phan Thiet', 'Phan Thiet'),
    ('F Pleiku', 'Pleiku'),
    ('F Rach Gia', 'Rach Gia'),
    ('F My Tho', 'My Tho'),
    ('F Buon Ma Thuot', 'Buon Ma Thuot'),
    ('F Thai Nguyen', 'Thai Nguyen'),
    ('F Thanh Hoa', 'Thanh Hoa'),
    ('F Vinh', 'Vinh'),
    ('F Ha Long', 'Ha Long'),
    ('F Ninh Binh', 'Ninh Binh'),
    ('F Lao Cai', 'Lao Cai');
--INSERT ADMIN
INSERT INTO users(username,password,role)
VALUES('admin1','root1','admin'),
	  ('admin2','root2','admin'),
	  ('admin3','root3','admin');
--INSERT EMPLOYEE
INSERT INTO users(username,password,role)
VALUES('employee01','123456789','Employee')

INSERT INTO users(username,password,role)
VALUES('user1','123456789','user')
	


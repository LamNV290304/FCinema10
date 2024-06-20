-- CREATE DATABASE 
CREATE DATABASE CINEMA_TICKET_MANAGEMENT_SYSTEM
GO

DROP DATABASE CINEMA_TICKET_MANAGEMENT_SYSTEM

--CREATE TABLE 
-- Table: admin
CREATE TABLE admin (
    admin_id INT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
);


-- Table: cinemas
CREATE TABLE cinemas (
    cinema_id INT PRIMARY KEY,
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
    movie_id INT PRIMARY KEY,
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

-- Table: seats
CREATE TABLE seats (
    seat_id INT PRIMARY KEY,
    seat_type VARCHAR(255) NOT NULL,
    room_id INT NOT NULL,
    row CHAR(1) NOT NULL,
    number INT NOT NULL,
    FOREIGN KEY (room_id) REFERENCES room(room_id)
);

-- Table: users
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
	String role(5) NOT NULL;
    fullname VARCHAR(255) NOT NULL,
    birthday DATE,
    gender INT,
    email VARCHAR(255) NOT NULL,
    city VARCHAR(255),
    phone VARCHAR(50)
);



-- Table: booking
CREATE TABLE booking (
    booking_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    schedule_id INT NOT NULL,
    seat_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    seat_status VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(schedule_id),
    FOREIGN KEY (seat_id) REFERENCES seats(seat_id)
);

-- Table: employee
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    avatar VARCHAR(255),
    fullname VARCHAR(255) NOT NULL,
    birthday DATE,
    gender CHAR(1),
    email VARCHAR(255) NOT NULL,
    city VARCHAR(255),
    phone VARCHAR(50)
);


-- INSERT DATA TO DATABASE
INSERT INTO cinemas (cinema_id, cinema_name, cinema_address)
VALUES
    (1, 'F Ha Noi', 'Ha Noi'),
    (2, 'F Ho Chi Minh', 'Ho Chi Minh City'),
    (3, 'F Da Nang', 'Da Nang'),
    (4, 'F Hai Phong', 'Hai Phong'),
    (5, 'F Can Tho', 'Can Tho'),
    (6, 'F Nha Trang', 'Nha Trang'),
    (7, 'F Hue', 'Hue'),
    (8, 'F Vung Tau', 'Vung Tau'),
    (9, 'F Quy Nhon', 'Quy Nhon'),
    (10,'F Phan Thiet', 'Phan Thiet'),
    (11,'F Pleiku', 'Pleiku'),
    (12,'F Rach Gia', 'Rach Gia'),
    (13,'F My Tho', 'My Tho'),
    (14,'F Buon Ma Thuot', 'Buon Ma Thuot'),
    (15,'F Thai Nguyen', 'Thai Nguyen'),
    (16,'F Thanh Hoa', 'Thanh Hoa'),
    (17,'F Vinh', 'Vinh'),
    (18,'F Ha Long', 'Ha Long'),
    (19,'F Ninh Binh', 'Ninh Binh'),
    (20,'F Lao Cai', 'Lao Cai');

INSERT INTO admin(admin_id,username,password)
VALUES(1,'admin1','root1'),
	  (2,'admin2','root2'),
	  (3,'admin3','root3');

SELECT * FR

create database movie;
use movie;
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    language VARCHAR(50),
    duration INT,
    release_date DATE,
    genre_id INT,
    director_id INT
);
CREATE TABLE Actors (
    actor_id INT PRIMARY KEY AUTO_INCREMENT,
    actor_name VARCHAR(100),
    gender VARCHAR(10),
    dob DATE,
    nationality VARCHAR(50)
);
CREATE TABLE Directors (
    director_id INT PRIMARY KEY AUTO_INCREMENT,
    director_name VARCHAR(100),
    dob DATE,
    nationality VARCHAR(50)
);
CREATE TABLE Genres (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(50)
);
CREATE TABLE Theaters (
    theater_id INT PRIMARY KEY AUTO_INCREMENT,
    theater_name VARCHAR(100),
    city VARCHAR(50),
    address VARCHAR(200),
    phone VARCHAR(15)
);
CREATE TABLE Screens (
    screen_id INT PRIMARY KEY AUTO_INCREMENT,
    theater_id INT,
    screen_name VARCHAR(50),
    total_seats INT,
    FOREIGN KEY (theater_id) REFERENCES Theaters(theater_id)
);
CREATE TABLE Shows (
    show_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    screen_id INT,
    show_date DATE,
    show_time TIME,
    ticket_price DECIMAL(8,2),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (screen_id) REFERENCES Screens(screen_id)
);
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50)
);
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    show_id INT,
    booking_date DATE,
    total_amount DECIMAL(8,2),
    booking_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);
CREATE TABLE Tickets (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    seat_number VARCHAR(10),
    ticket_status VARCHAR(20),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);
INSERT INTO Genres (genre_name) VALUES
('Action'),
('Comedy'),
('Drama'),
('Horror'),
('Sci-Fi');
INSERT INTO Directors (director_name, dob, nationality) VALUES
('Lokesh Kanagaraj', '1986-03-14', 'Indian'),
('S. Shankar', '1963-08-17', 'Indian'),
('Atlee', '1986-09-21', 'Indian'),
('Christopher Nolan', '1970-07-30', 'British'),
('James Cameron', '1954-08-16', 'Canadian');
INSERT INTO Actors (actor_name, gender, dob, nationality) VALUES
('Vijay', 'Male', '1974-06-22', 'Indian'),
('Ajith Kumar', 'Male', '1971-05-01', 'Indian'),
('Nayanthara', 'Female', '1984-11-18', 'Indian'),
('Leonardo DiCaprio', 'Male', '1974-11-11', 'American'),
('Kate Winslet', 'Female', '1975-10-05', 'British');
INSERT INTO Movies (title, language, duration, release_date, genre_id, director_id) VALUES
('Leo', 'Tamil', 165, '2023-10-19', 1, 1),
('Enthiran', 'Tamil', 177, '2010-10-01', 5, 2),
('Jawan', 'Hindi', 170, '2023-09-07', 1, 3),
('Inception', 'English', 148, '2010-07-16', 5, 4),
('Titanic', 'English', 194, '1997-12-19', 3, 5);

INSERT INTO Theaters (theater_name, city, address, phone) VALUES
('PVR Cinemas', 'Chennai', 'Phoenix Mall', '9876543210'),
('INOX', 'Coimbatore', 'Brookefields Mall', '9876543211'),
('AGS Cinemas', 'Trichy', 'Central Bus Stand', '9876543212'),
('SPI Palazzo', 'Chennai', 'Forum Mall', '9876543213'),
('Cinepolis', 'Bangalore', 'Orion Mall', '9876543214');
INSERT INTO Screens (theater_id, screen_name, total_seats) VALUES
(1, 'Screen 1', 200),
(1, 'Screen 2', 150),
(2, 'Screen 1', 180),
(3, 'Screen 1', 220),
(4, 'Screen 3', 250);
INSERT INTO Shows (movie_id, screen_id, show_date, show_time, ticket_price) VALUES
(1, 1, '2026-08-10', '10:00:00', 180.00),
(2, 2, '2026-08-10', '13:30:00', 200.00),
(3, 3, '2026-08-10', '17:00:00', 220.00),
(4, 4, '2026-08-10', '20:00:00', 250.00),
(5, 5, '2026-08-10', '22:30:00', 300.00);
INSERT INTO Customers (customer_name, email, phone, city) VALUES
('Abinaya', 'abinaya@gmail.com', '9000011111', 'Trichy'),
('Rahul', 'rahul@gmail.com', '9000011112', 'Chennai'),
('Priya', 'priya@gmail.com', '9000011113', 'Coimbatore'),
('Arun', 'arun@gmail.com', '9000011114', 'Madurai'),
('Sneha', 'sneha@gmail.com', '9000011115', 'Salem');
INSERT INTO Bookings (customer_id, show_id, booking_date, total_amount, booking_status) VALUES
(1, 1, '2026-08-05', 360.00, 'Confirmed'),
(2, 2, '2026-08-05', 200.00, 'Confirmed'),
(3, 3, '2026-08-06', 440.00, 'Confirmed'),
(4, 4, '2026-08-06', 250.00, 'Pending'),
(5, 5, '2026-08-07', 600.00, 'Confirmed');
INSERT INTO Tickets (booking_id, seat_number, ticket_status) VALUES
(1, 'A1', 'Booked'),
(1, 'A2', 'Booked'),
(2, 'B5', 'Booked'),
(3, 'C10', 'Booked'),
(4, 'D15', 'Pending'),
(5, 'E20', 'Booked');

select m.title,g.genre_name from Movies m inner join Genres g on g.genre_id = m.movie_id;
select m.title,d.director_name from Movies m inner join Directors d on d.director_id = m.movie_id;
select m.title,a.actor_name from Movies m inner join Actors a on a.actor_id = m.movie_id;
select c.customer_name, m.title, t.theater_name from Customers c inner join Movies m inner join Theaters t on t.theater_id = m.movie_id = c.customer_id;
select c.customer_name, m.title, t.seat_number, s.ticket_price from Movies m inner join Customers c inner join Shows s inner join Tickets t on ticket_id = show_id = m.movie_id = c.customer_id;

select m.title, b.booking_id from Movies m left join Bookings b on b.booking_id = m.movie_id;
select c.customer_name, b.booking_id from Customers c right join Bookings b on b.booking_id = c.customer_id;

select c.customer_name, m.title, t.theater_name, s.show_time from 
Customers c inner join Movies m inner join Theaters t inner join Shows s
on c.customer_id=m.movie_id=t.theater_id=s.show_id;

select a.actor_name, m.title from Actors a left join Movies m on a.actor_id = m.movie_id;




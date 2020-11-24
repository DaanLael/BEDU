CREATE DATABASE IF NOT EXISTS bedu_test_2;
USE bedu_test_2;
CREATE TABLE IF NOT EXISTS users (
   id INT PRIMARY KEY, 
   genero VARCHAR(1), 
   edad INT, 
   ocup INT,
   cp VARCHAR(20)
);
# RETO 1
CREATE TABLE IF NOT EXISTS movies (
   id INT PRIMARY KEY, 
   title VARCHAR(80), 
   generos VARCHAR(80)
); 
CREATE TABLE IF NOT EXISTS ratings (
   userid INT, 
   movieid INT, 
   rating INT, 
   time_stamp BIGINT,
   FOREIGN KEY(userid) REFERENCES users(id),
   FOREIGN KEY (movieid) REFERENCES movies(id)
);

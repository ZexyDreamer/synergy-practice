-- Создание базы данных
CREATE DATABASE Tourism;

USE Tourism;

-- Таблица стран
CREATE TABLE Countries (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL UNIQUE,
    country_code VARCHAR(10) NOT NULL UNIQUE
);

-- Таблица типов туров
CREATE TABLE TourTypes (
    tour_type_id INT AUTO_INCREMENT PRIMARY KEY,
    tour_type_name VARCHAR(100) NOT NULL UNIQUE
);

-- Таблица услуг
CREATE TABLE Services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL UNIQUE
);

-- Таблица туров (таблица переменной информации)
CREATE TABLE Tours (
    tour_id INT AUTO_INCREMENT PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    number_of_people INT NOT NULL,
    country_id INT,
    tour_type_id INT,
    FOREIGN KEY (country_id) REFERENCES Countries (country_id),
    FOREIGN KEY (tour_type_id) REFERENCES TourTypes (tour_type_id)
);

-- Создание базы данных
CREATE DATABASE bank_db;
USE bank_db;

-- Таблица пользователей
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,  -- пароли должны храниться захешированными
    email VARCHAR(100) NOT NULL UNIQUE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Таблица счетов
CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    account_number VARCHAR(20) NOT NULL UNIQUE,
    balance DECIMAL(15, 2) DEFAULT 0.00,
    account_type ENUM('savings', 'checking', 'credit') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Таблица транзакций
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    transaction_type ENUM('deposit', 'withdrawal', 'transfer') NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description VARCHAR(255),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id) ON DELETE CASCADE
);

-- Таблица кредитов
CREATE TABLE loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    loan_amount DECIMAL(15, 2) NOT NULL,
    interest_rate DECIMAL(5, 2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM('active', 'completed', 'defaulted') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Таблица платежей по кредитам
CREATE TABLE loan_payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    loan_id INT NOT NULL,
    payment_amount DECIMAL(15, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description VARCHAR(255),
    FOREIGN KEY (loan_id) REFERENCES loans(loan_id) ON DELETE CASCADE
);

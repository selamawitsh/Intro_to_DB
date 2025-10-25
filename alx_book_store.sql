-- alx_book_store.sql
-- Database schema for Online Bookstore

CREATE DATABASE IF NOT EXISTS `alx_book_store`;
USE `alx_book_store`;

-- Create Authors Table
CREATE TABLE IF NOT EXISTS authors (
    author_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(215) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Create Books Table
CREATE TABLE IF NOT EXISTS books (
    book_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    CONSTRAINT fk_books_author FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Create Customers Table
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215),
    address TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Create Orders Table
CREATE TABLE IF NOT EXISTS `orders` (
    order_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Create Order_Details Table
CREATE TABLE IF NOT EXISTS order_details (
    orderdetailid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    CONSTRAINT fk_orderdetails_order FOREIGN KEY (order_id) REFERENCES `orders`(order_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_orderdetails_book FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

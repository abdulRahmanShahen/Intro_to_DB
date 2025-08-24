-- إنشاء قاعدة البيانات
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- جدول Authors
CREATE TABLE IF NOT EXISTS Authors (
  author_id INT NOT NULL AUTO_INCREMENT,
  author_name VARCHAR(215) NOT NULL,
  PRIMARY KEY (author_id)
) ENGINE=INNODB;

-- جدول Books
CREATE TABLE IF NOT EXISTS Books (
  book_id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(130) NOT NULL,
  author_id INT NOT NULL,
  price DOUBLE NOT NULL,
  publication_date DATE,
  PRIMARY KEY (book_id),
  INDEX idx_books_author_id (author_id),
  CONSTRAINT fk_books_authors
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
    ON UPDATE RESTRICT ON DELETE RESTRICT
) ENGINE=INNODB;

-- جدول Customers
CREATE TABLE IF NOT EXISTS Customers (
  customer_id INT NOT NULL AUTO_INCREMENT,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215) NOT NULL,
  address TEXT,
  PRIMARY KEY (customer_id)
) ENGINE=INNODB;

-- جدول Orders
CREATE TABLE IF NOT EXISTS Orders (
  order_id INT NOT NULL AUTO_INCREMENT,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  PRIMARY KEY (order_id),
  INDEX idx_orders_customer_id (customer_id),
  CONSTRAINT fk_orders_customers
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    ON UPDATE RESTRICT ON DELETE RESTRICT
) ENGINE=INNODB;

-- جدول Order_Details
CREATE TABLE IF NOT EXISTS Order_Details (
  orderdetailid INT NOT NULL AUTO_INCREMENT,
  order_id INT NOT NULL,
  book_id INT NOT NULL,
  quantity DOUBLE NOT NULL,
  PRIMARY KEY (orderdetailid),
  INDEX idx_order_details_order_id (order_id),
  INDEX idx_order_details_book_id (book_id),
  CONSTRAINT fk_order_details_orders
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
    ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT fk_order_details_books
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
    ON UPDATE RESTRICT ON DELETE RESTRICT
) ENGINE=INNODB;

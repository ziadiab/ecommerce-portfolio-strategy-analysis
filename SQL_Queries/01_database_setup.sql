-- Author: Ziad Diab
-- Project: Ecommerce Profitability Analysis
-- Tool: PostgreSQL

-- =====================================
-- DATABASE SETUP
-- =====================================

CREATE DATABASE ecommerce_project;

-- Table: products
CREATE TABLE orders (
    order_id BIGINT PRIMARY KEY,
    product_id BIGINT,
    customer_id BIGINT,
    price NUMERIC(10,2),
    order_date TIMESTAMP,
    shipping_date TIMESTAMP,
    quantity INT,
    payment_method_id INT,
    country_id INT,
    discount_amount NUMERIC(10,2),
    CONSTRAINT fk_product
        FOREIGN KEY(product_id)
        REFERENCES products(product_id)
);

-- Table: orders
CREATE TABLE orders (
    order_id BIGINT PRIMARY KEY,
    product_id BIGINT,
    customer_id BIGINT,
    price NUMERIC(10,2),
    order_date TIMESTAMP,
    shipping_date TIMESTAMP,
    quantity INT,
    payment_method_id INT,
    country_id INT,
    discount_amount NUMERIC(10,2),
    CONSTRAINT fk_product
        FOREIGN KEY(product_id)
        REFERENCES products(product_id)
);
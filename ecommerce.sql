-- Brand Table
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO brand (name) VALUES
('Nike'),
('Apple'),
('Samsung'),
('Adidas');


-- Product Category Table
CREATE TABLE product_category (
    product_category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO product_category (name) VALUES
('Clothing'),
('Electronics'),
('Footwear');


-- Product Table 
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(250) NOT NULL,
    description TEXT,
    base_price DECIMAL(10, 2) NOT NULL,
    brand_id INT,
    product_category_id INT,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id)
);

INSERT INTO product (name, description, base_price, brand_id, product_category_id) VALUES
('Air Max Sneakers', 'Comfortable sneakers for everyday wear.', 120.00, 1, 3),
('iPhone 14', 'Latest Apple smartphone with A15 chip.', 999.00, 2, 2),
('Galaxy Watch 5', 'Smartwatch with fitness tracking features.', 299.00, 3, 2),
('Running Shirt', 'Breathable athletic shirt.', 35.00, 4, 1);

-- PRODUCT IMAGE TABLE
CREATE TABLE product_image (
    product_image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO product_image (product_id, image_url) VALUES
(1, 'https://cdn.example.com/products/airmax1.jpg'),
(2, 'https://cdn.example.com/products/iphone14.jpg'),
(3, 'https://cdn.example.com/products/galaxywatch5.jpg'),
(4, 'https://cdn.example.com/products/runningshirt.jpg');


-- Color Table
CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    hex_value VARCHAR(7)
);

INSERT INTO color (name, hex_value) VALUES
('Black', '#000000'),
('White', '#FFFFFF'),
('Red', '#FF0000'),
('Blue', '#0000FF');


-- Size Category Table
CREATE TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100), NOT NULL
);

INSERT INTO size_category (name) VALUES
('Clothing Sizes'),
('Shoe Sizes');


-- Size Option Table
CREATE TABLE size_option (
    size_option_id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT,
    value VARCHAR(100) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

INSERT INTO size_option (size_category_id, value) VALUES
(1, 'S'),
(1, 'M'),
(1, 'L'),
(2, '42'),
(2, '44');


-- Product Variation Table 
CREATE TABLE product_variation (
    product_variation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

INSERT INTO product_variation (product_id, color_id, size_option_id) VALUES
(1, 1, 4),  -- Air Max, Black, size 42
(1, 2, 5),  -- Air Max, White, size 44
(4, 4, 2),  -- Running Shirt, Blue, size M
(4, 3, 3);  -- Running Shirt, Red, size L


-- Product Item Table
CREATE TABLE product_item (
    product_item_id INT AUTO_INCREMENT PRIMARY KEY,
    product_variation_id INT,
    sku VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    FOREIGN KEY (product_variation_id) REFERENCES product_variation(product_variation_id)
);

INSERT INTO product_item (product_variation_id, sku, price, stock_quantity) VALUES
(1, 'AM-BLK-42', 120.00, 50),
(2, 'AM-WHT-44', 125.00, 40),
(3, 'RS-BLU-M', 35.00, 100),
(4, 'RS-RED-L', 35.00, 80);


-- Attribute Category Table
CREATE TABLE attribute_category (
    attribute_category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO attribute_category (name) VALUES
('Physical'),
('Technical');


-- Attribute Type Table
CREATE TABLE attribute_type (
    attribute_type_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO attribute_type (name) VALUES
('text'),
('number'),
('boolean');


-- Product Attribute Table 
CREATE TABLE product_attribute (
    product_attribute_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    attribute_category_id INT,
    attribute_type_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);

INSERT INTO product_attribute (product_id, attribute_category_id, attribute_type_id, value) VALUES
(1, 1, 1, 'Rubber sole'),
(2, 2, 2, '128'),
(2, 2, 1, 'A15 Bionic'),
(3, 2, 3, 'true'),
(4, 1, 1, 'Polyester fabric');

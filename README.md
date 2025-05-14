![ChatGPT Image May 14, 2025, 09_30_46 PM](https://github.com/user-attachments/assets/fd79477f-b875-446c-a7ef-84a1dd11f5e1)
# E-Commerce Database

This project defines the schema and initial data for an e-commerce database. The database is designed to support an online store with products, brands, categories, variations, and attributes.

## Database Schema

The database consists of the following tables:

### 1. `brand`
Stores information about product brands.

- **Columns**:
  - `brand_id`: Primary key, auto-incremented.
  - `name`: Name of the brand.

### 2. `product_category`
Stores categories for products.

- **Columns**:
  - `product_category_id`: Primary key, auto-incremented.
  - `name`: Name of the category.

### 3. `product`
Stores details about products.

- **Columns**:
  - `product_id`: Primary key, auto-incremented.
  - `name`: Name of the product.
  - `description`: Description of the product.
  - `base_price`: Base price of the product.
  - `brand_id`: Foreign key referencing `brand(brand_id)`.
  - `product_category_id`: Foreign key referencing `product_category(product_category_id)`.

### 4. `product_image`
Stores image URLs for products.

- **Columns**:
  - `product_image_id`: Primary key, auto-incremented.
  - `product_id`: Foreign key referencing `product(product_id)`.
  - `image_url`: URL of the product image.

### 5. `color`
Stores available colors for products.

- **Columns**:
  - `color_id`: Primary key, auto-incremented.
  - `name`: Name of the color.
  - `hex_value`: Hexadecimal value of the color.

### 6. `size_category`
Stores categories for sizes (e.g., clothing sizes, shoe sizes).

- **Columns**:
  - `size_category_id`: Primary key, auto-incremented.
  - `name`: Name of the size category.

### 7. `size_option`
Stores size options for each size category.

- **Columns**:
  - `size_option_id`: Primary key, auto-incremented.
  - `size_category_id`: Foreign key referencing `size_category(size_category_id)`.
  - `value`: Size value (e.g., "S", "M", "42").

### 8. `product_variation`
Stores variations of products based on color and size.

- **Columns**:
  - `product_variation_id`: Primary key, auto-incremented.
  - `product_id`: Foreign key referencing `product(product_id)`.
  - `color_id`: Foreign key referencing `color(color_id)`.
  - `size_option_id`: Foreign key referencing `size_option(size_option_id)`.

### 9. `product_item`
Stores individual product items with stock and pricing information.

- **Columns**:
  - `product_item_id`: Primary key, auto-incremented.
  - `product_variation_id`: Foreign key referencing `product_variation(product_variation_id)`.
  - `sku`: Stock Keeping Unit.
  - `price`: Price of the product item.
  - `stock_quantity`: Quantity in stock.

### 10. `attribute_category`
Stores categories for product attributes (e.g., physical, technical).

- **Columns**:
  - `attribute_category_id`: Primary key, auto-incremented.
  - `name`: Name of the attribute category.

### 11. `attribute_type`
Stores types of attributes (e.g., text, number, boolean).

- **Columns**:
  - `attribute_type_id`: Primary key, auto-incremented.
  - `name`: Name of the attribute type.

### 12. `product_attribute`
Stores attributes for products.

- **Columns**:
  - `product_attribute_id`: Primary key, auto-incremented.
  - `product_id`: Foreign key referencing `product(product_id)`.
  - `attribute_category_id`: Foreign key referencing `attribute_category(attribute_category_id)`.
  - `attribute_type_id`: Foreign key referencing `attribute_type(attribute_type_id)`.

## Sample Data

The script includes sample data for all tables, such as:

- Brands: Nike, Apple, Samsung, Adidas.
- Categories: Clothing, Electronics, Footwear.
- Products: Air Max Sneakers, iPhone 14, Galaxy Watch 5, Running Shirt.
- Colors: Black, White, Red, Blue.
- Sizes: S, M, L, 42, 44.
- Product Variations: Air Max in Black (size 42), Running Shirt in Blue (size M).
- Attributes: Rubber sole, A15 Bionic chip, Polyester fabric.

## How to Use

1. Run the SQL script in your MySQL database to create the schema and populate the tables with sample data.
2. Use the database to manage products, variations, and attributes for an e-commerce application.

## ERD

Refer to the `ERD.png` file for the Entity-Relationship Diagram of the database.

## License

This project is open-source and available for educational and personal use.

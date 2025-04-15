
-- CRUD operations for the 'users' table
-- Create: Insert a new user into the 'users' table
INSERT INTO users (id, first_name, last_name, email, created_at)
VALUES (1, 'John', 'Doe', 'john.doe@example.com', NOW());

-- Read: Retrieve all users from the 'users' table
SELECT * FROM users;

-- Update: Update the email of a specific user
UPDATE users
SET email = 'john.newemail@example.com'
WHERE id = 1;

-- Delete: Remove a user from the 'users' table
DELETE FROM users
WHERE id = 1;

-- CRUD operations for the 'products' table
-- Create: Insert a new product into the 'products' table
INSERT INTO products (id, name, description, price, created_at)
VALUES (1, 'Product A', 'Description of Product A', 19.99, NOW());
-- Read: Retrieve all products from the 'products' table
SELECT * FROM products;
-- Update: Update the price of a specific product
UPDATE products
SET price = 24.99
WHERE id = 1;
-- Delete: Remove a product from the 'products' table
DELETE FROM products
WHERE id = 1;


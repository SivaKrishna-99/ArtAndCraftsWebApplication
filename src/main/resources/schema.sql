-- Create the artist table to store the artist's information
CREATE TABLE artist (
                        id BIGINT PRIMARY KEY AUTO_INCREMENT,
                        name VARCHAR(255) NOT NULL,
                        bio TEXT NOT NULL
);

-- Create the items table to store the list of art and crafts for sale
CREATE TABLE cart (
                      item_id BIGINT NOT NULL,
                      user_id BIGINT NOT NULL,
                      FOREIGN KEY (item_id) REFERENCES items(id),
                      FOREIGN KEY (user_id) REFERENCES users(id)

);

-- Create the cart table to store the items in the shopping cart for each user
CREATE TABLE items (
                       id BIGINT PRIMARY KEY AUTO_INCREMENT,
                       name VARCHAR(255) NOT NULL,
                       price DECIMAL(10, 2) NOT NULL
);
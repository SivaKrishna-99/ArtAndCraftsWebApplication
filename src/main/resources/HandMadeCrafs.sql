CREATE TABLE users (
                       user_id INT PRIMARY KEY AUTO_INCREMENT,
                       username VARCHAR(255) NOT NULL UNIQUE,
                       password VARCHAR(255) NOT NULL,
                       email VARCHAR(255) NOT NULL UNIQUE,
                       first_name VARCHAR(255) NOT NULL,
                       last_name VARCHAR(255) NOT NULL
);

CREATE TABLE art_and_crafts (
                                art_id INT PRIMARY KEY AUTO_INCREMENT,
                                user_id INT NOT NULL,
                                title VARCHAR(255) NOT NULL,
                                description TEXT,
                                price DECIMAL(10, 2) NOT NULL,
                                image VARCHAR(255),
                                FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE orders (
                        order_id INT PRIMARY KEY AUTO_INCREMENT,
                        user_id INT NOT NULL,
                        art_id INT NOT NULL,
                        quantity INT NOT NULL,
                        FOREIGN KEY (user_id) REFERENCES users(user_id),
                        FOREIGN KEY (art_id) REFERENCES art_and_crafts(art_id)
);

CREATE TABLE transactions (
                              transaction_id INT PRIMARY KEY AUTO_INCREMENT,
                              order_id INT NOT NULL,
                              amount DECIMAL(10, 2) NOT NULL,
                              FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO users (username, password, email, first_name, last_name) VALUES
                                                                         ("user1", "password1", "user1@example.com", "John", "Doe"),
                                                                         ("user2", "password2", "user2@example.com", "Jane", "Smith"),
                                                                         ("user3", "password3", "user3@example.com", "Tom", "Jones"),
                                                                         ("user4", "password4", "user4@example.com", "Samantha", "Parker");

INSERT INTO art_and_crafts (user_id, title, description, price, image) VALUES
                                                                           (1, "Painting 1", "A beautiful landscape painting", 100.00, "painting1.jpg"),
                                                                           (2, "Painting 2", "A colorful abstract painting", 120.00, "painting2.jpg"),
                                                                           (3, "Sculpture 1", "A unique sculpture made of wood", 150.00, "sculpture1.jpg"),
                                                                           (4, "Sculpture 2", "A delicate ceramic sculpture", 75.00, "sculpture2.jpg");

INSERT INTO orders (user_id, art_id, quantity) VALUES
                                                   (1, 1, 1),
                                                   (2, 2, 2),
                                                   (3, 3, 1),
                                                   (4, 4, 3);

INSERT INTO transactions (order_id, amount) VALUES
                                                (1, 100.00),
                                                (2, 240.00),
                                                (3, 150.00),
                                                (4, 225.00);


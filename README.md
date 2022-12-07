# ArtAndCraftsWebApplication


The ArtsAndCrafts web application is a platform for artists and crafters to sell their handmade creations.

## Features

- Browse the catalog of art and craft items for sale
- Add items to the shopping cart and adjust the quantities
- Checkout and make a purchase using a credit card or other payment methods
- View and manage the orders in the user account
- Admin functionality for managing the catalog, orders, and reports

## Requirements

- Java 8 or later
- Apache Maven 3.6 or later
- MySQL 5.7 or later

## Installation

1. Clone the repository: `git clone https://github.com/user/artsandcrafts.git`
2. Navigate to the project directory: `cd artsandcrafts`
3. Build the project: `mvn clean install`
4. Create the database and user:
   CREATE DATABASE artsandcrafts;
   CREATE USER 'artsandcrafts'@'localhost' IDENTIFIED BY 'password';
   GRANT ALL PRIVILEGES ON artsandcrafts.* TO 'artsandcrafts'@'localhost';

Copy code
5. Import the data: `mysql -u artsandcrafts -p artsandcrafts < data/data.sql`
6. Update the database settings in `src/main/resources/application.properties`
7. Run the application: `mvn spring-boot:run`
8. Open the application in a web browser at http://localhost:8080

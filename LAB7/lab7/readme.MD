# Course Management Application

This README provides detailed instructions on how to set up and run the Course Management application. The setup involves running a MySQL database using Docker, initializing the database schema with TablePlus, and starting both the server and client parts of the application.

## Prerequisites

Before you start, make sure you have the following installed:
- Docker
- Node.js
- npm (Node Package Manager)
- TablePlus (or any other SQL client)

## Setup Instructions

### Step 1: Start MySQL Database with Docker

1. Open your Docker application.
2. Ensure Docker is running and then execute the following command to start a MySQL container:
```bash
docker run --name mysql-course -e MYSQL_ROOT_PASSWORD=my-secret-pw -p 3306:3306 -d mysql:latest
```
Replace my-secret-pw with your desired root password. This command will pull the latest MySQL image if it's not already present and run it in a container.

### Step 2: Initialize Database Schema
1. Open TablePlus or your preferred SQL client.
2. Connect to the MySQL server running in Docker:
``` bash
Host: localhost
User: root
Password: my-secret-pw (or the password you set)
Port: 3306
```
3. Once connected, create a new database named course_management.
4. Use the file WADlab07.sql located in the server folder to create and populate the tables in the newly created database.

### Step 3: Start the Server
Navigate to the server directory and install dependencies, then start the server:

``` bash
cd server
npm install
npm start
```
This will start the backend server, typically on port 4000.

### Step 4: Start the Client
Open a new terminal window, navigate to the client directory, install dependencies, and start the React application:

``` bash
cd client
npm install
npm start
```
This will start the frontend client, typically accessible at http://localhost:3000.


### Accessing the Application
After starting both the server and the client, you can access the application by navigating to http://localhost:3000 in your web browser.

### Conclusion
Enjoy managing courses with your new application! If you encounter any issues, please check that all steps were followed correctly, or revisit the configuration settings.


### Instructions on How to Use This README.md:

1. **Create a New File**: In your project's root directory (where your `server` and `client` directories are located), create a new file named `README.md`.
2. **Copy and Paste**: Copy the markdown content provided above and paste it into the `README.md` file.
3. **Save the File**: Save the changes to the `README.md` file.
4. **Use Git**: If you're using Git, add and commit this file to your repository to keep track of changes.

This `README.md` provides a clear, step-by-step guide that anyone can follow to set up and run your application locally.
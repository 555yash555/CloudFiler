# CloudFiler: Your Secure File Management Solution

Welcome to **CloudFiler**, a robust file management application designed to securely handle file uploads, management, and sharing using AWS S3. With built-in user authentication, caching, and database support, CloudFiler ensures your files are managed efficiently and securely.

## 🌟 Features

- **User Authentication**: Secure registration and login with JWT tokens.
- **File Upload & Management**: Seamlessly upload and manage files stored in AWS S3.
- **File Sharing**: Easily generate and share public URLs for your files.
- **Advanced Search**: Search files by name, type, or upload date.
- **Caching**: Enhance performance with Redis caching for file metadata.

## 🛠 Prerequisites

Ensure you have the following installed:

- Docker and Docker Compose
- AWS account with access to S3
- PostgreSQL and Redis for local development

## 🚀 Getting Started

### Step 1: Set Up Environment Variables

Create a `.env` file in the root directory with the following content. This file will hold your configuration settings:

```plaintext
PORT=8080
DB_HOST=localhost
DB_PORT=5433
DB_USER=postgres
DB_PASSWORD=1234
DB_NAME=postgres
AWS_REGION=eu-north-1
S3_BUCKET=gobucketfile
REDIS_ADDR=172.21.22.102:6379
REDIS_PASSWORD=1234
JWT_SECRET=magic_pawns
aws_access_key_id=YOUR_AWS_ACCESS_KEY_ID
aws_secret_access_key=YOUR_AWS_SECRET_ACCESS_KEY
```

**Note**: Replace `YOUR_AWS_ACCESS_KEY_ID` and `YOUR_AWS_SECRET_ACCESS_KEY` with your actual AWS credentials.

### Step 2: Run with Docker

1. **Pull the Docker Image**

   Download the pre-built Docker image from Docker Hub:

   ```bash
   docker pull 555yash555/cloudfiler
   ```

2. **Start the Application**

   Use Docker Compose to set up and run the application along with its dependencies:

   ```bash
   docker-compose up
   ```

   This command will launch the application on port 8080 and start the necessary Redis and PostgreSQL services.

### Step 3: Access the Application

Once the application is running, open your browser and navigate to `http://localhost:8080` to start using CloudFiler.

## 🌐 API Endpoints

### Authentication

- **Register a New User**
  - **POST** `/register`
  - **Request Body**: `{ "email": "user@example.com", "password": "password" }`

- **User Login**
  - **POST** `/login`
  - **Request Body**: `{ "email": "user@example.com", "password": "password" }`

### File Operations

- **Upload a File**
  - **POST** `/upload`
  - **Authentication Required**
  - **Form Data**: `file` (the file to upload)

- **List User Files**
  - **GET** `/files`
  - **Authentication Required**

- **Share a File**
  - **GET** `/share/{file_id}`
  - **Authentication Required**

- **Search Files**
  - **GET** `/search`
  - **Authentication Required**
  - **Query Parameters**: `name`, `type`, `date`

## 📁 Project Structure

- **main.go**: Main entry point of the application.
- **internal/auth**: Handles authentication logic using JWT.
- **internal/db**: Manages database connections and models.
- **internal/files**: Contains logic for file upload, management, and search.
- **internal/cache**: Implements Redis caching functionality.
- **internal/handlers**: Defines HTTP handlers for API routes.
- **internal/utils**: Utility functions for consistent response formatting.
- **scripts/migrate.sql**: SQL script for setting up the database schema.
- **Dockerfile**: Configuration for building the Docker image.
- **docker-compose.yml**: Configuration for Docker Compose to manage multi-container setups.

## 🔒 Security Considerations

- **Protect Your Secrets**: Keep your AWS credentials and JWT secret secure. Avoid exposing them in public repositories.
- **Environment Management**: Use environment variables to manage sensitive information securely.


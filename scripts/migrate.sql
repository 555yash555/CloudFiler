CREATE TABLE files (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    file_name VARCHAR(255) NOT NULL,
    upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    size BIGINT NOT NULL,
    s3_url VARCHAR(255) NOT NULL
);
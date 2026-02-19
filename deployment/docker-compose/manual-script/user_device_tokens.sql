CREATE TABLE user_device_tokens(
    id SERIAL PRIMARY KEY,
    user_id VARCHAR(100) NOT NULL,
    fcm_token TEXT NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
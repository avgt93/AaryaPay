CREATE TABLE Users (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    photo_url VARCHAR(255),
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    is_verified BOOLEAN DEFAULT false NOT NULL,
    two_factor_auth VARCHAR(255),
    last_sync TIMESTAMP,
    created_at TIMESTAMP DEFAULT NOW()
);

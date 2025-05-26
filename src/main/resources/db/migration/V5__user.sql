CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name varchar(10) NOT NULL,
    password varchar(100) NOT NULL,
    role varchar(10) NOT NULL CHECK ( role IN ('Administrator', 'User') )
)
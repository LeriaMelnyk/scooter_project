CREATE TABLE vehicles (
                          id SERIAL PRIMARY KEY,
                          type VARCHAR(10) NOT NULL CHECK (type IN ('SCOOTER', 'BIKE')),
                          model VARCHAR(100) NOT NULL,
                          available BOOLEAN NOT NULL DEFAULT TRUE,
                          current_location VARCHAR(255),
                          battery_level INT CHECK (battery_level BETWEEN 0 AND 100)
);

CREATE TABLE routes (
                        id SERIAL PRIMARY KEY,
                        start_point VARCHAR(100) NOT NULL,
                        end_point VARCHAR(100) NOT NULL,
                        distance_km NUMERIC(5, 2) NOT NULL,
                        difficulty_level VARCHAR(10) NOT NULL CHECK (difficulty_level IN ('EASY', 'MEDIUM', 'HARD'))
);

CREATE TABLE vehicle_route (
                               vehicle_id INT REFERENCES vehicles(id) ON DELETE CASCADE,
                               route_id INT REFERENCES routes(id) ON DELETE CASCADE,
                               PRIMARY KEY (vehicle_id, route_id)
);

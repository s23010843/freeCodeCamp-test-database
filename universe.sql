-- Step 1: Create the database
CREATE DATABASE IF NOT EXISTS celestial_bodies_db;
USE celestial_bodies_db;

-- Step 2: Create celestial_bodies table (to store planets, moons, and stars)
CREATE TABLE IF NOT EXISTS celestial_bodies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL, -- 'Planet', 'Moon', 'Star', etc.
    description TEXT,
    mass DECIMAL(15, 5),
    diameter DECIMAL(15, 5),
    distance_from_sun DECIMAL(15, 5) -- in millions of kilometers
);

-- Step 3: Create orbits table (to store relationships between planets and moons)
CREATE TABLE IF NOT EXISTS orbits (
    id INT AUTO_INCREMENT PRIMARY KEY,
    planet_id INT, -- Foreign key to celestial_bodies table (planet)
    moon_id INT, -- Foreign key to celestial_bodies table (moon)
    orbit_distance DECIMAL(15, 5), -- Distance of the moon from the planet (in km)
    FOREIGN KEY (planet_id) REFERENCES celestial_bodies(id),
    FOREIGN KEY (moon_id) REFERENCES celestial_bodies(id)
);

-- Step 4: Insert planets (example data)
INSERT INTO celestial_bodies (name, type, description, mass, diameter, distance_from_sun)
VALUES 
    ('Earth', 'Planet', 'The third planet from the Sun and the only one known to support life.', 5.972, 12742, 149.6),
    ('Mars', 'Planet', 'The fourth planet from the Sun, known as the Red Planet.', 0.64171, 6779, 227.9),
    ('Jupiter', 'Planet', 'The fifth planet from the Sun, the largest planet in the Solar System.', 1898.19, 139820, 778.5),
    ('Saturn', 'Planet', 'The sixth planet from the Sun, known for its beautiful rings.', 568.34, 116460, 1433.5);

-- Step 5: Insert moons (example data)
INSERT INTO celestial_bodies (name, type, description, mass, diameter, distance_from_sun)
VALUES 
    ('Moon', 'Moon', 'Earth\'s only natural satellite.', 0.073, 3474.8, 384.4),
    ('Phobos', 'Moon', 'One of Mars\' moons, the closest to Mars.', 0.0001, 22.4, 9377.0),
    ('Deimos', 'Moon', 'The second moon of Mars, smaller and farther than Phobos.', 0.00006, 12.4, 23460.0),
    ('Europa', 'Moon', 'One of Jupiter\'s moons, known for its icy surface.', 0.0048, 3121.6, 670900.0),
    ('Titan', 'Moon', 'The largest moon of Saturn, with a thick atmosphere.', 1.3452, 5150.0, 1221900.0);

-- Step 6: Link moons to their respective planets (orbits)
INSERT INTO orbits (planet_id, moon_id, orbit_distance)
VALUES 
    ((SELECT id FROM celestial_bodies WHERE name = 'Earth'), (SELECT id FROM celestial_bodies WHERE name = 'Moon'), 384400),
    ((SELECT id FROM celestial_bodies WHERE name = 'Mars'), (SELECT id FROM celestial_bodies WHERE name = 'Phobos'), 9377),
    ((SELECT id FROM celestial_bodies WHERE name = 'Mars'), (SELECT id FROM celestial_bodies WHERE name = 'Deimos'), 23460),
    ((SELECT id FROM celestial_bodies WHERE name = 'Jupiter'), (SELECT id FROM celestial_bodies WHERE name = 'Europa'), 670900),
    ((SELECT id FROM celestial_bodies WHERE name = 'Saturn'), (SELECT id FROM celestial_bodies WHERE name = 'Titan'), 1221900);

-- Step 7: Additional sample data for other celestial bodies (like stars)
INSERT INTO celestial_bodies (name, type, description, mass, diameter, distance_from_sun)
VALUES 
    ('Sun', 'Star', 'The star at the center of our Solar System.', 1989000, 1392000, 0);

-- Step 8: Example Queries (Optional to include)
-- These queries are just for reference, you can remove or execute them after the database is created.
-- Query: Get all planets
SELECT * FROM celestial_bodies WHERE type = 'Planet';

-- Query: Get moons of Mars
SELECT b.name AS moon_name, o.orbit_distance
FROM celestial_bodies b
JOIN orbits o ON b.id = o.moon_id
JOIN celestial_bodies p ON o.planet_id = p.id
WHERE p.name = 'Mars';

-- Query: Get the planet with the most moons
SELECT p.name, COUNT(o.moon_id) AS moon_count
FROM celestial_bodies p
JOIN orbits o ON p.id = o.planet_id
GROUP BY p.name
ORDER BY moon_count DESC
LIMIT 1;
-- Step 1: Create the database
CREATE DATABASE IF NOT EXISTS celestial_bodies_db;
USE celestial_bodies_db;

-- Step 2: Create celestial_bodies table (to store planets, moons, and stars)
CREATE TABLE IF NOT EXISTS celestial_bodies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL, -- 'Planet', 'Moon', 'Star', etc.
    description TEXT,
    mass DECIMAL(15, 5),
    diameter DECIMAL(15, 5),
    distance_from_sun DECIMAL(15, 5) -- in millions of kilometers
);

-- Step 3: Create orbits table (to store relationships between planets and moons)
CREATE TABLE IF NOT EXISTS orbits (
    id INT AUTO_INCREMENT PRIMARY KEY,
    planet_id INT, -- Foreign key to celestial_bodies table (planet)
    moon_id INT, -- Foreign key to celestial_bodies table (moon)
    orbit_distance DECIMAL(15, 5), -- Distance of the moon from the planet (in km)
    FOREIGN KEY (planet_id) REFERENCES celestial_bodies(id),
    FOREIGN KEY (moon_id) REFERENCES celestial_bodies(id)
);

-- Step 4: Insert planets (example data)
INSERT INTO celestial_bodies (name, type, description, mass, diameter, distance_from_sun)
VALUES 
    ('Earth', 'Planet', 'The third planet from the Sun and the only one known to support life.', 5.972, 12742, 149.6),
    ('Mars', 'Planet', 'The fourth planet from the Sun, known as the Red Planet.', 0.64171, 6779, 227.9),
    ('Jupiter', 'Planet', 'The fifth planet from the Sun, the largest planet in the Solar System.', 1898.19, 139820, 778.5),
    ('Saturn', 'Planet', 'The sixth planet from the Sun, known for its beautiful rings.', 568.34, 116460, 1433.5);

-- Step 5: Insert moons (example data)
INSERT INTO celestial_bodies (name, type, description, mass, diameter, distance_from_sun)
VALUES 
    ('Moon', 'Moon', 'Earth\'s only natural satellite.', 0.073, 3474.8, 384.4),
    ('Phobos', 'Moon', 'One of Mars\' moons, the closest to Mars.', 0.0001, 22.4, 9377.0),
    ('Deimos', 'Moon', 'The second moon of Mars, smaller and farther than Phobos.', 0.00006, 12.4, 23460.0),
    ('Europa', 'Moon', 'One of Jupiter\'s moons, known for its icy surface.', 0.0048, 3121.6, 670900.0),
    ('Titan', 'Moon', 'The largest moon of Saturn, with a thick atmosphere.', 1.3452, 5150.0, 1221900.0);

-- Step 6: Link moons to their respective planets (orbits)
INSERT INTO orbits (planet_id, moon_id, orbit_distance)
VALUES 
    ((SELECT id FROM celestial_bodies WHERE name = 'Earth'), (SELECT id FROM celestial_bodies WHERE name = 'Moon'), 384400),
    ((SELECT id FROM celestial_bodies WHERE name = 'Mars'), (SELECT id FROM celestial_bodies WHERE name = 'Phobos'), 9377),
    ((SELECT id FROM celestial_bodies WHERE name = 'Mars'), (SELECT id FROM celestial_bodies WHERE name = 'Deimos'), 23460),
    ((SELECT id FROM celestial_bodies WHERE name = 'Jupiter'), (SELECT id FROM celestial_bodies WHERE name = 'Europa'), 670900),
    ((SELECT id FROM celestial_bodies WHERE name = 'Saturn'), (SELECT id FROM celestial_bodies WHERE name = 'Titan'), 1221900);

-- Step 7: Additional sample data for other celestial bodies (like stars)
INSERT INTO celestial_bodies (name, type, description, mass, diameter, distance_from_sun)
VALUES 
    ('Sun', 'Star', 'The star at the center of our Solar System.', 1989000, 1392000, 0);

-- Step 8: Example Queries (Optional to include)
-- These queries are just for reference, you can remove or execute them after the database is created.
-- Query: Get all planets
SELECT * FROM celestial_bodies WHERE type = 'Planet';

-- Query: Get moons of Mars
SELECT b.name AS moon_name, o.orbit_distance
FROM celestial_bodies b
JOIN orbits o ON b.id = o.moon_id
JOIN celestial_bodies p ON o.planet_id = p.id
WHERE p.name = 'Mars';

-- Query: Get the planet with the most moons
SELECT p.name, COUNT(o.moon_id) AS moon_count
FROM celestial_bodies p
JOIN orbits o ON p.id = o.planet_id
GROUP BY p.name
ORDER BY moon_count DESC
LIMIT 1;

-- Create the database
CREATE DATABASE universe;
\c universe;

-- Create the galaxy table
CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  galaxy_type TEXT NOT NULL,
  age_in_millions_of_years INT NOT NULL,
  distance_from_earth NUMERIC NOT NULL,
  has_life BOOLEAN NOT NULL
);

-- Insert at least 6 galaxies
INSERT INTO galaxy (name, galaxy_type, age_in_millions_of_years, distance_from_earth, has_life) VALUES
('Milky Way', 'Spiral', 13600, 0.0, TRUE),
('Andromeda', 'Spiral', 10000, 2537000, FALSE),
('Triangulum', 'Spiral', 9000, 3000000, FALSE),
('Whirlpool', 'Spiral', 8000, 23000000, FALSE),
('Sombrero', 'Elliptical', 10000, 29000000, FALSE),
('Large Magellanic Cloud', 'Irregular', 7000, 163000, FALSE);

-- Create the star table
CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  galaxy_id INT REFERENCES galaxy(galaxy_id) NOT NULL,
  mass NUMERIC NOT NULL,
  is_spherical BOOLEAN NOT NULL,
  temperature INT NOT NULL
);

-- Insert at least 6 stars
INSERT INTO star (name, galaxy_id, mass, is_spherical, temperature) VALUES
('Sun', 1, 1.989e30, TRUE, 5778),
('Proxima Centauri', 1, 0.122e30, TRUE, 3042),
('Sirius', 1, 2.02e30, TRUE, 9940),
('Betelgeuse', 1, 11.6e30, TRUE, 3500),
('Alpha Centauri A', 1, 1.1e30, TRUE, 5790),
('Rigel', 1, 18e30, TRUE, 11000);

-- Create the planet table
CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  star_id INT REFERENCES star(star_id) NOT NULL,
  has_life BOOLEAN NOT NULL,
  planet_type TEXT NOT NULL,
  radius_km INT NOT NULL,
  is_spherical BOOLEAN NOT NULL
);

-- Insert at least 12 planets
INSERT INTO planet (name, star_id, has_life, planet_type, radius_km, is_spherical) VALUES
('Earth', 1, TRUE, 'Terrestrial', 6371, TRUE),
('Mars', 1, FALSE, 'Terrestrial', 3389, TRUE),
('Jupiter', 1, FALSE, 'Gas Giant', 69911, TRUE),
('Saturn', 1, FALSE, 'Gas Giant', 58232, TRUE),
('Neptune', 1, FALSE, 'Ice Giant', 24622, TRUE),
('Uranus', 1, FALSE, 'Ice Giant', 25362, TRUE),
('Venus', 1, FALSE, 'Terrestrial', 6052, TRUE),
('Mercury', 1, FALSE, 'Terrestrial', 2439, TRUE),
('Kepler-22b', 2, FALSE, 'Exoplanet', 24500, TRUE),
('Proxima b', 2, FALSE, 'Exoplanet', 7160, TRUE),
('TRAPPIST-1e', 2, FALSE, 'Exoplanet', 5790, TRUE),
('TRAPPIST-1f', 2, FALSE, 'Exoplanet', 5820, TRUE);

-- Create the moon table
CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  planet_id INT REFERENCES planet(planet_id) NOT NULL,
  diameter_km INT NOT NULL,
  has_atmosphere BOOLEAN NOT NULL,
  is_spherical BOOLEAN NOT NULL
);

-- Insert at least 20 moons
INSERT INTO moon (name, planet_id, diameter_km, has_atmosphere, is_spherical) VALUES
('Moon', 1, 3474, FALSE, TRUE),
('Phobos', 2, 22, FALSE, FALSE),
('Deimos', 2, 12, FALSE, FALSE),
('Io', 3, 3643, TRUE, TRUE),
('Europa', 3, 3121, TRUE, TRUE),
('Ganymede', 3, 5268, TRUE, TRUE),
('Callisto', 3, 4821, TRUE, TRUE),
('Titan', 4, 5150, TRUE, TRUE),
('Enceladus', 4, 504, TRUE, TRUE),
('Mimas', 4, 396, FALSE, TRUE),
('Triton', 5, 2706, TRUE, TRUE),
('Oberon', 6, 1522, FALSE, TRUE),
('Titania', 6, 1577, FALSE, TRUE),
('Ariel', 6, 1158, FALSE, TRUE),
('Umbriel', 6, 1169, FALSE, TRUE),
('Miranda', 6, 471, FALSE, TRUE),
('Charon', 8, 1212, FALSE, TRUE),
('Nix', 8, 49, FALSE, FALSE),
('Hydra', 8, 61, FALSE, FALSE),
('Kerberos', 8, 19, FALSE, FALSE);

-- Create a fifth table: planet_types
CREATE TABLE planet_types (
  planet_type_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  description TEXT NOT NULL,
  is_common BOOLEAN NOT NULL,
  avg_radius INT NOT NULL
);

-- Insert data into planet_types
INSERT INTO planet_types (name, description, is_common, avg_radius) VALUES
('Terrestrial', 'Rocky surface planets like Earth and Mars.', TRUE, 6000),
('Gas Giant', 'Massive planets with thick atmospheres like Jupiter.', TRUE, 70000),
('Ice Giant', 'Gas planets with icy components like Neptune.', TRUE, 25000),
('Exoplanet', 'Planets outside our solar system.', TRUE, 12000),
('Dwarf Planet', 'Smaller celestial bodies like Pluto.', FALSE, 1200);

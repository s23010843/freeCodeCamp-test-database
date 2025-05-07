-- 1. Create the universe database
CREATE DATABASE universe;

-- Connect to the universe database
\c universe;

-- 2. Create galaxy table
CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  galaxy_type TEXT NOT NULL,
  age_in_millions_of_years INT NOT NULL,
  has_life BOOLEAN NOT NULL
);

-- Insert 6 galaxies
INSERT INTO galaxy (name, galaxy_type, age_in_millions_of_years, has_life) VALUES
('Milky Way', 'Spiral', 13600, TRUE),
('Andromeda', 'Spiral', 10000, FALSE),
('Triangulum', 'Spiral', 9000, FALSE),
('Whirlpool', 'Spiral', 8000, FALSE),
('Sombrero', 'Elliptical', 10000, FALSE),
('Large Magellanic Cloud', 'Irregular', 7000, FALSE);

-- 3. Create star table
CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
  mass NUMERIC NOT NULL,
  temperature INT NOT NULL,
  is_spherical BOOLEAN NOT NULL
);

-- Insert 6 stars
INSERT INTO star (name, galaxy_id, mass, temperature, is_spherical) VALUES
('Sun', 1, 1.989e30, 5778, TRUE),
('Proxima Centauri', 1, 0.122e30, 3042, TRUE),
('Sirius', 1, 2.02e30, 9940, TRUE),
('Betelgeuse', 1, 11.6e30, 3500, TRUE),
('Alpha Centauri A', 1, 1.1e30, 5790, TRUE),
('Rigel', 1, 18e30, 11000, TRUE);

-- 4. Create planet table
CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  star_id INT NOT NULL REFERENCES star(star_id),
  planet_type TEXT NOT NULL,
  radius_km INT NOT NULL,
  has_life BOOLEAN NOT NULL,
  is_spherical BOOLEAN NOT NULL
);

-- Insert 12 planets
INSERT INTO planet (name, star_id, planet_type, radius_km, has_life, is_spherical) VALUES
('Earth', 1, 'Terrestrial', 6371, TRUE, TRUE),
('Mars', 1, 'Terrestrial', 3389, FALSE, TRUE),
('Jupiter', 1, 'Gas Giant', 69911, FALSE, TRUE),
('Saturn', 1, 'Gas Giant', 58232, FALSE, TRUE),
('Neptune', 1, 'Ice Giant', 24622, FALSE, TRUE),
('Uranus', 1, 'Ice Giant', 25362, FALSE, TRUE),
('Venus', 1, 'Terrestrial', 6052, FALSE, TRUE),
('Mercury', 1, 'Terrestrial', 2439, FALSE, TRUE),
('Kepler-22b', 2, 'Exoplanet', 24500, FALSE, TRUE),
('Proxima b', 2, 'Exoplanet', 7160, FALSE, TRUE),
('TRAPPIST-1e', 2, 'Exoplanet', 5790, FALSE, TRUE),
('TRAPPIST-1f', 2, 'Exoplanet', 5820, FALSE, TRUE);

-- 5. Create moon table
CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  planet_id INT NOT NULL REFERENCES planet(planet_id),
  diameter_km INT NOT NULL,
  has_atmosphere BOOLEAN NOT NULL,
  is_spherical BOOLEAN NOT NULL
);

-- Insert 20 moons
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

-- 6. Create a fifth table: planet_types
CREATE TABLE planet_types (
  planet_type_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  description TEXT NOT NULL,
  is_common BOOLEAN NOT NULL,
  avg_radius_km INT NOT NULL
);

-- Insert data into planet_types
INSERT INTO planet_types (name, description, is_common, avg_radius_km) VALUES
('Terrestrial', 'Rocky planets with solid surfaces.', TRUE, 6000),
('Gas Giant', 'Massive planets with thick atmospheres.', TRUE, 70000),
('Ice Giant', 'Gas planets with icy elements.', TRUE, 25000),
('Exoplanet', 'Planets outside our Solar System.', TRUE, 12000),
('Dwarf Planet', 'Smaller celestial bodies like Pluto.', FALSE, 1200);

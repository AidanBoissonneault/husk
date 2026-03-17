DROP DATABASE IF EXISTS husk;
CREATE DATABASE husk;
USE husk;

-- ─────────────────────────────────────────
--  BEANS
-- ─────────────────────────────────────────

CREATE TABLE beans (
  id           INT AUTO_INCREMENT PRIMARY KEY,
  name         VARCHAR(100) NOT NULL,
  roaster      VARCHAR(100),
  origin       VARCHAR(100),
  variety      VARCHAR(100),
  process      ENUM('natural', 'washed', 'honey', 'anaerobic', 'other'),
  elevation_m  INT,
  status       ENUM('fresh', 'frozen', 'finished') NOT NULL DEFAULT 'fresh',
  created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- One row per flavour note, linked to a bean
CREATE TABLE flavour_notes (
  id       INT AUTO_INCREMENT PRIMARY KEY,
  bean_id  INT NOT NULL,
  note     VARCHAR(50) NOT NULL,
  FOREIGN KEY (bean_id) REFERENCES beans(id) ON DELETE CASCADE
);

-- Generated OKLCH palette (2-3 swatches per bean)
CREATE TABLE bean_palette (
  id        INT AUTO_INCREMENT PRIMARY KEY,
  bean_id   INT NOT NULL,
  h         FLOAT NOT NULL,   -- hue (0-360)
  c         FLOAT NOT NULL,   -- chroma (0-0.4)
  l         FLOAT NOT NULL,   -- lightness (0-1)
  position  TINYINT NOT NULL, -- 1, 2, or 3
  FOREIGN KEY (bean_id) REFERENCES beans(id) ON DELETE CASCADE
);

-- ─────────────────────────────────────────
--  GEAR
-- ─────────────────────────────────────────

CREATE TABLE gear (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  name       VARCHAR(100) NOT NULL,
  type       ENUM('grinder', 'kettle', 'scale', 'brewer', 'espresso_machine', 'other') NOT NULL,
  notes      TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ─────────────────────────────────────────
--  RECIPES
-- ─────────────────────────────────────────

CREATE TABLE recipes (
  id           INT AUTO_INCREMENT PRIMARY KEY,
  name         VARCHAR(100) NOT NULL,
  brew_method  ENUM('pourover', 'espresso', 'aeropress', 'french_press', 'cold_brew', 'moka_pot', 'siphon', 'other') NOT NULL,
  created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Ordered steps within a recipe
CREATE TABLE recipe_steps (
  id               INT AUTO_INCREMENT PRIMARY KEY,
  recipe_id        INT NOT NULL,
  step_order       TINYINT NOT NULL,
  action           VARCHAR(100) NOT NULL,
  duration_seconds INT,
  FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE
);

-- ─────────────────────────────────────────
--  BREWS
-- ─────────────────────────────────────────

CREATE TABLE brews (
  id            INT AUTO_INCREMENT PRIMARY KEY,
  bean_id       INT NOT NULL,
  recipe_id     INT,
  closeness     ENUM('success', 'close', 'miss') NOT NULL,
  profile       ENUM('bitter', 'sweet', 'sour', 'balanced'),
  body          ENUM('light', 'medium', 'heavy'),
  grind_size    FLOAT,
  dose_g        FLOAT,
  yield_g       FLOAT,
  time_seconds  INT,
  notes         TEXT,
  brewed_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (bean_id)   REFERENCES beans(id),
  FOREIGN KEY (recipe_id) REFERENCES recipes(id)
);
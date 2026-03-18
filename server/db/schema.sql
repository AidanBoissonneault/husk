DROP DATABASE IF EXISTS husk;
CREATE DATABASE husk;
USE husk;

-- ─────────────────────────────────────────
--  BEANS
-- ─────────────────────────────────────────

CREATE TABLE beans (
  id           INT AUTO_INCREMENT PRIMARY KEY,
  user         INT NOT NULL DEFAULT 1,
  name         VARCHAR(100) NOT NULL,
  roaster      VARCHAR(100),
  origin       VARCHAR(100),
  variety      VARCHAR(100),
  process      VARCHAR(100),
  elevation_m  INT,
  status       ENUM('fresh', 'frozen', 'finished') NOT NULL DEFAULT 'fresh',
  created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- individual flavour note
CREATE TABLE flavour_note (
  id       INT AUTO_INCREMENT PRIMARY KEY,
  note     VARCHAR(50) NOT NULL,
  category VARCHAR(50) NOT NULL,
  hue      FLOAT NOT NULL -- hue (0 - 360)
);

-- pallet per bean
CREATE TABLE bean_palette (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  bean_id    INT NOT NULL,
  pri_note   INT NOT NULL,
  sec_note   INT NOT NULL,
  acc_note   INT NOT NULL,
  FOREIGN KEY (bean_id) REFERENCES beans(id) ON DELETE CASCADE,
  FOREIGN KEY (pri_note) REFERENCES flavour_note(id) ON DELETE CASCADE,
  FOREIGN KEY (sec_note) REFERENCES flavour_note(id) ON DELETE CASCADE,
  FOREIGN KEY (acc_note) REFERENCES flavour_note(id) ON DELETE CASCADE
);

-- ─────────────────────────────────────────
--  CHROMA CATEGORIES
-- ─────────────────────────────────────────

CREATE TABLE chroma_category (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  name       VARCHAR(100) NOT NULL,
  chroma     FLOAT NOT NULL
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
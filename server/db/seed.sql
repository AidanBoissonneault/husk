USE husk;

-- ─────────────────────────────────────────
--  CATEGORIES (replaces chroma_category)
-- ─────────────────────────────────────────

INSERT INTO category (id, name, chroma) VALUES
  (1, 'fruity',  0.22),
  (2, 'nutty',   0.10),
  (3, 'floral',  0.20),
  (4, 'spicy',   0.14),
  (5, 'sweet',   0.16),
  (6, 'earthy',  0.08),
  (7, 'roasted', 0.06),
  (8, 'berry',   0.21);

-- ─────────────────────────────────────────
--  FLAVOUR NOTES
-- ─────────────────────────────────────────

INSERT INTO flavour_note (id, note, category_id, hue) VALUES
  -- fruity (1)
  (1,  'strawberry',   1,  12.0),
  (2,  'peach',        1,  38.0),
  (3,  'lemon curd',   1,  72.0),
  (4,  'stone fruit',  1,  28.0),
  -- floral (3)
  (5,  'hibiscus',     3, 340.0),
  (6,  'jasmine',      3,  68.0),
  (7,  'rose',         3, 358.0),
  (8,  'bergamot',     3, 290.0),
  -- nutty (2)
  (9,  'hazelnut',     2,  48.0),
  (10, 'almond',       2,  52.0),
  -- sweet (5)
  (11, 'brown sugar',  5,  55.0),
  (12, 'caramel',      5,  50.0),
  -- earthy (6)
  (13, 'cedar',        6,  80.0),
  -- roasted (7)
  (14, 'cocoa',        7,  32.0),
  -- berry (8)
  (15, 'blackcurrant', 8, 298.0),
  (16, 'blueberry',    8, 268.0);

-- ─────────────────────────────────────────
--  BEANS
-- ─────────────────────────────────────────

INSERT INTO beans (id, user, name, roaster, origin, variety, process, roast_level, elevation_m, status, flavour_summary) VALUES
  (1, 1, 'Kayon Mountain', 'Onyx Coffee',     'Ethiopia', 'Heirloom', 'Natural', 50, 2200, 'fresh',    'Strawberry, Hibiscus, Lemon Curd'),
  (2, 1, 'Las Margaritas',  'Counter Culture', 'Colombia', 'Castillo', 'Washed',  42, 1750, 'fresh',    'Hazelnut, Cocoa, Brown Sugar'),
  (3, 1, 'Kiambu AB',       'Blue Bottle',     'Kenya',    'SL28',     'Washed',  73, 1900, 'fresh',    'Blackcurrant, Jasmine, Bergamot'),
  (4, 1, 'La Palma',        'Onyx Coffee',     'Guatemala','Bourbon',  'Honey',   10, 1600, 'frozen',   'Caramel, Almond, Stone Fruit'),
  (5, 1, 'Yirgacheffe G1',  'Intelligentsia',  'Ethiopia', 'Heirloom', 'Washed',  20, 2100, 'finished', 'Blueberry, Jasmine, Lemon Curd');

-- ─────────────────────────────────────────
--  BEAN PALETTES
-- ─────────────────────────────────────────

INSERT INTO bean_palette (bean_id, pri_note, sec_note, acc_note) VALUES
  (1, 1,  5,  3),   -- Kayon Mountain:  strawberry / hibiscus / lemon curd
  (2, 9,  14, 11),  -- Las Margaritas:  hazelnut / cocoa / brown sugar
  (3, 15, 6,  8),   -- Kiambu AB:       blackcurrant / jasmine / bergamot
  (4, 12, 10, 4),   -- La Palma:        caramel / almond / stone fruit
  (5, 16, 6,  3);   -- Yirgacheffe G1:  blueberry / jasmine / lemon curd

-- ─────────────────────────────────────────
--  GEAR
-- ─────────────────────────────────────────

INSERT INTO gear (id, name, type, notes) VALUES
  (1, 'Comandante C40',     'grinder',          '25 clicks for V60.'),
  (2, 'Fellow Stagg EKG',   'kettle',           '93C for light roasts, 88C for dark.'),
  (3, 'Acaia Pearl',        'scale',            'Flow rate mode enabled.'),
  (4, 'Hario V60 02',       'brewer',           'Plastic. Faster drain than ceramic.'),
  (5, 'Gaggia Classic Pro', 'espresso_machine', 'OPV set to 9 bar. PID modded.');

-- ─────────────────────────────────────────
--  RECIPES
-- ─────────────────────────────────────────

INSERT INTO recipes (id, name, brew_method) VALUES
  (1, '4:6 Method',         'pourover'),
  (2, 'Classic Espresso',   'espresso'),
  (3, 'Aeropress Inverted', 'aeropress');

INSERT INTO recipe_steps (recipe_id, step_order, action, duration_seconds) VALUES
  (1, 1, 'Bloom: pour 50g water',               45),
  (1, 2, 'First pour: add 100g (total 150g)',   45),
  (1, 3, 'Second pour: add 100g (total 250g)',  45),
  (1, 4, 'Third pour: add 100g (total 350g)',   45),
  (1, 5, 'Drawdown',                            60),
  (2, 1, 'Dose 18g, distribute and tamp',       20),
  (2, 2, 'Extract to 36g yield',                28),
  (3, 1, 'Add 15g coffee, pour 50g water',      30),
  (3, 2, 'Stir 10 times',                       10),
  (3, 3, 'Add remaining 200g water',            20),
  (3, 4, 'Steep',                               90),
  (3, 5, 'Flip and press slowly',               30);

-- ─────────────────────────────────────────
--  BREWS
-- ─────────────────────────────────────────

INSERT INTO brews (bean_id, recipe_id, closeness, profile, body, grind_size, dose_g, yield_g, time_seconds, notes) VALUES
  (1, 1, 'success', 'sweet',    'light',  28.0, 15.0, 250.0, 195, 'Clean and bright. Strawberry really came through.'),
  (1, 1, 'close',   'sweet',    'light',  26.0, 15.0, 250.0, 180, 'Slightly fast drawdown. Tighten grind next time.'),
  (2, 2, 'success', 'balanced', 'heavy',  NULL, 18.0,  36.0,  27, 'Dialled in well. Rich and chocolatey.'),
  (2, 2, 'close',   'bitter',   'heavy',  NULL, 18.0,  32.0,  31, 'Over-extracted. Try coarser or shorter time.'),
  (3, 3, 'miss',    'sour',     'light',  30.0, 15.0, 230.0, 120, 'Steep too short. Bergamot but very sharp.'),
  (3, 1, 'close',   'sweet',    'light',  27.0, 15.0, 250.0, 200, 'Better. Still needs tweaking on first pour ratio.'),
  (4, 1, 'success', 'sweet',    'medium', 27.0, 15.0, 250.0, 190, 'Honey process adds sweetness nicely. Very approachable.'),
  (5, 3, 'success', 'sweet',    'light',  29.0, 15.0, 220.0, 110, 'Blueberry and jasmine clean and clear. Perfect steep.');
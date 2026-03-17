USE husk;

-- ─────────────────────────────────────────
--  BEANS
-- ─────────────────────────────────────────

INSERT INTO beans (id, name, roaster, origin, variety, process, elevation_m, status) VALUES
  (1, 'Kayon Mountain',  'Onyx Coffee',     'Ethiopia', 'Heirloom', 'natural',  2200, 'fresh'),
  (2, 'Las Margaritas',  'Counter Culture', 'Colombia', 'Castillo', 'washed',   1750, 'fresh'),
  (3, 'Kiambu AB',       'Blue Bottle',     'Kenya',    'SL28',     'washed',   1900, 'fresh'),
  (4, 'La Palma',        'Onyx Coffee',     'Guatemala','Bourbon',  'honey',    1600, 'frozen'),
  (5, 'Yirgacheffe G1',  'Intelligentsia',  'Ethiopia', 'Heirloom', 'washed',   2100, 'finished');

-- ─────────────────────────────────────────
--  FLAVOUR NOTES
-- ─────────────────────────────────────────

INSERT INTO flavour_notes (bean_id, note) VALUES
  -- Kayon Mountain
  (1, 'strawberry'),
  (1, 'hibiscus'),
  (1, 'lemon curd'),
  (1, 'peach'),
  -- Las Margaritas
  (2, 'hazelnut'),
  (2, 'brown sugar'),
  (2, 'cedar'),
  (2, 'cocoa'),
  -- Kiambu AB
  (3, 'jasmine'),
  (3, 'blackcurrant'),
  (3, 'bergamot'),
  (3, 'rose'),
  -- La Palma
  (4, 'caramel'),
  (4, 'almond'),
  (4, 'stone fruit'),
  -- Yirgacheffe G1
  (5, 'blueberry'),
  (5, 'jasmine'),
  (5, 'lemon');

-- ─────────────────────────────────────────
--  BEAN PALETTES  (h, c, l)
-- ─────────────────────────────────────────

INSERT INTO bean_palette (bean_id, h, c, l, position) VALUES
  -- Kayon Mountain: warm orange/red (fruity)
  (1, 52,  0.20, 0.70, 1),
  (1, 28,  0.22, 0.55, 2),
  (1, 72,  0.18, 0.45, 3),
  -- Las Margaritas: muted tan/brown (nutty)
  (2, 62,  0.12, 0.52, 1),
  (2, 42,  0.10, 0.40, 2),
  (2, 78,  0.09, 0.36, 3),
  -- Kiambu AB: purple/violet (floral)
  (3, 318, 0.21, 0.62, 1),
  (3, 278, 0.19, 0.52, 2),
  (3, 338, 0.23, 0.46, 3),
  -- La Palma: amber/gold (caramel)
  (4, 58,  0.18, 0.65, 1),
  (4, 40,  0.15, 0.50, 2),
  (4, 70,  0.12, 0.40, 3),
  -- Yirgacheffe G1: blue/indigo (berry/floral)
  (5, 260, 0.20, 0.58, 1),
  (5, 290, 0.18, 0.48, 2),
  (5, 240, 0.15, 0.40, 3);

-- ─────────────────────────────────────────
--  GEAR
-- ─────────────────────────────────────────

INSERT INTO gear (id, name, type, notes) VALUES
  (1, 'Comandante C40',    'grinder',          'MK4 Nitro Blade. 25 clicks for V60.'),
  (2, 'Fellow Stagg EKG',  'kettle',           '93°C for light roasts, 88°C for dark.'),
  (3, 'Acaia Pearl',       'scale',            'Flow rate mode enabled.'),
  (4, 'Hario V60 02',      'brewer',           'Plastic. Faster drain than ceramic.'),
  (5, 'Gaggia Classic Pro','espresso_machine',  'OPV set to 9 bar. PID modded.');

-- ─────────────────────────────────────────
--  RECIPES
-- ─────────────────────────────────────────

INSERT INTO recipes (id, name, brew_method) VALUES
  (1, '4:6 Method',         'pourover'),
  (2, 'Classic Espresso',   'espresso'),
  (3, 'Aeropress Inverted', 'aeropress');

INSERT INTO recipe_steps (recipe_id, step_order, action, duration_seconds) VALUES
  -- 4:6 Method (Tetsu Kasuya)
  (1, 1, 'Bloom: pour 50g water',          45),
  (1, 2, 'First pour: add 100g (total 150g)', 45),
  (1, 3, 'Second pour: add 100g (total 250g)', 45),
  (1, 4, 'Third pour: add 100g (total 350g)',  45),
  (1, 5, 'Drawdown',                        60),
  -- Classic Espresso
  (2, 1, 'Dose 18g, distribute and tamp',   20),
  (2, 2, 'Extract to 36g yield',            28),
  -- Aeropress Inverted
  (3, 1, 'Add 15g coffee, pour 50g water',  30),
  (3, 2, 'Stir 10 times',                   10),
  (3, 3, 'Add remaining 200g water',        20),
  (3, 4, 'Steep',                           90),
  (3, 5, 'Flip and press slowly',           30);

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
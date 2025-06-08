CREATE TABLE IF NOT EXISTS hero (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  image TEXT NOT NULL
);

INSERT INTO hero (name, description, image)
VALUES (
  'Lorem ipsum dolor',
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus in orci nec nulla placerat cursus. Integer ut risus eu urna tristique cursus.',
  'https://placehold.co/640x100.png'
);

UPDATE hero
SET image = 'https://placehold.co/640x300.png'
WHERE id = 1;

ALTER TABLE hero ADD COLUMN is_active INTEGER DEFAULT 0;

INSERT INTO hero (name, description, image, is_active)
VALUES (
  'Lorem ipsum dolor (ny)',
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur nec lacus nec odio vehicula tincidunt.',
  'https://placehold.co/640x300.png',
  0
);

CREATE TABLE products (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  price INTEGER NOT NULL,
  image_url TEXT NOT NULL,
  brand TEXT NOT NULL,
  published_at DATE NOT NULL
);


INSERT INTO products (title, price, image_url, brand, published_at) VALUES
('Svart T-Shirt', 199, 'https://placehold.co/640x700.png', 'Levis', DATE('now', '-1 day')),
('Svart T-Shirt', 199, 'https://placehold.co/640x700.png', 'Levis', DATE('now', '-8 days')),
('Svart T-Shirt', 199, 'https://placehold.co/640x700.png', 'Levis', DATE('now', '-9 days')),
('Svart T-Shirt', 199, 'https://placehold.co/640x700.png', 'Levis', DATE('now', '-10 days')),
('Svart T-Shirt', 199, 'https://placehold.co/640x700.png', 'Levis', DATE('now', '-11 days')),
('Svart T-Shirt', 199, 'https://placehold.co/640x700.png', 'Levis', DATE('now', '-12 days')),
('Svart T-Shirt', 199, 'https://placehold.co/640x700.png', 'Levis', DATE('now', '-13 days')),
('Svart T-Shirt', 199, 'https://placehold.co/640x700.png', 'Levis', DATE('now', '-14 days'));


CREATE TABLE (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  image_url TEXT NOT NULL,
  description TEXT NOT NULL
);


INSERT INTO spots (image_url, description) VALUES
('https://placehold.co/640x700.png', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
('https://placehold.co/640x700.png', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
('https://placehold.co/640x700.png', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.');
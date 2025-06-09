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

ALTER TABLE products ADD COLUMN description TEXT;

CREATE TABLE orders (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  fnamn TEXT NOT NULL,
  enamn TEXT,
  email TEXT NOT NULL,
  gata TEXT NOT NULL,
  postnr TEXT NOT NULL,
  stad TEXT NOT NULL,
  nyhetsbrev INTEGER DEFAULT 0,
  cart TEXT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

UPDATE products SET
  title = 'Svart T-Shirt',
  price = 199,
  brand = 'Freky Wear',
  slug = 'svart-t-shirt',
  description = 'En stilren svart t-shirt i mjukt bomullsmaterial, perfekt för alla tillfällen. Den erbjuder både komfort och hållbarhet, och passar lika bra för vardagsbruk som för mer avslappnade event. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
WHERE id = 1;

UPDATE products SET
  title = 'Vit T-Shirt',
  price = 189,
  brand = 'Freky Wear',
  slug = 'vit-t-shirt',
  description = 'Klassisk vit t-shirt med skön passform och hög kvalitet. Tillverkad av 100% ekologisk bomull för att säkerställa både komfort och miljövänlighet. Perfekt för layering eller som den är. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
WHERE id = 2;

UPDATE products SET
  title = 'Blå T-Shirt',
  price = 209,
  brand = 'Urban Street',
  slug = 'bla-t-shirt',
  description = 'Blå t-shirt med trendig design, gjord för vardagsbruk. Med en mjuk och luftig känsla som gör att du kan bära den hela dagen utan problem. Passar både till jeans och shorts. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
WHERE id = 3;

UPDATE products SET
  title = 'Grå Hoodie',
  price = 399,
  brand = 'Urban Street',
  slug = 'gra-hoodie',
  description = 'Mysig grå hoodie med mjukt fleecefoder, perfekt för kalla dagar. Har en justerbar huva och ribbade muddar för extra komfort och stil. Ett måste i varje garderob under höst- och vintermånaderna. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
WHERE id = 4;

UPDATE products SET
  title = 'Svart Hoodie',
  price = 419,
  brand = 'Freky Wear',
  slug = 'svart-hoodie',
  description = 'Snygg svart hoodie med ribbade muddar och huva. Tillverkad i ett slitstarkt material som håller formen även efter flera tvättar. Perfekt för både träning och vardagsbruk. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
WHERE id = 5;

UPDATE products SET
  title = 'Röd Keps',
  price = 149,
  brand = 'CapZone',
  slug = 'rod-keps',
  description = 'Sportig röd keps med justerbar rem, passar perfekt till sommaren. Ger ett snyggt och avslappnat intryck samtidigt som den skyddar mot solens strålar. Gjord av slitstarkt material för lång hållbarhet. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
WHERE id = 6;

UPDATE products SET
  title = 'Sneakers Vita',
  price = 699,
  brand = 'StepUp',
  slug = 'sneakers-vita',
  description = 'Vita sneakers med bekväm passform och modern design. Tillverkade med andningsbart material och en slitstark sula som ger bra grepp. Perfekta för både vardagsbruk och mer aktiva dagar. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
WHERE id = 7;

ALTER TABLE products ADD COLUMN sku TEXT;

UPDATE products SET sku = 'SKU001' WHERE id = 1;
UPDATE products SET sku = 'SKU002' WHERE id = 2;
UPDATE products SET sku = 'SKU003' WHERE id = 3;
UPDATE products SET sku = 'SKU004' WHERE id = 4;
UPDATE products SET sku = 'SKU005' WHERE id = 5;
UPDATE products SET sku = 'SKU006' WHERE id = 6;
UPDATE products SET sku = 'SKU007' WHERE id = 7;
UPDATE products SET sku = 'SKU008' WHERE id = 8;
const express = require('express');
const router = express.Router();
const Database = require('better-sqlite3');
const db = new Database('./data/data.db');
const sharp = require('sharp'); // lägg till överst

const multer = require('multer');
const path = require('path');

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'public/images/'); // Där bilder sparas
  },
  filename: function (req, file, cb) {
    const uniqueName = Date.now() + '-' + file.originalname;
    cb(null, uniqueName);
  }
});

const upload = multer({ storage: storage });

const slugify = (str) => {
  return str
    .toLowerCase()
    .trim()
    .replace(/\s+/g, '-')       // ersätt mellanslag med bindestreck
    .replace(/[^\w\-]+/g, '')   // ta bort ogiltiga tecken
    .replace(/\-\-+/g, '-');    // ta bort dubbla bindestreck
};

router.get('/products', (req, res) => {

  const products = db.prepare('SELECT * FROM products').all();


  res.render('admin/products', { 
    layout: 'layouts/admin',
    title: 'Administartion',
    products: products
    });  
});



router.post('/products/:id/delete', (req, res) => {
  const id = req.params.id;

  const stmt = db.prepare('DELETE FROM products WHERE id = ?');
  const info = stmt.run(id);

  console.log(`Deleted ${info.changes} row(s) with id ${id}`);

  res.redirect('/admin/products');
});

router.get('/products/new', (req, res) => {
  res.render('admin/new-product', {
    layout: 'layouts/admin',
    title: 'Lägg till ny produkt'
  });
});

router.post('/products', upload.single('image'), async (req, res) => {
  const { name, description, brand, sku, price, published_at } = req.body;
  const slug = slugify(name);

  let imageUrl = null;

  if (req.file) {
    const originalPath = req.file.path; // ex: public/images/1234-bild.png
    const resizedPath = `public/images/resized-${req.file.filename}`;
    imageUrl = `/images/resized-${req.file.filename}`;

    try {
      await sharp(originalPath)
        .resize(640, 700)
        .toFile(resizedPath);
    } catch (err) {
      console.error('Fel vid bildbehandling:', err);
    }
  }

  const stmt = db.prepare(`
    INSERT INTO products (title, description, price, image_url, brand, published_at, slug, sku)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
  `);

  stmt.run(name, description, price, imageUrl, brand, published_at, slug, sku);

  console.log('Produkt tillagd:', { name, description, price, imageUrl, brand, published_at, slug, sku });

  res.redirect('/admin/products');
});


module.exports = router;

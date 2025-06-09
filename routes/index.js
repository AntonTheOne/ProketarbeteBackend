const express = require('express');
const router = express.Router();
const Database = require('better-sqlite3');

const db = new Database('./data/data.db', {
  verbose: console.log
});

router.get('/', (req, res) => {
  // Hero
  const hero = db.prepare('SELECT * FROM hero WHERE is_active = 1 LIMIT 1').get();

  // Products
  const products = db.prepare('SELECT * FROM products ORDER BY published_at DESC').all();
  const now = new Date();
  products.forEach(product => {
    const publishedDate = new Date(product.published_at);
    const diffDays = (now - publishedDate) / (1000 * 60 * 60 * 24);
    product.isNew = diffDays <= 7;
  });

  // Spots
  const spots = db.prepare('SELECT * FROM spots').all();

  res.render('index', {
    title: 'Freaky Fashion',
    hero,
    products,
    spots,
  
  });
});

module.exports = router;

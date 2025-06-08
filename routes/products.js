const express = require('express');
const router = express.Router();
const Database = require('better-sqlite3');
const db = new Database('./data/data.db');

router.get('/', (req, res) => {
  const products = db.prepare('SELECT * FROM products ORDER BY published_at DESC').all();

  res.render('products', {
    title: 'Alla produkter',
    products
  });
});

module.exports = router;
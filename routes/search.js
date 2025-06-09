const express = require('express');
const router = express.Router();
const Database = require('better-sqlite3');
const db = new Database('./data/data.db');


router.get('/', (req, res) => {
  const q = req.query.q || '';
  let products = [];

  if (q.trim() !== '') {
    const stmt = db.prepare('SELECT * FROM products WHERE LOWER(title) LIKE ?');
    products = stmt.all(`%${q.toLowerCase()}%`);
  }

  res.render('search', {
    title: "Freky Fashon",
    products,
    searchTerm: q
  });
});

module.exports = router;

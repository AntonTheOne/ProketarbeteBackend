const express = require('express');
const router = express.Router();
const Database = require('better-sqlite3');
const db = new Database('./data/data.db');

router.get('/', (req, res) => {
  const spots = db.prepare('SELECT * FROM spots').all();

  res.render('spots', {
    title: 'Spots',
    spots
  });
});

module.exports = router;

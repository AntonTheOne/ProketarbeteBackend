const express = require('express');
const router = express.Router();
const Database = require('better-sqlite3');
const db = new Database('./data/data.db');

// products-info med slug
router.get('/:slug', (req, res) => {
  const productSlug = req.params.slug;

  const product = db.prepare('SELECT * FROM products WHERE slug = ?').get(productSlug);
  const otherProducts = db.prepare('SELECT * FROM products WHERE slug != ? LIMIT 6').all(productSlug);
  

  
  res.render('product', {
    title: product.title,
    korg: 'Lägg i Varukorgen',
    product,
    otherProducts
    
  });
});

router.post('/:slug', (req, res) => {
  const productSlug = req.params.slug;
  const product = db.prepare('SELECT * FROM products WHERE slug = ?').get(productSlug);

 
  if (!req.session.cart) {
    req.session.cart = [];
  }


  const existingProduct = req.session.cart.find(item => item.id === product.id);

  if (existingProduct) {
    existingProduct.quantity += 1;
  } else {

    req.session.cart.push({
      id: product.id,
      title: product.title,
      price: product.price,
      quantity: 1
    });
  }


  res.redirect('back');
});


module.exports = router;
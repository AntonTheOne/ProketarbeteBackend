const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {

   const cart = req.session.cart || [];

  res.render('cart', {
    title: 'Varukorg',
    cart: cart
  });
});

router.post('/', (req, res) => {
  const { id, quantity } = req.body;
  const qty = parseInt(quantity, 10);


  if (!req.session.cart) {
    req.session.cart = [];
  }

  const product = req.session.cart.find(item => item.id == id);

  if (product) {
    if (qty > 0) {
      product.quantity = qty;
    } else {
      req.session.cart = req.session.cart.filter(item => item.id != id);
    }
  }

  console.log('Uppdaterad korg:', req.session.cart);

  res.redirect('back');
});
module.exports = router;
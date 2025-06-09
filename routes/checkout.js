const express = require('express');
const router = express.Router();

const Database = require('better-sqlite3');

const db = new Database('./data/data.db', {
  verbose: console.log
});


// GET /checkout
router.get('/', (req, res) => {

  const cart = req.session.cart || [];

  res.render('checkout', { 
    title: 'Checkout',
    cart
   });
});

//POST 

router.post('/', (req, res) => {
  const cart = req.session.cart || [];
  const {
    fnamn,
    enamn,
    email,
    gata,
    postnr,
    stad,
    nyhetsbrev = 'off'
  } = req.body;

  if (!cart || cart.length === 0) {
    return res.render('checkout', {
      title: 'Checkout',
      cart,
      error: 'Din varukorg är tom. Lägg till produkter innan du kan gå vidare.'
    });
  }

  // Konvertera checkbox till 0 eller 1
  const nyhetsbrevInt = nyhetsbrev === 'on' ? 1 : 0;

  // Konvertera cart till JSON-sträng för lagring i DB
  const cartString = JSON.stringify(cart);

  try {
    const stmt = db.prepare(`
      INSERT INTO orders (fnamn, enamn, email, gata, postnr, stad, nyhetsbrev, cart)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    `);

    const info = stmt.run(fnamn, enamn, email, gata, postnr, stad, nyhetsbrevInt, cartString);

    // Spara orderId i session (om du vill använda det senare)
    req.session.orderId = info.lastInsertRowid;

    // Töm varukorgen efter köp
    req.session.cart = [];

    res.redirect('/confirmation');
  } catch (err) {
    console.error('Fel vid lagring av order:', err);
    res.render('checkout', {
      title: 'Checkout',
      cart,
      error: 'Något gick fel vid lagring av beställningen, försök igen.'
    });
  }
});

  module.exports = router;
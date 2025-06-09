const express = require('express');
const router = express.Router();


// GET /checkout
router.get('/', (req, res) => {

  res.render('confirmation', { 
    title: 'Orderbekräftelse',
   });
});

module.exports = router;  // Viktigt att exportera just router!
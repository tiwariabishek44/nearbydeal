const express = require("express");
const merchantRouter = express.Router();
const merchant = require('../midileware/merchant');

const {Deal} = require("../models/deal_model");
const { PromiseProvider } = require("mongoose");

// Add deals
merchantRouter.post("/merchant/add-deal", merchant, async (req, res) => {
  try {

    const { name, description, images, price, discount, limit } = req.body;
    let deal = new Deal({
      owner: req.user, // set owner to the _id of the authenticated user
      name,
      description,
      images,
      price,
      discount,
      limit,
    });
    deal = await deal.save();
    res.json(deal);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


// Get all your deals
merchantRouter.get("/merchant/get-deals", merchant,
  async (req, res) => {
  try {
    const dealss = await Deal.find({ owner: req.user }); 
    res.json(dealss);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});



merchantRouter.post("/merchant/delete-deals", merchant, async (req, res) => {
  try {
    const { id } = req.body;
    let deal = await Deal.findOneAndDelete({
      _id: id,
      owner: req.user
    });
    res.json(deal);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});




module.exports = merchantRouter;
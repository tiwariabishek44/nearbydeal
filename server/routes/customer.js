const express = require("express");
const dealRouter = express.Router();
const auth = require('../midileware/auth');

const { Deal } = require("../models/deal_model");
const { PromiseProvider } = require("mongoose");
const User = require('../models/user');
const Order = require('../models/order');


// Get all your deals
dealRouter.get("/customer/get-deals", auth,
  async (req, res) => {
    try {
      const dealss = await Deal.find({});

      res.json(dealss);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

//create order

dealRouter.post("/customer/add-order", auth, async (req, res) => {
  try {
    const { id } = req.body;
    const deal = await Deal.findById(id);

    let order = new Order({
    owner:req.user,
    merchant:deal.owner,
    deal:deal
    });

    order = await order.save();

    res.json(order);

  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//getorder
dealRouter.get("/customer/get-cupons", auth,
  async (req, res) => {
    try {
      const dealss = await Order.find({owner:`${req.user}`});
      console.log(dealss);
      res.json(dealss);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
module.exports = dealRouter;
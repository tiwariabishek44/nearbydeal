const mongoose = require('mongoose');
const { dealSchema } = require('./deal_model');
const ObjectID = mongoose.Schema.Types.ObjectId;

const orderSchema = mongoose.Schema({

  owner: {
    type: ObjectID,
    required: true,
    ref: "User",
  },

  merchant: {
    required: true,
    type: String,
    trim: true,
  },

  deal: dealSchema


});

const Order = mongoose.model('order', orderSchema);
module.exports = Order;


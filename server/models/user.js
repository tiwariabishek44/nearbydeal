const mongoose = require('mongoose');
const { dealSchema } = require('./deal_model');

const userSchema = mongoose.Schema({
  name: {
    required: true,
    type: String,
    trim: true,
  },

  password: {
    required: true,
    trim :true,
    type: String,
    validate: {
      validator: (val) => {
        return val.length >= 7;
      },
      message: "password must greater than  7 digit",
    },
  },

  phone: {
    type: String,
    required: true,
    trim: true,
    validate: {
      validator: (valu) => {
        return valu.length == 10;
      },
      message: "Please provide 10 digit number",
    },
  },

  type: {
    type: String,
    default: "customer",
  },

  cart: [
    {
      deal: dealSchema,
      quantity: {
        type: Number,
        required: true,
      },
    },
  ],
});

const User = mongoose.model('user', userSchema);
module.exports = User;


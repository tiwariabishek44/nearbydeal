const express = require("express");
const UserModel = require('../models/user');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const authRouter = express.Router();
const Secretekey = "6D5A713374367739";
const auth = require('../midileware/auth');


//singup

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, password, phone, type } = req.body;

    const existingUser = await UserModel.findOne({ phone });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with same Phone no. already exists!" });
    }
    const salt = bcrypt.genSaltSync(8);

    const hashedPassword = bcrypt.hashSync(password, salt);

    let user = new UserModel({
      password: hashedPassword,
      name,
      phone,
      type,
    });
    user = await user.save();
    res.status(200).json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

authRouter.post("/api/signin", async (req, res) => {
  try {
    const { phone, password } = req.body;


    const existingUsr = await UserModel.findOne({ phone });
    if (!existingUsr) {
      return res
        .status(400)
        .json({ msg: "User does not exist" });
    }
    const ismatch = await bcrypt.compare(password, existingUsr.password);
    if (!ismatch) {
      return res.status(400).json({ message: "Icorrect Password" });
    }

    const token = jwt.sign({ id: existingUsr._id }, Secretekey);
    res.json({ token, ...existingUsr._doc });

  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

authRouter.post("/tokenIsValid", async (req, res) => {
  try {
    const token = req.header("x-auth-token"); 
    if (!token) return res.json(false);
    const verified = jwt.verify(token, Secretekey);
    if (!verified) return res.json(false);

    const user = await Vendor.findById(verified.id);
    if (!user) return res.json(false);
    res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

authRouter.get("/", auth, async (req, res) => {
  const user = await Vendor.findById(req.user);
  res.json({ ...user._doc, token: req.token });
});


module.exports = authRouter;
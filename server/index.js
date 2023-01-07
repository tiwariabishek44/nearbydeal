const express = require('express');
const mongoose = require('mongoose');
mongoose.set("strictQuery", false);
const app = express();
const merchantRouter = require('./routes/merchant');
const User = require('./models/user');
app.use(express.json());
const authRouter = require('./routes/auth');
const dealRouter = require('./routes/customer')


const db =
  "mongodb+srv://abishektiwari:ttttttt@cluster0.imru6qq.mongodb.net/nearbyd?retryWrites=true&w=majority";



mongoose
  .connect(db, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log("Connected to MongoDB");
  });


app.use(authRouter);
app.use(merchantRouter);
app.use(dealRouter);

app.listen(3000, "0.0.0.0", () => {
  console.log(`server is listen on 3000`);
});
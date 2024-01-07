const express = require("express");

const app = express();
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");

const Db =
  "mongodb+srv://sandeeptimilsen:4288190Ss@cluster0.rxfgqep.mongodb.net/?retryWrites=true&w=majority";

app.use(express.json());
app.use(authRouter);

mongoose
  .connect(Db)
  .then(() => {
    console.log("connection successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(3000, "0.0.0.0", () => {});

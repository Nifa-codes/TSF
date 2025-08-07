const express = require("express");
const db = require("./db");
const app = express();
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
const indexRoute = require("./routes/index");
app.use("/api", indexRoute);
module.exports = app;

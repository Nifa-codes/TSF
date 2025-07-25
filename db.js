require("dotenv").config();
const pgp = require("pg-promise")();

const db = pgp({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  database: "TestAdmin",
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
});

module.exports = db;

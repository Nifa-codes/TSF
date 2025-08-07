const db = require("../db");
const addTable = async function (tableData) {
  const { cafe_id, capacity, number, status } = tableData;

  const result = await db.func("add_table", [
    cafe_id,
    capacity,
    number,
    //'available', 'reserved'
    status,
  ]);
  return result;
};
const getTables = async function (cafeId) {
  const result = await db.func("get_tables", [cafeId]);
  return result;
};
const updateTable = async function (tableData) {
  const { id, cafe_id, capacity, number, status } = tableData;

  const result = await db.func("update_table", [
    id,
    cafe_id,
    capacity,
    number,
    status,
  ]);
  return result;
};
const deleteTable = async function (id) {
  const result = await db.func("delete_table", [id]);
  return result;
};
const getAvailableTables = async function (cafeId) {
  const result = await db.func("get_available_tables", [cafeId]);
  return result;
};
module.exports = {
  addTable,
  getTables,
  updateTable,
  deleteTable,
  getAvailableTables,
};

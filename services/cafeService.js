const db = require("../db");
const addCafe = async function (cafeData) {
  const { name, description, location, phone } = cafeData;
  const result = await db.func("add_cafe", [
    name,
    description,
    location,
    phone,
  ]);
  return result;
};
const deleteCafe = async function (id) {
  const result = await db.func("delete_cafe", [id]);
  return result;
};
const updateCafe = async function (cafeData) {
  const { id, name, description, location, phone } = cafeData;
  const result = await db.func("update_cafe", [
    id,
    name,
    description,
    location,
    phone,
  ]);
  return result;
};
const getAllCafes = async function () {
  const result = await db.func("get_all_cafes");
  return result;
};
const getCafeById = async function (id) {
  const result = await db.func("get_cafe", [id]);
  return result;
};
const searchCafes = async function (query) {
  const result = await db.func("search_cafes", [query]);
  return result;
};
module.exports = {
  addCafe,
  deleteCafe,
  updateCafe,
  getAllCafes,
  getCafeById,
  searchCafes,
};

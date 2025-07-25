const { result } = require("../db");
const db = require("../db");
const addUser = async function (userData) {
  const { name, email, number } = userData;
  const result = await db.func("add_user", [name, email, number]);
  return result;
};
const updateUser = async function (id, userData) {
  const { name, email, number } = userData;
  const result = await db.func("update_user", [id, name, email, number]);
  return result;
};
const deleteUser = async function (id) {
  const result = await db.func("delete_user", [id]);
  return result;
};
const getAllUsers = async function () {
  const result = await db.func("get_all_users");
  return result;
};
const getUserById = async function (id) {
  const result = await db.func("get_user", [id]);
  return result;
};
module.exports = {
  addUser,
  updateUser,
  deleteUser,
  getAllUsers,
  getUserById,
};

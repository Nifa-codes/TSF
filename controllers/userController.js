const userService = require("../services/userService");
const addUser = async function (req, res) {
  try {
    const { name, email, number } = req.body;
    const userData = { name, email, number };
    const result = await userService.addUser(userData);
    return res.status(200).json(result);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};
const updateUser = async function (req, res) {
  try {
    const id = req.params.id;
    const { name, email, number } = req.body;
    const userData = { id, name, email, number };
    const result = await userService.updateUser(userData);
    return res.status(200).json(result);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};
const deleteUser = async function (req, res) {
  try {
    const id = req.params.id;
    const result = await userService.deleteUser(id);
    return res.status(200).json(result);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};
const getAllUsers = async function (req, res) {
  try {
    const result = await userService.getAllUsers();
    return res.status(200).json(result);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};
const getUserById = async function (req, res) {
  try {
    const id = req.params.id;
    const result = await userService.getUserById(id);
    return res.status(200).json(result);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};
module.exports = {
  addUser,
  updateUser,
  deleteUser,
  getAllUsers,
  getUserById,
};

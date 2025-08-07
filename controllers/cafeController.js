const cafeService = require("../services/cafeService");
const addCafe = async function (req, res) {
  try {
    const { name, description, location, phone } = req.body;
    const cafeData = { name, description, location, phone };
    const result = await cafeService.add_cafe(cafeData);
    return res.status(200).json(result);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};
const getCafeById = async function (req, res) {
  try {
    const id = req.params.id;
    const result = await cafeService.getCafeById(id);
    return res.status(200).json(result);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};
const getAllCafes = async function (req, res) {
  try {
    const result = await cafeService.getAllCafes();
    return res.status(200).json(result);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};
const updateCafe = async function (req, res) {
  try {
    const id = req.params.id;
    const { name, description, location, phone } = req.body;
    const cafeData = { id, name, description, location, phone };
    const result = await cafeService.updateCafe(cafeData);
    return res.status(200).json(result);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};
const deleteCafe = async function (req, res) {
  try {
    const id = req.params.id;
    const result = await cafeService.deleteCafe(id);
    return res.status(200).json(result);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};
const searchCafes = async function (req, res) {
  try {
    const query = req.query;
    const result = await cafeService.searchCafe(query);
    return res.status(200).json(result);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};
module.exports = {
  addCafe,
  getCafeById,
  getAllCafes,
  updateCafe,
  deleteCafe,
  searchCafes,
};

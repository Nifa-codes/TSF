const tableService = require("../services/tableService");
const addTable = async function (req, res) {
  try {
    const { cafe_id, number, capacity, status } = req.body;
    const tableData = { cafe_id, number, capacity, status };
    const result = await tableService.addTable(tableData);
    return res.status(200).json(result);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};
//for cafe
const getTables = async function (req, res) {
  try {
    const cafeId = req.params.id;
    const result = await tableService.getTables(cafeId);
    return res.status(200).json(result);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};
const updateTable = async function (req, res) {
  try {
    const id = req.params.id;
    const { cafe_id, number, capacity, status } = req.body;
    const tableData = { id, cafe_id, number, capacity, status };
    const result = await tableService.updateTable(tableData);
    return res.status(200).json(result);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};

const deleteTable = async function (req, res) {
  try {
    const id = req.params.id;
    const result = await tableService.deleteTable(id);
    return res.status(200).json(result);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};
const getAvailableTables = async function (req, res) {
  try {
    const cafeId = req.params.id;
    const result = await tableService.getAvailableTables(cafeId);
    return res.status(200).json(result);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};
module.exports = {
  addTable,
  getTables,
  updateTable,
  deleteTable,
  getAvailableTables,
};

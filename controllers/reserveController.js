const reserveService = require("../services/reserveService");
const addReservation = async function (req, res) {
  try {
    const { user_id, cafe_id, table_id, date, status } = req.body;
    const reservationData = { user_id, cafe_id, table_id, date, status };
    const result = await reserveService.addReservation(reservationData);
    return res.status(200).json(result);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};
const updateReservation = async function (req, res) {
  try {
    const { id, user_id, cafe_id, table_id, date, status } = req.body;
    const reservationData = { id, user_id, cafe_id, table_id, date, status };
    const result = await reserveService.updateReservation(reservationData);
    return res.status(200).json(result);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};
const deleteReservation = async function (req, res) {
  try {
    const id = req.params.id;
    const result = await reserveService.deleteReservation(id);
    return res.status(200).json(result);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};
const getReservationById = async function (req, res) {
  try {
    const id = req.params.id;
    const result = await reserveService.getReservationById(id);
    return res.status(200).json(result);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};
const getAllReservations = async function (req, res) {
  try {
    cafeId = req.params.cafeId;
    const result = await reserveService.getAllReservations(cafeId);
    return res.status(200).json(result);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};
module.exports = {
  addReservation,
  updateReservation,
  deleteReservation,
  getReservationById,
  getAllReservations,
};

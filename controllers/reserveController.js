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
const listReservation = async function (req, res) {
  try {
    let page = parseInt(req.query.page);
    let limit = parseInt(req.query.limit);
    if (!page || !limit) {
      page = 1;
      limit = 10;
    }
    const result = await reserveService.listReservation(page, limit);
    const total_counts = result.rows[0].total_count;
    return res.status(200).json({
      page: page,
      limit: limit,
      total_count: total_counts,
      reservations: result,
    });
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};
const addReservationCTE = async function (req, res) {
  try {
    const { user_id, cafe_id, table_id, date, status } = req.body;
    const reservationData = { user_id, cafe_id, table_id, date, status };
    const result = await reserveService.addReservationCTE(reservationData);
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
  listReservation,
  addReservationCTE,
};

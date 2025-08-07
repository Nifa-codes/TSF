const db = require("../db");
const addReservation = async function (reservationData) {
  const { cafe_id, status, date, user_id, table_id } = reservationData;
  const result = await db.func("add_reserve", [
    cafe_id,
    //'pending', 'preparing', 'done', 'canceled'
    status,
    date,
    user_id,
    table_id,
  ]);
  return result;
};
const updateReservation = async function (reservationData) {
  const { id, cafe_id, status, date, user_id, table_id } = reservationData;
  const result = await db.func("update_reserve", [
    id,
    cafe_id,
    status,
    date,
    user_id,
    table_id,
  ]);
  return result;
};
const deleteReservation = async function (id) {
  const result = await db.func("delete_reserve", [id]);
  return result;
};
//for a cafe
const getAllReservations = async function (id) {
  const result = await db.func("get_all_reserves", [id]);
  return result;
};
const getReservationById = async function (id) {
  const result = await db.func("get_reserve", [id]);
  return result;
};
module.exports = {
  addReservation,
  updateReservation,
  deleteReservation,
  getAllReservations,
  getReservationById,
};

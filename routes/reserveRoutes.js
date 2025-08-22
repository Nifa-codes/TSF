const express = require("express");
const reserveController = require("../controllers/reserveController");
const router = express.Router();
router.post("/", reserveController.addReservation);
router.get("/:cafeId", reserveController.getAllReservations);
router.get("/:id", reserveController.getReservationById);
router.put("/:id", reserveController.updateReservation);
router.delete("/:id", reserveController.deleteReservation);
/////////////
router.post("/cte", reserveController.addReservationCTE);
router.get("/list", reserveController.listReservation);
module.exports = router;

const express = require("express");
const tableController = require("../controllers/tableController");
const router = express.Router();
router.post("/", tableController.addTable);
router.get("/:cafeId", tableController.getTables);
router.get("/availabl/:id", tableController.getAvailableTables);
router.delete("/:id", tableController.deleteTable);
router.put("/:id", tableController.updateTable);
module.exports = router;

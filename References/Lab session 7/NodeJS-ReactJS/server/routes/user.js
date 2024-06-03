const express = require("express");
const router = express();

const Controller = require('../controllers/Controller');

router.post('/login', Controller.login);

router.get('/:id', Controller.registeredCourse);

router.post('/:id/registerCourse', Controller.registerCourse);

module.exports = router;
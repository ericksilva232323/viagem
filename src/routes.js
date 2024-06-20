/* 
read = get
create = post 
update = put
delete = delete
*/

const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  res.send('Hello World!');
});

const destinos = require('./controllers/destinos');
const hoteis = require('./controllers/hoteis');
const pontosTuristicos = require('./controllers/pontosTuristicos');

//DESTINOS
router.post('/destinos', destinos.create);
router.get('/destinos', destinos.read);
router.delete('/destinos/:id', destinos.remove);
router.put('/destinos/:id', destinos.update);

router.get('/destinos/:id', destinos.readById);
router.post('/destinos/nome', destinos.readByName);

//HOTEIS
router.post('/hoteis', hoteis.create);
router.get('/hoteis', hoteis.read);
router.delete('/hoteis/:id', hoteis.remove);
router.put('/hoteis/:id', hoteis.update);


//PONTOS TURISTICOS
router.get('/pontosTuristicos', pontosTuristicos.read);
router.post('/pontosTuristicos', pontosTuristicos.create);
router.delete('/pontosTuristicos', pontosTuristicos.remove);
router.put('/pontosTuristicos', pontosTuristicos.update);

module.exports = router;
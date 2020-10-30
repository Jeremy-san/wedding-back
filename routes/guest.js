const express =require('express');
const router = express.Router();
const connection = require('../conf');

router.get("/", (req, res) => {
    connection.query('SELECT * FROM guest', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération de invite');
      } else {
        res.json(results);
      };
    });
});

// écoute de l'url avec le verbe POST
router.post('/', (req, res) => {

    // récupération des données envoyés
    const guestData = req.body;

    // connexion à la base de donnée et insertion de l'invité
    connection.query(`INSERT INTO guest SET ?`, guestData, (err, results) => {
        if (err) {
            console.log(err);
            res.status(500).send('Erreur lors de la création de invite');
        } else {
            res.sendStatus(200);
        }
    })
})

router.delete('/', (req, res) => {
    const nameGuest = req.query.guest;

    connection.query('DELETE FROM guest where firstname = ? and lastname = ? ', [nameGuest], (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la suppression de invite');
        } else {
            res.sendStatus(200);
        }
    })
})

module.exports = router;
const  mysql = require('mysql');
const  connection = mysql.createConnection({
host :  'localhost', // adresse du serveur
user :  'root', // le nom d'utilisateur
password :  'Toto69', // le mot de passe
database :  'wedding' // le nom de la base de données
});


connection.connect((err) => {
  if (err) throw err;
  console.log("Connected!");
});

module.exports = connection;
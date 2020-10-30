
const connection = require('./conf'); //a decommenter une fois conf.js configure
// ***** liste des modules installes + nodemon
const bodyParser = require("body-parser");
const cors = require('cors')
const express = require('express');
const morgan = require("morgan");

const app = express();
const port = 3000;


// ***** my routes *****
const routes = require("./routes");


app.use(bodyParser.urlencoded({ extended: true })); // parse application/x-www-form-urlencoded + // parse application/json
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false })); // parse application/x-www-form-urlencoded + // parse application/json


app.use(morgan("dev"));
app.use(morgan(":method :url :status :res[content-length] - :response-time "));

app.use(cors());


app.use('/admin', routes.admin);
app.use('/guest', routes.guest);
app.use('/addGuest', routes.addGuest)

app.listen(port, (err) => {
    if (err) {
        throw new Error('Something bad happened...');
    };
    console.log(`Server is listening on port ${port}`);
});
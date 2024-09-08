const express = require('express');
const app = express();

app.get('/', (req, res) => {
    res.send('Hello welocome to my Dockerised cloud hosted application');
});

// endpoint for health check
app.get('/will', (req, res) => {
    res.status(200).send('Application is up and running fine');
});

// endpoint for readiness check
app.get('/ready', (req, res) => {
    res.status(200).send('Application is ready');
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`App listening on port ${port}`);
});

const fs = require('fs');
const path = require('path');
const express = require('express');

const readFile = fs.readFile;
const server = express();
const PORT = process.env.PORT || 9000;

server.use(
    express.static(path.resolve(__dirname, '..'))
);

server.get('*', (request, response) => {
    readFile(path.resolve(__dirname, '..', 'index.html'))
    // .then(file => response.type('text/html').send(file))
    // .catch(err => {
    //     if (err.code == 'ENOENT') {
    //         response.status(404).send('Resource `index.html` not found.');
    //     } else {
    //         console.error(err);
    //         response.status(500).send('Internal server error');
    //     }
    // });
});

server.listen(PORT, (err) => {
    if (err) {
        console.error(err);
        process.exit(1);
    }
    console.log(`Server Context: ${path.resolve(__dirname, '..')}`);
    console.log(`Express Server listening on ${PORT}....`);
    console.log('Press CTRL+C to quit.');
});

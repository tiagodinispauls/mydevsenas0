const express = require('express');
const app = express();

app.get('/', (req, res) => {
  console.log('Request Proccessed Successfully.');

  const target = process.env.TARGET || 'Successflly';
  res.send(`Processed ${target}!`);
});

const port = process.env.PORT || 8080;
app.listen(port, () => {
  console.log('Listening on port', port);
});

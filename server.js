import express from 'express';
import * as wetty from 'wetty';

const app = express();
const port = process.env.PORT || 3000;

// Giao diện chính
app.get('/', (req, res) => {
  res.send('<h1>Welcome! Access your shell at <a href="/shell">/shell</a></h1>');
});

// Tích hợp Wetty
const wettyServer = new wetty.WettyServer({
  port: 3001,
  base: '/shell',
});

wettyServer.run(() => {
  console.log('Wetty terminal running at /shell');
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

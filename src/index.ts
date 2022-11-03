require('dotenv').config();

import express from 'express';
import { PORT } from './config/constants';
import { routerMine } from './routes/mine';

const app = express();
app.use(express.json());

app.get('/mine/show/:id', routerMine);
app.post('/mine/add', routerMine);
app.put('/mine/update/:id', routerMine);

app.listen(PORT, () => {
    console.log(`Listening on port ${PORT}`)
});
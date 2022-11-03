require('dotenv').config();

import express from 'express';
import { PORT } from './config/constants';
import { routerConcession } from './routes/concession';
import { routerMine } from './routes/mine';

const app = express();
app.use(express.json());

app.get('/mine/show/:id', routerMine);
app.post('/mine/add', routerMine);
app.put('/mine/update/:id', routerMine);
app.delete('/mine/delete/:id', routerMine);

app.get('/concession/show/:id', routerConcession);
app.post('/concession/add', routerConcession);
app.put('/concession/update/:id', routerConcession);
app.delete('/concession/delete/:id', routerConcession);

app.listen(PORT, () => {
    console.log(`Listening on port ${PORT}`)
});
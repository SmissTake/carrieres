require('dotenv').config();

import cors from 'cors';
import express from 'express';
import { PORT } from './config/constants';
import { generateToken } from './authenticate/jwt';
import { routerConcession } from './routes/concession';
import { routerMine } from './routes/mine';
import { routerAuthenticate } from './routes/authenticate';

const app = express();
const allowOrigins = ['http://localhost:8400'];

const options: cors.CorsOptions = {
    origin: allowOrigins
};

if(process.env.NODE_ENV !== 'production'){
    console.log('Le tGEToken JWT :', generateToken("Tanguy", "gwiontanguy@mail.com", "Administrateur"));
}

app.use(cors())
app.use(express.json());

app.get('/mine/show/:id', routerMine);
app.post('/mine/add', routerMine);
app.put('/mine/update/:id', routerMine);
app.delete('/mine/delete/:id', routerMine);

app.get('/concession/show/:id', routerConcession);
app.get('/concession/show/mines/:id', routerConcession);
app.get('/concession/show/contact/:id', routerConcession);
app.get('/concession/all/:id', routerConcession);
app.post('/concession/add', routerConcession);
app.put('/concession/update/:id', routerConcession);
app.delete('/concession/delete/:id', routerConcession);

app.post('/user/signin', routerAuthenticate);
app.post('/user/login', routerAuthenticate);

app.listen(PORT, () => {
    console.log(`Listening on port ${PORT}`)
});

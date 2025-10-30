import { httpServerHandler } from 'cloudflare:node';  // Esta linea es importante ya que nos permite importar las librerias como express, cors, morgan, etc.

import express from 'express';
import cors from 'cors';
import morgan from 'morgan';
// Esto se conecta con la base de datos "D1" (SQLite) que nos provee cloudflare 
const db = process.env.DB; // "DB" es solo un ejemplo, pero tiene que ser el nombre del binding que estableciste en wrangler.jsonc y el que se creo con el comando del setup
const app = express();

app.use(cors());
app.use(morgan('dev'));

// Endpoints 
app.get('/', (req, res) => {
	res.send('Hola mundo!');
})

app.listen(3000);
export default httpServerHandler({ port: 3000 }); // Esta linea es importante para conectarlo con cloudflare

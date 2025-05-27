const express = require('express');
const expressLayouts = require('express-ejs-layouts');
const path = require('path');

const app = express();

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// Middleware express-ejs-layouts
app.use(expressLayouts);

// Define o layout padrão
app.set('layout', 'layout');

app.use(express.static(path.join(__dirname, 'public')));

// Rotas
app.get('/', (req, res) => {
  res.render('index', { title: 'Inicio' });
});

app.get('/sobre', (req, res) => {
  res.render('sobre', { title: 'Sobre' });
});

app.get('/contato', (req, res) => {
  res.render('contato', { title: 'Contato' });
});



// Rotas principais dos destinos
app.get('/jericoacoara', (req, res) => {
  res.render('jericoacoara', { title: 'Jericoacoara' });
});

app.get('/3praias', (req, res) => {
  res.render('3praias', { title: '3 Praias' });
});

app.get('/canoaquebrada', (req, res) => {
  res.render('canoaquebrada', { title: 'Canoa Quebrada' });
});

app.get('/guaramiranga', (req, res) => {
  res.render('guaramiranga', { title: 'Guaramiranga' });
});

app.get('/mundaueflecheiras', (req, res) => {
  res.render('mundaueflecheiras', { title: 'Mundaú e Flecheiras' });
});

app.get('/lagoinha', (req, res) => {
  res.render('lagoinha', { title: 'Lagoinha' });
});




const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta: ${PORT}`);
});
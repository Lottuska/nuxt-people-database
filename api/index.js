// api/index.js

const express = require('express')

const app = express()
app.use(express.json())
app.use(express.urlencoded({ extended: false }))

// Connect to database
// Fill with your own credentials!
var mysql = require('mysql')
var connection = mysql.createConnection({
  host: '',
  user: '',
  password: '',
  database: ''
})

connection.connect()

// Get all people
app.get('/people', function (req, res) {
  var sql = "SELECT * FROM people";
  connection.query(sql, function (err, rows) {
    if (err) throw err
    res.send(rows)
  })
})

// Add a new person
app.post('/newperson', function (req, res) {
  var sql = "INSERT INTO people (firstname, lastname, birthday) VALUES ('"+req.body.firstname+"', '"+req.body.lastname+"', '"+req.body.birthday+"')";
  connection.query(sql, function (err, rows) {
    if (err) throw err
    res.send(rows)
  })
})

// Edit selected person
app.post('/editperson', function (req, res) {
  var sql = "UPDATE people SET firstname='"+req.body.firstname+"', lastname='"+req.body.lastname+"', birthday='"+req.body.birthday+"' WHERE id="+req.body.id;
  connection.query(sql, function (err, rows) {
    if (err) throw err
    res.send(rows)
  })
})

// Delete selected person
app.post('/deleteperson', function (req, res) {
  var sql = "DELETE FROM people WHERE id="+req.body.id;
  connection.query(sql, function (err, rows) {
    if (err) throw err
    res.send(rows)
  })
})

// Show pets related to owner
app.post('/pets', function (req, res) {
  var sql = "SELECT pets.*, pet_species.id as specie_id, pet_species.name as specie_name FROM pets INNER JOIN pet_species ON pets.specie = pet_species.id WHERE ownerid="+req.body.ownerid;
  connection.query(sql, function (err, rows) {
    if (err) throw err
    res.send(rows)
  })
})

// Show pet species
app.get('/petspecies', function (req, res) {
  var sql = "SELECT * FROM pet_species";
  connection.query(sql, function (err, rows) {
    if (err) throw err
    res.send(rows)
  })
})

// Add a new pet
app.post('/newpet', function (req, res) {
  var sql = "INSERT INTO pets (name, specie, ownerid) VALUES ('"+req.body.name+"', '"+req.body.specieid+"', '"+req.body.ownerid+"')";
  connection.query(sql, function (err, rows) {
    if (err) throw err
    res.send(rows)
  })
})
  
  
export default {
  path: '/api',
  handler: app
}
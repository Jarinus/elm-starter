require('../scss/app.scss')
var Elm = require('../../App.elm')

var node = document.getElementById('app')
var app = Elm.App.embed(node);

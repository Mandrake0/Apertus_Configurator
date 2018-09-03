
var list = []
var db

var url = 'http://127.0.0.1:5500/json/data.json';


fetch(url)
    .then(res => res.json())
    .then((out) => {
        list = out
    })
    .catch(err => { throw err })

// Mixin Setup with the values
var SharedMixin = {
    observable: riot.observable(),
    listview: false
}


// Creates the Data Object and the Interface when everything got loaded
window.onload = () =>{
    // Set DB
    db = new ObjAPI()
    // Mounting all Riot Tags
    riot.mount('*')
}
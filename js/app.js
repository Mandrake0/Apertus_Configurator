
class ObjAPI{

    constructor(){
        this.data = list
    }

    queryItems(objectType, objectValue){
        var matches = [], i, key
        var arr = this.data
        var typeofValue = typeof(objectValue)
        // String Value
        if (typeofValue === 'string'){
            for (let i = 0; i < arr.length; i++) {
                if( arr[i].hasOwnProperty(objectType) && arr[i][objectType].indexOf(objectValue) > -1 ){
                    matches.push( arr[i] )  // Add Array to List
                }
            }
        }
        // Object Value
        if (typeofValue === 'object'){
            objectValue.forEach(element => {
                for (let i = 0; i < arr.length; i++) {
                    if( arr[i].hasOwnProperty(objectType) && arr[i][objectType].indexOf(element) > -1 ){
                        matches.push( arr[i] )  // Add Array to List
                    }
                }
            });
        }
        return matches
    }

    querySelection(objectId, objectType, objectValue){
        var matches = [], i, key
        var arr = this.data
        var typeofValue = typeof(objectValue)
        // String Value
        if (typeofValue === 'string'){
            for (let i = 0; i < arr.length; i++) {
                if( arr[i].hasOwnProperty(objectType) && arr[i][objectType].indexOf(objectValue) > -1 ){
                    matches.push( arr[i] )  // Add Array to List
                }
            }
        }
        return matches
    }

    deleteItems(){
        this.data = []
    }

    addItem(objectArray){
        this.data.push(objectArray)
    }
}

var list = []
var db;

let url = 'http://127.0.0.1:5500/json/data.json';

fetch(url)
.then(res => res.json())
.then((out) => {
    list = out
})
.catch(err => { throw err });

class CustomWebSocket {

    constructor(url){
        this._ws = new WebSocket(url)
    }
    
    onmessage(){
        this._ws.onmessage = function(event){
            console.log(event)
        }
    }
    sendMessage(){
        this._ws.onopen = function(){
            this._ws.send("hello")
        }
    }

}

// Creates the Data Object and the Interface when everything got loaded
window.onload = function(){
    // Set DB
    db = new ObjAPI()
    // Mounting all Riot Tags
    riot.mount('*')
}
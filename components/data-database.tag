<data-database>
<script>

// local 
var self = this

// Mixin
this.mixin(SharedMixin)

this.data = []
this.url = 'http://127.0.0.1:5500/json/data.json';


this.observable.on('DB_loadDatabase', function() {
    console.log("data base load")
    fetch(self.url)
        .then(res => res.json())
        .then((out) => {
            self.data = out
            self.observable.trigger('DB_databaseLoaded')
        })
        .catch(err => { throw err })
})
    
/**
 * Database Handling
 */

this.observable.on('DB_queryItems', function(trigger, objectType,  objectValue){
    var matches = [], i, key
    var arr = self.data
    var typeofValue = typeof(objectValue)
    // String Value
    if (typeofValue === 'string'){
        for (let i = 0; i < arr.length; i++) {
            if( arr[i].hasOwnProperty(objectType) && arr[i][objectType].search(new RegExp(objectValue, "i")) > -1 ){
                matches.push( arr[i] )  // Add Array to List
            }
        }
    }
    // Object Value
    if (typeofValue === 'object'){
        objectValue.forEach(function(element) {
            for (let i = 0; i < arr.length; i++) {
                if( arr[i].hasOwnProperty(objectType) && arr[i][objectType].indexOf(element) > -1 ){
                    matches.push( arr[i] )  // Add Array to List
                }
            }
        });
    }
    self.observable.trigger(trigger, matches)
})


this.observable.on('DB_querySelection', function(trigger, object,  objectValue){
    var matches = [], i, key
    var arr = object
    console.log(objectValue, object)
    // if (objectValue === ''){
    //     return arr
    // }
    for (let i = 0; i < arr.length; i++) {
        console.log(objectValue)
        if( arr[i].search(new RegExp(objectValue, "i")) > -1 ){
            var arrayItem = {name: arr[i]}
            matches.push( arrayItem )  // Add Array to List
        }
    }
    self.observable.trigger(trigger, matches)
})

this.observable.on('DB_updateItem', function(updatedItem){
        var arr = self.data
        for (let i = 0; i < arr.length; i++) {
            //console.log(arr[i].name)
            if (arr[i]._id === updatedItem._id){
                arr[i].value = updatedItem.value
            }
        }
        console.log(self.data)
    })

this.observable.on('DB_deleteItems', function(){
        self.data = []
    })

this.observable.on('DB_addItem', function(objectArray){
        self.data.push(objectArray)
    })







</script>
</data-database>
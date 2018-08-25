// Custom Database Handler
class PDB{

    
    constructor(databaseName='mypouchdb'){
        //var PouchDB = require('pouchdb');
        //PouchDB.plugin(require('pouchdb-find'));
        
        
        this.db = new PouchDB(databaseName)
    }

    get(){
        this.db.get('mydoc').then(function (doc) {
            console.log(doc)
        }).catch(function (err) {
            console.log(err);
        })
    }

    //Retrieving all the documents
    getAll(){
        this.db.allDocs(function(err, docs) {
            if (err) {
                return console.log(err);
            } else {
            console.log (docs.rows);
            }
        });
    }
    
    //Retrieving all the documents
    // TODO Current Setup is not ideal
    deleteAll(){
        var self = this
        var delList = []
        this.db.allDocs(function(err, docs) {
            if (err) {
                return console.log(err);
            } else {
                docs.rows.forEach(element => {
                    if (err) {
                        return console.log(err);
                    } else {
                        console.log(element)
                        delList.push({_id : element.id, _rev : element.value.rev, _deleted : true});
                    }
                });
                self._del(delList)
            }
        });
    }   

    _del(list){
        //Deleting Documents
        console.log(list)
        this.db.bulkDocs(list, function(err, response) {
            if (err) {
                return console.log(err);
            } else {
                console.log(response+"Documents deleted Successfully");
            }
        });
    }
        

    // Add / Update Array Value in DB
    put(value){
        this.db.put(value).then(function (response) {
            console.log(response)
          }).catch(function (err) {
            console.log(err)
          })
    }

    // Deleting Local Database on the Client IndexedDB  
    deleteDB(){
        this.db.destroy().then(function(response){
            console.log("sucesfully Deleted")
            console.log(response)
        }).catch(function(err){
            console.log('delete DB Error!')
            console.log(err)
        })
    }
    infoDB(){
        this.db.info().then(function (result) {
            console.log(result)
        }).catch(function (err) {
            console.log(err);
        });
    }

    // Debug thing
    printDB(){
        console.log(this.db)
    }
}

var db = new PDB('axiomdb')
db.printDB()
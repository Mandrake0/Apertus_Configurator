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

    querySelection(object, objectValue){
        var matches = [], i, key
        var arr = object
        if (objectValue === ''){
            return arr
        }
        for (let i = 0; i < arr.length; i++) {
            if( arr[i].indexOf(objectValue) > -1 ){
                var arrayItem = {name: arr[i]}
                matches.push( arrayItem )  // Add Array to List
            }
        }
        return matches
    }

    updateItem(updatedItem){
        var arr = this.data
        for (let i = 0; i < arr.length; i++) {
            //console.log(arr[i].name)
            if (arr[i]._id === updatedItem._id){
                arr[i].value = updatedItem.value
            }
        }
        console.log(this.data)
    }

    deleteItems(){
        this.data = []
    }

    addItem(objectArray){
        this.data.push(objectArray)
    }
}
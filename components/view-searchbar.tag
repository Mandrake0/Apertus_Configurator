<view-searchbar>
    <!-- Layout -->
    <div>
        <!-- Search Bar -->
        <!-- TODO Needs to be fixed -->
        <div  class="form-search input-group">
            <input autofocus onkeydown={ quickEdit } oninput={ searchQuery } type="text" class="form-control" placeholder="Search">
            <div class="input-group-btn">
                <!--
                <button class="form-submit btn btn-default" type="submit">
                    <i class="material-icons">search</i>
                </button>
                -->
            </div>
        </div>
        <div show={ searchValue }  class="dropdown">
        <div class="dropdown-menu show" aria-labelledby="dropdownMenuButton">
            <div each={ searchResult, i in searchComponents } >
                <a class="dropdown-item" href="#">{ searchResult.name }</a>
            </div>
        </div>
        </div>
    </div>

<!-- Custom Style -->
<style>
    .form-search{
        margin: 5px;
        width: 400px;
    }
    .form-submit{   
    margin-top: 5px;
    padding-top: 3px;
    padding-bottom: 3px;
    }
    
</style>

<!-- Script -->
<script>
// local 
var self = this

// Mixin
this.mixin(SharedMixin)

//
this.searchComponents = []
self.searchValue = ''

// Fast Manipulation Edit
this.quickEditState = false
this.quickEditFistValue = []
quickEdit(e){
    var keyCode = e.code
    if (keyCode === "Tab"){
        // get first Object from the Search Result
        self.quickEditFistValue = self.searchComponents[0]
        // set Value
        e.srcElement.value = self.quickEditFistValue.name + " "

        // change quickedit State for getting array of values
        self.quickEditState = true
        // Set Focus on Input Element
        e.preventDefault()
    }
    // Not yet defined whats ideal usercase
    if (keyCode === "Space"){
        console.log("Space")    
    }
    // Clears the Search Input
    if (keyCode === "Escape"){
        console.log("Escape") 
        // Delete all Values and Update Screen (Not Ideal)
        e.srcElement.value = ""
        self.searchComponents = []
        self.searchValue = ""
        self.quickEditState = false
        self.update()   
    }
}
// Searching in the Database for the Items
searchQuery(e){
    if (!self.quickEditState){
        self.searchValue = e.srcElement.value
        self.searchComponents = db.queryItems('name', self.searchValue)
        self.update()
    }
    if (self.quickEditState){
        // Search Value
        var lengthValue = self.quickEditFistValue.name.length
        self.searchValue = e.srcElement.value.slice(lengthValue)
        // Query
        self.searchComponents = db.querySelection(self.quickEditFistValue['selection'].split(','), self.searchValue)
        // Resetting Values
        if(self.searchValue.length <= 1 ){
            self.quickEditState = false
            self.searchComponents = []
        }
        self.update()
    }
}

</script>

</view-searchbar>
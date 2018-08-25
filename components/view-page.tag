<view-page>
    <!-- Layout -->
    <nav class="navbar navbar-expand-lg navbar-light bg-lights">
        <a class="navbar-brand" href="#">
          <img src="/img/apertus_Logo.svg" width="50" height="30" class="d-inline-block align-top" alt="">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li each={item, i in pagelist} class="nav-item">
                    <a class="nav-link" onclick={ setPage }>{ item.name }<span class="sr-only">(current)</span></a>
                </li>
                <!-- Added to the end after the loop -->
                <!-- Add Tab 
                <li onclick={ makeUpdate } class="nav-item">
                    <a class="nav-link">
                        <i class="material-icons">add</i>
                    </a>
                </li>
                -->
                <!-- List View -->
                <li onclick={ setListView } class="nav-item">
                    <a class="nav-link">
                        <i class="material-icons">view_list</i>
                    </a>
                </li>
                <!-- App Settings -->
                <li class="nav-item">
                    <a class="nav-link">
                        <i class="material-icons">settings</i>
                    </a>
                </li>
                <li class="nav-item">
                    <!-- Search Bar -->
                    <!-- TODO Needs to be fixed -->
                    <div  class="input-group">
                        <input autofocus onkeydown={ quickEdit } oninput={ searchQuery } type="text" class="form-search form-control" placeholder="Search">
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
                </li>
            </ul>
        </div>
    </nav>

<!-- Load Components // Note: the full Object gets sendet to the Widget -->
<div>
    <div class="card-columns" each={ data, i in components }>
        <widget-card listview={ lview } data={ data } ></widget-card>
    </div>
</div>


<!-- Custom Style -->
<style>
    .form-search{
        margin-top: 5px;
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

// Getting all pages from ObjectList
this.pagelist = db.queryItems('type', 'page')

// Set Current Page
this.currentPage = this.pagelist[0] // Set Current Page
// Get All Objects with the ID 
this.components = db.queryItems('_id', this.currentPage.components)  
//
this.searchComponents = []
self.searchValue = ''

// Set Page 
setPage(e){
    var i = e.item.i
    self.currentPage = self.pagelist[i]
    self.components = db.queryItems('_id', self.currentPage.components) 
    self.update() 
}

// Set List View
this.lview = false
setListView(){
    self.lview = !self.lview 
    console.log(self.lview )
    self.update()
}


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
        self.searchComponents = db.queryItems('selection', self.searchValue)
        // Resetting Values
        if(self.searchValue.length <= 1 ){
            self.quickEditState = false
            self.searchComponents = []
        }
        self.update()
    }
}

</script>
</view-page>
<view-navbar>
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
                <li onclick={ setConfiguration } class="nav-item">
                    <a class="nav-link">
                        <i class="material-icons">settings</i>
                    </a>
                </li>
            </ul>
        </div>
    </nav>

<!-- Custom Style -->
<style>

</style>

<!-- Script -->
<script>
// local 
var self = this

// Mixin
this.mixin(SharedMixin)

// local Variable
this.pagelist = []

// On Load get first Page with the Components 
this.on('mount', function() {
    // Getting all pages from ObjectList
    self.pagelist = db.queryItems('type', 'page')
    self.update()
  })


// Set Page 
setPage(e){
    var i = e.item.i
    self.pagelist = db.queryItems('type', 'page')
    self.currentPage = self.pagelist[i]
    self.observable.trigger('loadPage', db.queryItems('_id', self.currentPage.components) )
    self.update() 
}
// Load Commads List (view-commands.tag)
setConfiguration(){
    self.observable.trigger('loadSetup')
}

// Set List View
setListView(){

    //self.listView = !self.listView 
    self.update()
}

</script>
</view-navbar>